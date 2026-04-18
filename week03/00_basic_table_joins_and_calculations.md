# Basic Table Joins and Calculations in QGIS

## Overview

This lab introduces one of the most important ideas in GIS: a map layer is also a table.
When we work with spatial data, we are not only drawing counties, roads, or parcels on a map. We are also working with rows, columns, field names, and data types. That means many GIS tasks depend on understanding tables just as much as maps.

In this exercise, you will compare California county median household income for two years, `2000` and `2020`, by joining one county layer to another using a shared key field. Then you will calculate both the raw difference and the percent change between the two years, and finally create a choropleth map to show that change.

This matters because GIS analysis often depends on connecting data from multiple sources. Sometimes you join a shapefile to a spreadsheet. Sometimes you join a layer to another layer. In both cases, the basic idea is the same: QGIS treats the attribute tables as separate tables and links them through a shared field.

## Learning Objectives

By the end of this lab, you should be able to:

- Explain the difference between rows, columns, field names, and field types
- Explain what a key field is and why it matters for a join
- Explain the difference between a primary key and a foreign key
- Open and interpret the **Fields** tab in **Layer Properties**
- Open and use the **Attribute Table**
- Join one spatial layer to another using a shared key field
- Use the **Field Calculator** to create new numeric fields
- Calculate both absolute change and percent change
- Choose a reasonable choropleth classification for mapped values

## Data

Download the lab data from:

