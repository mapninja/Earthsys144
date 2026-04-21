# Areal Interpolation of Attributes with QGIS

> **Turn-in for grading:** This lab includes material that must be turned in for grading. Complete the required deliverables and submit them as instructed by the course.

## Overview

This lab introduces **areal interpolation** in QGIS.

The main problem is a common one in GIS: we want to summarize population by **watershed basin**, but the population data is stored by **Census block group**. Those two boundary systems do not line up neatly. Some block groups fall entirely within one watershed, while others cross watershed boundaries.

To handle that mismatch, you will:

1. calculate the original area of each Census block group
2. split the block groups where they intersect watershed boundaries
3. calculate the area of the resulting child polygons
4. compute a weight based on the proportion of overlap
5. use that weight to estimate the share of population assigned to each watershed piece
6. summarize the weighted population by watershed

> **Concept note:** Areal interpolation is used when attributes are available for one set of polygons, but the analysis needs to be reported for a different set of polygons. In this lab, the key assumption is simple area weighting: if 40% of a block group's area falls inside a watershed, we will estimate that 40% of the block group's population belongs to that watershed piece.

## Getting Ready

You will need:

- the workshop dataset: [CT_Watershed_Data.gdb.zip](../data/CT_Watershed_Data.gdb.zip)
- the **Group Stats** QGIS plugin

### Download and unpack the data

1. Download [CT_Watershed_Data.gdb.zip](../data/CT_Watershed_Data.gdb.zip).
2. Unzip it somewhere stable on your computer.
3. Create a new project folder for this lab.
4. Save a new QGIS project in that folder as `areal_interpolation.qgz`.

### Install the Group Stats plugin

You will use **Group Stats** at the end of the lab to summarize weighted population by watershed.

1. In QGIS, go to **Plugins > Manage and Install Plugins**.
2. Search for `Group Stats`.
3. Install the plugin.

> **Concept note:** Group Stats works like a pivot table. It is useful when you need to group records by one field and summarize the values in another field.

## Data for This Exercise

From the geodatabase, you will use these layers:

- `CT_State_Boundary`
- `CT_Block_Groups`
- `CT_Major_Basins`

The important relationship is this:

- `CT_Block_Groups` contains the population attribute you want to redistribute
- `CT_Major_Basins` contains the watershed boundaries you want to report to

## Part 1: Add the Layers and Get Oriented

1. In the **Browser** panel, browse to the unzipped `CT_Watershed_Data.gdb`.
2. Drag these layers into the map canvas in this order:
   1. `CT_State_Boundary`
   2. `CT_Block_Groups`
   3. `CT_Major_Basins`
3. Open the **Layer Styling** panel.
4. Style `CT_Block_Groups` and `CT_Major_Basins` with **Transparent Fill** and a visible outline so you can compare the two boundary systems easily.

> **Concept note:** Before doing any geoprocessing, it is worth taking a minute to visually confirm the analytical problem. You should be able to see that many block groups do not align with watershed boundaries.

> Placeholder image: QGIS map canvas showing Connecticut block groups and major basins with transparent fills so the overlapping boundary systems are visible.

## Part 2: Calculate the Parent Area of the Block Groups

Before splitting the polygons, calculate the original area of each block group.

1. Open the **Attribute Table** for `CT_Block_Groups`.
2. Look through the available fields, especially the population field you will use later.
3. Open the **Field Calculator**.
4. Create a **new virtual field** named `P_AREA`.
5. Set the field type to **Whole number (integer)** or **Decimal number (real)**.
6. Use the expression:

```qgis
$area
```

7. Click **OK**.

> **Concept note:** `P_AREA` stands for **parent area**. This is the area of each intact source polygon before it gets split by the watershed boundaries.

> **Why a virtual field here?** For this workflow, a virtual field is a good choice because it lets you calculate and use the value immediately without altering the original source layer inside the geodatabase.

## Part 3: Use Union to Split the Block Groups by Watershed

Now create the overlap geometry that makes the weighting possible.

1. Open the **Processing Toolbox**.
2. Search for **Union** and open the tool.
3. Set:
   - **Input layer:** `CT_Major_Basins`
   - **Overlay layer:** `CT_Block_Groups`
4. Save the output to your project folder as `union.gpkg`.
5. Click **Run**.

