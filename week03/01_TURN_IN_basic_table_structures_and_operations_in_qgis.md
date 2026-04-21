# Basic Table Structures & Operations in QGIS

## Overview

This lab walks you through a lookup-table join in QGIS using a soils polygon layer and a separate soil-properties table.

The main task is practical: inspect the key field, fix the field-type mismatch, perform the join, and use the joined attributes in a map.

## Getting Ready

Download the spatial data for this exercise:

- [https://github.com/mapninja/Earthsys144/raw/master/data/Soils.zip](https://github.com/mapninja/Earthsys144/raw/master/data/Soils.zip)

You will also need the soil properties table:

- [Soil Properties Google Sheet](https://docs.google.com/spreadsheets/d/1iD5DjOD3nREz_jGUGGMMLikyvq23z9LrmB6zJWiJBjM/edit?usp=sharing)

After downloading:

1. Unzip `Soils.zip`.
2. Keep the shapefile parts together in the same folder.
3. Use the `soils.shp` layer from that unzipped folder in this exercise.
4. Open the Soil Properties Google Sheet and download it as a CSV when you reach that step in the lab.

## Data for This Exercise

You will need:

- the `soils.shp` layer from `Soils.zip`
- the `Soil Properties.csv` table linked in this lab

In this workflow, many polygons in `soils.shp` share the same `SOIL_TYPE`, while the CSV has one row for each soil type.

## Part 1: Open the Soils Layer and Inspect Its Key Field

1. Open a new blank QGIS project.
2. Save it in the same folder as the soils data if possible.
3. Add the `soils.shp` layer.
4. Right-click the `soils` layer and choose **Layer CRS > Set Project CRS from Layer**.

![](images/Table_Operations_in_QGIS_pt3-9b3f50ab.png)

5. Open the **Layer Properties** for `soils`.
6. Go to the **Fields** tab and locate `SOIL_TYPE`.

![](images/20250422_094708_image.png)

This `SOIL_TYPE` field is the key field already present in the spatial data. It stores a short code for each polygon.

## Part 2: Symbolize the Existing Layer

1. Open the **Symbology** tab for the `soils` layer.
2. Set the renderer to **Categorized**.
3. Use `SOIL_TYPE` as the value field.
4. Click **Classify**.

![](images/Table_Operations_in_QGIS_pt3-9918960f.png)

You should now see multiple soil classes on the map.

> **Why do this now?** It helps you see that many polygons share the same `SOIL_TYPE` value. That is your visual clue that the spatial layer contains repeated foreign-key values rather than one unique record per soil type.

## Part 3: Download and Add the Soil Properties Table

Download the CSV table here:

- [Soil Properties Google Sheet](https://docs.google.com/spreadsheets/d/1iD5DjOD3nREz_jGUGGMMLikyvq23z9LrmB6zJWiJBjM/edit?usp=sharing)

1. Open the Google Sheet.
2. Use **File > Download > Comma-separated values (.csv)**.

![](images/Table_Operations_in_QGIS_pt3-df358de7.png)

3. Save the downloaded CSV in the same folder as your soils data.
4. In QGIS, use the **Browser** panel to find that CSV.
5. Right-click it and choose **Add Layer to Project**.
6. Open the table and inspect its fields and rows.

> **Concept note:** This table has no geometry, but it still matters spatially because it is designed to connect to mapped features through a shared code.

## Part 4: Check Whether the Join Fields Match

Now compare the join field in both datasets.

1. Open the `Soil Properties.csv` table.
2. Notice that the values are left-justified.

![](images/20250422_095927_image.png)

That is a clue that QGIS is reading them as text.

3. Open the **Properties** of the CSV table.
4. Go to the **Fields** tab.

![](images/20250422_101553_image.png)

5. Compare the type of the CSV's `SOIL_TYPE` field to the type of `SOIL_TYPE` in the `soils` layer.

> **Why this matters:** A join is not only about matching names. The fields should also match in type and formatting. Integer-to-integer is much safer than integer-to-text.

## Part 5: Create a Matching Integer Key Field

Because CSV files often import fields as text, you will create a new integer version of the key field.

1. Open the CSV table's attribute table.
2. Toggle editing on if needed.
3. Open the **Field Calculator**.
4. Choose **Create a new field**.
5. Name the field `SOIL_TYPE_INT`.
6. Search for the `to_int` function.
7. Build this expression:

```qgis
to_int( SOIL_TYPE )
```

![](images/20250422_104901_image.png)

8. Confirm that the preview looks correct.
9. Click **OK** to create the new field.
10. Save your edits and toggle editing off.

![](images/20250422_110520_image.png)

11. Reopen the table properties and confirm that `SOIL_TYPE_INT` is now a numeric field.

![](images/20250422_113422_image.png)

> **Concept note:** This kind of cleanup is sometimes called data carpentry. It may feel small, but it is part of good GIS practice. Clean keys make joins more reliable, and reliable joins make your analysis easier to trust.

## Part 6: Join the Table to the Spatial Layer

Now you are ready to connect the lookup table to the polygon layer.

1. Open the **Properties** for the `soils` layer.
2. Go to the **Joins** tab.
3. Add a new join.
4. Join the CSV table to `soils`.
5. Use the matching soil-type fields as the join fields.
   If needed, use `SOIL_TYPE` from the soils layer and `SOIL_TYPE_INT` from the CSV table.

![](images/20250422_114223_image.png)

6. Apply the join and close the dialog.
7. Open the attribute table for the `soils` layer.
8. Scroll to confirm that the new soil-property fields have been added.

![](images/20250422_114331_image.png)

> **What kind of join is this?** Many polygons in the `soils` layer are matching to one row in the soil-properties table for each soil type. From the perspective of the feature layer, this is a **many-to-one join**.

> **What is happening conceptually?** QGIS is not redrawing your polygons. It is enriching them by connecting each polygon's foreign key to a lookup record whose primary key defines the soil type.

## Part 7: Make the Join Useful

Once the join is in place, you can use the added fields for mapping.

1. Open the symbology for the `soils` layer again.
2. Create a **Categorized** map using the joined `NAME` field from the soil-properties table instead of the numeric `SOIL_TYPE` code.

This is one of the main reasons to perform a join: coded data becomes more human-readable and more useful for communication.

## Part 8: Turn the Joined Data into a Map

After you have completed the join, create a map layout as a PDF.

Your map should:

- display the soils layer categorized by the joined `NAME` field
- include the joined soil properties table in the layout
- include standard map elements such as title, name, CRS, scale, and basemap where appropriate

To insert the tabular information:

1. Open a new QGIS layout.
2. Use the **Add Attribute Table** tool ![](images/Table_Operations_in_QGIS_pt3-b59904a2.png) to place the soil properties table in the layout.
3. Use the table's **Item Properties** to clean up field names and formatting.

For the legend:

1. Uncheck **Auto update** if needed.
2. Click individual legend items to edit or remove them.
3. Use the edit control ![](images/Table_Operations_in_QGIS_pt3-afc821e7.png) if you want to improve labels.

The final result should look something like this:

![](images/Table_Operations_in_QGIS_pt3-078c73d6.png)

## Why This Workflow Matters

I want to stress the usefulness of what you have just done.

In GIS, you will often start with a preexisting boundary or feature layer and then join new tabular data to it. That joined data may represent:

- properties
- measurements
- classifications
- survey results
- administrative labels
- demographic summaries

Once joined, those attributes can be symbolized, filtered, summarized, and laid out on maps. This makes a single spatial dataset far more flexible than it would be on its own.

That is why table joins are such a foundational GIS skill: they are one of the main ways that the spatial dimensions of the things we are interested in become explicit, and analytically and communicatively useful.
