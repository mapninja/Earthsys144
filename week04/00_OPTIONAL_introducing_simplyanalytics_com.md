# OPTIONAL Workshop: Introducing SimplyAnalytics.com

> **Optional workshop:** This activity is provided as practice and background support. It is not a Week 04 turn-in unless your instructor separately asks you to submit it.

## Overview

This optional workshop introduces **SimplyAnalytics** as a source of county-level demographic and consumer data, then brings that exported data back into QGIS for spatial analysis.

The workflow is intentionally a little strange and a little fun: you will build a county dataset for the United States containing population and **annual beer consumption per capita**, then join a national **Bigfoot sightings** point layer to counties by location.

From there, the exercise splits into two possible endings:

1. a map workflow that calculates and maps **Bigfoot sightings per capita**

> **Concept note:** This workshop is less about proving anything meaningful about Bigfoot and more about practicing a real GIS pattern: acquire polygon data from an external reporting platform, enrich it with point events by location, then test and map possible spatial relationships.

## Getting Ready

You will need:

- access to [SimplyAnalytics](https://simplyanalytics.com)
- Stanford network access, either:
  - on a Stanford IP address, or
  - through the Lean Library browser plugin
- the local point dataset: [Bigfoot_Sightings.zip](../data/Bigfoot_Sightings.zip)

### Access SimplyAnalytics

1. Go to [https://simplyanalytics.com](https://simplyanalytics.com).
2. If you are off campus, make sure you are using the **Lean Library** access route or another Stanford-approved access path.
3. Create an account using your Stanford credentials if you have not already done so.

> **Workflow note:** Many licensed Stanford data platforms depend on institutional authentication. If SimplyAnalytics does not appear to give you full access, first check whether you are on Stanford IP space or whether Lean Library is active in your browser.

## Part 1: Build a County-Level Dataset in SimplyAnalytics

Your goal in SimplyAnalytics is to create a U.S. county-level dataset containing at least these variables:

- total population
- annual beer consumption per capita

### Create the report

1. In SimplyAnalytics, log in and start a new map, project, or report workflow.
2. Choose the **United States** as your study area.
3. Set the geography/reporting unit to **County**.
4. Open the variable search or data browser panel.
5. Search for `population` and add a total population field to the report.
6. Search for `beer` and look for a variable that reports **annual beer consumption per capita**.
7. Add that beer-consumption variable to the same county-level report.
8. Confirm that your results table is showing one row per U.S. county and that both variables appear as columns.

If the interface gives you separate places to define **geography**, **variables**, and **visualization**, the general sequence should be:

1. choose **United States**
2. choose **Counties**
3. add the variables
4. switch to the table view to confirm the output structure

### A more specific workflow to follow in the interface

Because SimplyAnalytics changes its interface occasionally, use this sequence as your guide even if button names differ slightly:

1. After login, create a **new project**, **new map**, or **new report**.
2. Look for a geography selector and set:
   - **Country:** `United States`
   - **Geography level:** `County`
3. Open the data-variable search.
4. Add a population variable first so you have a basic demographic column.
5. Then search consumer or expenditure variables for `beer`.
6. Choose the variable that most clearly corresponds to **annual beer consumption per capita**.
7. Add it to the same report.
8. Open the table view and scan a few records to make sure:
   - counties are the rows
   - population is one column
   - beer consumption per capita is another column

> **Workflow note:** If SimplyAnalytics returns too many variable choices, prefer the one whose wording most explicitly includes both `beer` and `per capita`. Write down the exact variable name you selected so you can cite it later in your map or notes.

### Check the output before export

Before exporting, make sure:

- the geography is **county**, not state, ZIP code, tract, or block group
- the table is for the **United States**
- both selected variables are present
- the county names and identifiers look complete
- there are no obvious filters limiting the table to only one region

### Export the county data

1. Use the export or download option for the report.
2. Choose a format that includes geometry, ideally **Shapefile**.
3. If SimplyAnalytics asks whether to export the current geography, make sure it is exporting the **county geography** and not just a non-spatial table.
4. Save the download somewhere stable in your Week 04 project folder.
5. Unzip the exported shapefile package if necessary.

> **Workflow note:** If the platform does not give you a shapefile export in the exact screen you are using, look for an option to export the mapped geography rather than only the table. The important outcome is a county polygon dataset with your selected attributes attached.

> **Concept note:** External reporting platforms like SimplyAnalytics are useful because they package demographic and consumer variables into ready-to-map geographic units. In GIS terms, they are often giving you an already-attributed polygon layer.

## Part 2: Add the County and Bigfoot Data to QGIS

Now move the exported data into QGIS and combine it with the Bigfoot points.

1. Start a new QGIS project and save it in your Week 04 project folder.
2. Add the county shapefile you exported from SimplyAnalytics.
3. Download and unzip [Bigfoot_Sightings.zip](../data/Bigfoot_Sightings.zip).
4. Add the Bigfoot sightings point layer to the map.
5. Inspect both attribute tables so you know which layer is polygon data and which layer is event-point data.

> **Concept note:** The county layer is your reporting geography. The Bigfoot layer is an event dataset. Since the sightings are points and the beer data is by county polygon, the relationship between them has to be created spatially.

## Part 3: Count Bigfoot Sightings by County with a Spatial Join

Use a join-by-location workflow to count how many sightings fall inside each county.

1. Open the **Processing Toolbox**.
2. Search for **Join attributes by location (summary)**.
3. Set:
   - **Input layer:** the county polygons from SimplyAnalytics
   - **Join layer:** the Bigfoot sightings points
4. Use an intersect or within-style spatial relationship so each county receives the points located inside it.
5. In the summary options, calculate the **count** of joined Bigfoot points.
6. Save the result as a new county layer, something like `counties_bigfoot_joined.gpkg`.

Open the resulting attribute table and confirm that each county now has a field representing the number of Bigfoot sightings within that county.

> **Concept note:** This is a classic point-in-polygon aggregation. The point data is being summarized up to the polygon unit by location, not by any shared attribute key.

## Part 4: Calculate Bigfoot Sightings Per Capita

Now create a normalized variable so the result is not just dominated by the largest-population counties.

1. Open the **Field Calculator** on the joined county layer.
2. Create a new decimal field named something like `bf_percap`.
3. Build an expression that divides the Bigfoot sighting count by total population.

Depending on your field names, this will look something like:

```qgis
"bigfoot_count" / "population"
```

If you prefer a more readable rate, you can also calculate sightings per 100,000 residents:

```qgis
("bigfoot_count" / "population") * 100000
```

4. Save the new field.

> **Concept note:** Per-capita normalization matters because raw counts often reflect where more people live, not where a phenomenon is disproportionately common.

## Part 5: Map Bigfoot Sightings Per Capita

If you complete the full optional workflow, you should have a county layer with:

- population
- beer consumption per capita
- Bigfoot sighting count
- Bigfoot sightings per capita

Create a choropleth map showing the rate of Bigfoot sightings per capita.

1. Use the joined county layer as your map layer.
2. Open the **Layer Styling** panel.
3. Choose **Graduated** symbology.
4. Use the `bf_percap` field or your rate field as the value.
5. Choose a classification method and color ramp that make the pattern readable.
6. Create a layout and export a final map.

## Optional Practice Output

If you want to keep a record of your practice work, save:

- a final map of **Bigfoot sightings per capita by county**

### What to Think About

As you interpret the map, consider:

- whether raw counts and per-capita rates tell the same story
- whether rare-event mapping becomes unstable in low-population counties
- whether the mapped pattern looks regionally clustered

## Suggested Map/Layout Elements

Include:

- a title
- your name
- a legend
- a scale bar if appropriate
- a short note describing the main mapped variable

## What You Should Understand After This Workshop

By the end of this exercise, you should be able to explain:

- how an external reporting platform can provide ready-to-map polygon data
- how a spatial join can aggregate point events to counties
- why per-capita normalization changes interpretation