This will produce a new layer containing the combined boundaries and attributes of both inputs.

> **Concept note:** The Union tool is doing the key spatial transformation in this lab. It creates new polygons wherever the source boundaries intersect. Those new polygons are the smaller units on which you can calculate overlap proportions.

> **Workflow note:** The union may take a little time because the block group polygons are fairly detailed.

## Part 4: Calculate the Child Area

Now measure the area of the new polygons created by the union.

1. Open the **Attribute Table** for the `union` layer.
2. Open the **Field Calculator**.
3. Create a **new field** named `CH_AREA`.
4. Use a numeric field type.
5. Use the expression:

```qgis
$area
```

6. Click **OK**.

> **Concept note:** `CH_AREA` stands for **child area**. These are the smaller pieces created after the original block groups were cut by watershed boundaries.

## Part 5: Exclude Records with Null Parent Area

Some polygons in the union result will not represent meaningful source polygons for the interpolation step. Remove those from the weight calculation.

1. In the `union` attribute table, click **Select features using an expression**.
2. Enter:

```qgis
"P_AREA" IS NULL
```

3. Click **Select Features**.
4. Inspect the selected polygons on the map.
5. In the attribute table, click **Invert Selection** so that the selected records are the polygons where `P_AREA` is **not** null.

> **Concept note:** The null records are usually slivers or pieces that do not carry a valid source-area value from the original block group layer. If you leave them in the weight calculation, you risk dividing by null and producing invalid results.

## Part 6: Calculate the Area Weight

Now calculate the proportion of each child polygon relative to its original parent polygon.

1. With the non-null records still selected, open the **Field Calculator**.
2. Create a new field named `WEIGHT`.
3. Use **Decimal number (real)** as the output type.
4. If available, check **Only update selected features**.
5. Use the expression:

```qgis
"CH_AREA" / "P_AREA"
```

6. Set a precision that keeps several decimal places.
7. Click **OK**.

> **Concept note:** A value of `1` means the original block group was not split at all for that record. A value smaller than `1` means only part of the block group's area falls in that watershed polygon.

## Part 7: Calculate Weighted Population

Now apply the area weight to the population attribute.

1. Open the **Field Calculator** again for the `union` layer.
2. Create a new field named `WT_POP`.
3. Use **Decimal number (real)** as the output type.
4. Use the expression:

```qgis
"WEIGHT" * "POP2004"
```

5. Click **OK**.
6. Save your edits if QGIS prompts you to do so.
7. Clear the selection.

> **Concept note:** `WT_POP` is the estimated population assigned to each child polygon after the area-based redistribution. This is the actual interpolated value you will summarize by watershed.

> **Important caution:** This method assumes population is spread evenly within each block group. That is rarely perfectly true in real life. Areal interpolation is an estimate, not a direct observation.

## Part 8: Summarize Weighted Population by Watershed

Now aggregate the interpolated values to the watershed level.

1. Open **Vector > Group Stats**.
2. Use the `union` layer as the input table if prompted.
3. Build the summary as follows:
   - **Rows:** `MAJOR`
   - **Values:** `WT_POP`
   - **Columns or statistic:** `sum`
4. Click **Calculate**.

The result should be a grouped summary table showing the estimated total population for each major basin.

> **Concept note:** This final step is where the interpolation becomes useful. Up to now, you have been preparing weighted pieces. Group Stats recombines those pieces by watershed so the results can be interpreted at the reporting geography you actually care about.

> Placeholder image: Group Stats window showing `MAJOR` watershed names in rows and the summed `WT_POP` values as the summary result.

## Optional Export Step

If you want to save the table for later use:

1. Select the results in **Group Stats**.
2. Use the plugin's export or save option to write the table to CSV.
3. Save it in your project folder with a clear name such as `ct_major_basins_weighted_population.csv`.

## Deliverable

Submit the following:

- a screenshot of the **Group Stats** results table showing the weighted population summarized by watershed

## What You Should Understand After This Lab

By the end of the exercise, you should be able to explain:

- why areal interpolation is needed when two polygon systems do not align
- why the union step creates the geometry needed for weighting
- why `CH_AREA / P_AREA` produces the area share used in the estimate
- why the final watershed population values are estimates rather than direct Census counts