- [https://github.com/mapninja/Earthsys144/raw/master/data/TableBasics.zip](https://github.com/mapninja/Earthsys144/raw/master/data/TableBasics.zip)

After downloading:

- Unzip `TableBasics.zip`
- Keep the shapefiles and their related files together in the same folder
- Add the layers from the unzipped folder into QGIS

This lab uses two county polygon layers:

- `ca_county_2000_mhhinc`
- `ca_county_2020_mhhinc`

Each layer contains California counties and one median household income field:

- `MHHINC2000` in the 2000 layer
- `MHHINC2020` in the 2020 layer

Both layers also contain shared identifier fields including:

- `spatial_id`
- `name`

You should see these layers in the lab data folder and in QGIS as shown below.

![](images/20260418_154439_image.png)

## Conceptual Focus

### Rows, Columns, and Fields

Every feature in a GIS layer has geometry and attributes.

- A **row** represents one feature, such as one county.
- A **column** represents one variable, such as county name or median household income.
- A **field name** is the label at the top of a column, such as `MHHINC2000`.
- A **field type** tells QGIS what kind of values the field stores, such as text or decimal numbers.

### Key Fields and Joins

A **join** connects information from one table to another using a shared field.

The shared field is often called a **key field**. In relational database language:

- A **primary key** is a field whose values uniquely identify records in its own table.
- A **foreign key** is a field that refers to matching values in another table.

In practice, when you make a join in QGIS, you are telling the software:

"Match the row in one table to the row in another table wherever these key values are the same."

For this lab, `spatial_id` is the safest field to use as the join key because it is designed as an identifier. County names can sometimes vary in spelling, capitalization, punctuation, or abbreviations, so a more formal ID is usually a better join field.

### Why Join Two Shapefiles?

It is common to think of a join as something you do between a spreadsheet and a map layer. But joining one shapefile to another is conceptually the same thing. Each shapefile has its own attribute table. QGIS joins the tables first, and then displays the result through the geometry of the target layer.

In other words, even though both of these datasets are spatial layers, the join still happens through their tables.

### Choropleth Mapping

A **choropleth map** uses differences in color or shading to represent values across enumeration units such as counties or states.

Choropleth maps work best when:

- The units are comparable areas, such as counties
- The mapped variable is meaningful at that unit of aggregation
- The classification method is chosen carefully

For this lab, you will map change in median household income across counties. Because some counties changed much more than others, classification choices will strongly affect how the pattern looks.

For a thoughtful discussion of classification choices in choropleth mapping, see John Nelson's essay:

- [Telling Truth with Choropleth Maps](https://web.archive.org/web/20241226082540/http://uxblog.idvsolutions.com/2011/10/telling-truth.html)

## Part 1: Add the Layers and Inspect the Fields

1. Open QGIS and start a new project.
2. Use the **Browser** panel to locate the lab data folder.
3. Add both layers to the project:
   - `ca_county_2000_mhhinc.shp`
   - `ca_county_2020_mhhinc.shp`
4. Make sure both layers appear in the **Layers** panel.
5. Turn both layers on so you can confirm they cover the same set of California counties.

![](images/20260418_154439_image.png)

### Inspect the 2000 layer fields

1. Right-click `ca_county_2000_mhhinc`.
2. Choose **Properties**.
3. Click the **Fields** tab.

You should see fields including `spatial_id`, `name`, and `MHHINC2000`.

![](images/20260418_154309_image.png)

Notice that:

- `spatial_id` is stored as **Text (string)**
- `name` is stored as **Text (string)**
- `MHHINC2000` is stored as **Decimal (double)**

This tells you that the income field is numeric, which means it can be used in calculations.

### Inspect the 2020 layer fields

1. Close the first properties window.
2. Right-click `ca_county_2020_mhhinc`.
3. Choose **Properties**.
4. Click the **Fields** tab.

You should see a similar structure, but with `MHHINC2020` instead of `MHHINC2000`.

![](images/20260418_154251_image.png)

Pause here and compare the two tables:

- Both have `spatial_id`
- Both have `name`
- Each has one year-specific income field

That is exactly what makes a join possible.

## Part 2: Explore the Attribute Tables

1. Open the **Attribute Table** for `ca_county_2020_mhhinc`.
2. Scroll through the rows and columns.
3. Find the `MHHINC2020` field.
4. Note that the values vary substantially across counties.

For this dataset:

- `MHHINC2020` ranges from `41780` to `130890`

Now repeat the same process for `ca_county_2000_mhhinc`.

For that dataset:

- `MHHINC2000` ranges from `27522` to `74335`

### Why this matters

Before doing a join or a calculation, it is worth simply looking at the tables.

This helps you answer questions like:

- What are the field names?
- Which fields are numeric?
- Do the likely join fields match?
- What is the rough range of the values?

These are small checks, but they prevent many common GIS mistakes.

## Part 3: Run Basic Statistics for Fields

Before making the join, use one of QGIS' summary tools to confirm the distribution of values in each year.

1. Open the **Processing Toolbox**.
2. Search for **Basic statistics for fields**.
3. Run the tool for `ca_county_2020_mhhinc` using the field `MHHINC2020`.
4. Review the output in the **Results Viewer**.

You should get values close to the following:  
```
- COUNT: 58
- UNIQUE: 58
- EMPTY: 0
- FILLED: 58
- MIN: 41780
- MAX: 130890
- CV: 0.297786098407827
- SUM: 4124349
- MEAN: 71109.46551724138
- RANGE: 89110
- MEDIAN: 65055.5
- MINORITY: 41780
- MAJORITY: 41780
- STD_DEV: 21175.41029624522
- FIRSTQUARTILE: 54972
- THIRDQUARTILE: 84638
- IQR: 29666
```  
Now repeat the tool for `ca_county_2000_mhhinc` using the field `MHHINC2000`.

You should get values close to the following:
```
- COUNT: 58
- UNIQUE: 58
- EMPTY: 0
- FILLED: 58
- MIN: 27522
- MAX: 74335
- CV: 0.2653085128734548
- SUM: 2487970.4000000004
- MEAN: 42896.04137931035
- RANGE: 46813
- MEDIAN: 40895.5
- MINORITY: 27522
- MAJORITY: 27522
- STD_DEV: 11380.68494650301
- FIRSTQUARTILE: 34725
- THIRDQUARTILE: 51484
- IQR: 16759
```
### Why this matters

This tool gives you a quick numerical summary of the field you are about to analyze.
It helps you verify that:

- The field is numeric
- The layer has the expected number of records
- There are no empty values
- The spread of values looks reasonable

It also gives you a stronger basis for deciding how to classify the map later.

## Part 4: Select the Lowest-Income County in Each Layer

This section is designed to help you connect the table to the map.

### Find the lowest value in the 2020 layer

1. Open the `ca_county_2020_mhhinc` attribute table.
2. Locate the `MHHINC2020` field.
3. Sort the field in ascending order so the smallest value appears first.
4. Select the row with the lowest `MHHINC2020` value.
5. Use the **Zoom map to selected rows** tool in the attribute table.

### Find the lowest value in the 2000 layer

1. Open the `ca_county_2000_mhhinc` attribute table.
2. Locate the `MHHINC2000` field.
3. Sort the field in ascending order.
4. Select the row with the lowest `MHHINC2000` value.
5. Use the **Zoom map to selected rows** tool again.

### Reflect on what you see

The county with the lowest value in 2000 may not be the same county as the one with the lowest value in 2020.
That is one reason it is useful to bring both years into one joined layer and calculate change directly. Once both values are in the same table, you can compare them row by row rather than trying to mentally compare two separate layers.

## Part 5: Join the 2000 Table to the 2020 Layer

In this lab, you will use the `ca_county_2020_mhhinc` layer as the target layer and join the 2000 table to it.

That means the geometry will remain the counties from the 2020 layer, but the table will temporarily gain fields from the 2000 layer.

1. Right-click `ca_county_2020_mhhinc`.
2. Choose **Properties**.
3. Click the **Joins** tab.
4. Click the **Add Join** button.
5. Set the **Join layer** to `ca_county_2000_mhhinc`.
6. Set the **Join field** to `spatial_id`.
7. Set the **Target field** to `spatial_id`.
8. Click **OK**.
9. Click **OK** again to close **Layer Properties**.

### Concept note

Although both inputs are shapefiles, the join is still a table operation.
QGIS compares the values in the target layer's `spatial_id` field to the values in the join layer's `spatial_id` field. Wherever they match, it temporarily appends the joined attributes.

### Verify the join

1. Open the attribute table for `ca_county_2020_mhhinc`.
2. Scroll to the right.
3. Confirm that you can now see the joined 2000 fields, including `MHHINC2000`.

At this point, one table should contain:

- The 2020 income field
- The 2000 income field
- The shared ID field used to connect them

## Part 6: Calculate Absolute Change

Now that both year values are in the same table, you can calculate the difference.

1. Open the attribute table for `ca_county_2020_mhhinc`.
2. Click **Toggle Editing**.
3. Open the **Field Calculator**.
4. Choose **Create a new field**.
5. Name the field `mhhinc_diff`.
6. Set the output field type to **Decimal (double)**.
7. Use an output field length and precision that can hold the results, such as length `20` and precision `2`.
8. Enter this expression:

```qgis
"MHHINC2020" - "MHHINC2000"
```

9. Check the preview.
10. Click **OK**.

### What this means

This calculation subtracts the 2000 median household income from the 2020 median household income for each county.

- Positive values mean income increased.
- Negative values mean income decreased.
- Values near zero mean very little change.

## Part 7: Calculate Percent Change

Absolute change is useful, but percent change often tells a clearer story because it scales the change relative to the starting value.

1. Open the **Field Calculator** again.
2. Choose **Create a new field**.
3. Name the field `pct_change`.
4. Set the output field type to **Decimal (double)**.
5. Use a reasonable length and precision, such as length `20` and precision `2`.
6. Enter this expression:

```qgis
(("MHHINC2020" - "MHHINC2000") / "MHHINC2000") * 100
```

7. Check the preview.
8. Click **OK**.
9. Save your edits.
10. Toggle editing off.

### Why percent change can be more meaningful

Suppose two counties each changed by `$10,000`.

- If one started at `$30,000`, that change is proportionally large.
- If one started at `$120,000`, that same change is proportionally smaller.

Percent change helps capture that difference.

## Part 8: Map the Change

Now create a choropleth map from one of your new fields.

The best field for the final map is usually `pct_change`, because it allows comparison across counties with different starting values.

1. Open the **Layer Styling** panel for `ca_county_2020_mhhinc`.
2. Change the symbology from **Single Symbol** to **Graduated**.
3. Set the **Value** field to `pct_change`.
4. Choose a color ramp that makes change easy to interpret.

If your data include both positive and negative values, a diverging ramp is often appropriate because it visually separates decreases from increases.

5. Experiment with classification methods such as:
   - **Quantile**
   - **Natural Breaks (Jenks)**
   - **Equal Interval**
6. Try several class counts, such as `5`, `6`, or `7`.
7. Compare how the mapped pattern changes.

### Classification reflection

There is no universally correct classification for every choropleth map.
Different methods emphasize different aspects of the distribution.

As you test classifications, ask:

- Does this map exaggerate differences?
- Does it hide important variation?
- Are the class breaks understandable?
- Does the map help a reader see a meaningful pattern?

This is the central design question in choropleth mapping.

## Part 9: Check Specific Counties

After symbolizing the map, use the attribute table and map together to examine a few counties more closely.

1. Sort the `pct_change` field from highest to lowest.
2. Select one of the counties with the largest increase.
3. Zoom to it on the map.
4. Repeat with one of the smallest values.
5. Compare the raw values:
   - `MHHINC2000`
   - `MHHINC2020`
   - `mhhinc_diff`
   - `pct_change`

This is a good reminder that maps summarize patterns, but the table gives you the exact values behind the symbols.

## To Turn In

Create and export one map showing county-level change in median household income in California.

Your map should include:

- A clear title
- The county layer symbolized by `pct_change`
- A legend
- Your name
- A basemap only if it helps rather than distracts
- Enough visual contrast to make the county patterns readable

You should also be prepared to answer these questions:

1. What field did you use as the join key, and why?
2. Why is joining one shapefile to another still a table operation?
3. What is the difference between absolute change and percent change?
4. Why did you choose the classification method you used for the choropleth map?

## Wrap-Up

This lab introduced several foundational GIS ideas at once:

- Spatial layers contain attribute tables
- Table structure matters for GIS analysis
- Joins depend on shared key fields
- Calculations depend on correct field types
- Choropleth maps depend on thoughtful classification choices

These ideas show up constantly in GIS work.
If you are comfortable moving between the map, the layer properties, and the attribute table, you are building one of the core habits of spatial analysis.
