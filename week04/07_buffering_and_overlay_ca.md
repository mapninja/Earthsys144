# Buffering & Overlay Analysis in QGIS: California Replacement

> **Turn-in for grading:** This lab includes material that must be turned in for grading. Complete the required deliverables and submit them as instructed by the course.

## Overview

This lab is a California-based replacement for the earlier buffering and overlay exercise.

You will use three California datasets:

1. `California_Lakes`
2. `SHN_Lines`, the California State Highway Network lines
3. `CDFW_Public_Access_Lands_[ds3077]`

As in the original lab, you will:

1. create a fixed-distance buffer around transportation features
2. create a variable-distance buffer around lakes based on size class
3. combine those buffered layers with overlay tools
4. remove public-access lands from the final candidate areas

The main difference is that the California lakes dataset does not already contain a `SIZE_CLS` field, so you will create that classification yourself in QGIS using the `sfc_acres` field.

> **Concept note:** Buffering turns distance rules such as "near a highway" or "near a lake" into polygon layers that can be analyzed. Overlay analysis becomes useful when you need several spatial conditions to be true at the same time.

## Getting Ready

You will need:

- `California_Lakes` from [data.ca.gov](https://data.ca.gov/dataset/california-lakes)
- `SHN_Lines` from [State Highway Network Lines](https://data.ca.gov/dataset/state-highway-network-lines/resource/583d7297-a76f-4286-9c5c-a0d6defa98fe)
- `CDFW_Public_Access_Lands_[ds3077]` from [California GIS Open Data](https://gis.data.ca.gov/datasets/b3b6dd29b34247dbb2dd773ea17cc82d_0/explore?location=37.304465%2C-119.405679%2C6)

Create a new project folder for this lab and save a new QGIS project there as `buffering_overlay_ca.qgz`.

## Data for This Exercise

The suitability logic remains similar to the original lab:

1. candidate areas must be within `300 meters` of a state highway
2. candidate areas must also be within a lake buffer whose distance depends on lake size
3. final candidate areas must exclude public-access lands

Use these lake-buffer distances:

- `50 meters` for lakes with `SIZE_CLS = 1`
- `150 meters` for lakes with `SIZE_CLS = 2`
- `500 meters` for lakes with `SIZE_CLS = 3`

## Part 1: Create a Manageable California Study Area

Because these datasets cover all of California, start by creating a smaller study area before buffering and overlay.

1. Add `California_Lakes`, `SHN_Lines`, and `CDFW_Public_Access_Lands_[ds3077]` to QGIS.
2. Reproject the project to a projected CRS suitable for statewide California work, such as `NAD83 / California Albers` (`EPSG:3310`), so area and distance measurements use meters.
3. Zoom to a region of California you want to analyze.
4. Use **Vector overlay > Clip by extent** or **Extract/Clip by extent** to create subset layers for all three statewide datasets based on your map canvas extent.
5. Save the subset outputs with names such as:

- `CA_Lakes_subset.shp`
- `CA_Highways_subset.shp`
- `CA_Public_Access_subset.shp`

From this point forward, use the subset layers rather than the statewide originals.

> **Concept note:** This is a practical preprocessing step. The statewide source layers are much larger than the original lab data, so subsetting first makes the rest of the workflow faster and easier to interpret.

![Placeholder image: QGIS map canvas showing California statewide lakes, highways, and public-access lands, with a highlighted study-area extent box and the resulting subset layers listed in the Layers panel.](images/placeholder_buffering_overlay_ca_subset.png)

## Part 2: Create a Fixed-Distance Buffer Around State Highways

1. Add `CA_Highways_subset.shp` if it is not already in the project.
2. Open the **Processing Toolbox**.
3. Search for **Buffer** and open **Vector geometry > Buffer**.
4. Set:

- **Input layer:** `CA_Highways_subset`
- **Distance:** `300`
- **Dissolve result:** checked

5. Save the output as `HighwayBuffer300m.shp`.
6. Run the tool.

The dissolved highway buffer represents all land within 300 meters of a California state highway in your study area.

### Compare dissolved and undissolved results

Repeat the highway buffer once more, but:

1. keep the distance at `300`
2. leave **Dissolve result** unchecked
3. save as a temporary layer

Open the attribute tables for both outputs and compare them.

Ask yourself:

- how does the geometry differ
- how does the number of rows differ
- when would that difference matter later in the workflow

After you inspect the difference, remove the undissolved test layer.

> **Workflow note:** Dissolving is helpful here because the analysis is about being inside or outside the highway-proximity zone, not about which individual highway segment created the buffer.

## Part 3: Classify the California Lakes by Size

The California lakes dataset does not include the `SIZE_CLS` field used in the original lab, so you will create one from the `sfc_acres` field.

### Why use a custom classification

The `sfc_acres` values are highly right-skewed:

- minimum: `0.000269657`
- median: `0.518880`
- first quartile: `0.163256`
- third quartile: `3.453023`
- maximum: `233226`

Because the largest lakes are so much bigger than the typical lake, an equal-interval classification would place most features into the smallest class. For this lab, use the quartile-based breaks below to create three practical size classes:

- `SIZE_CLS = 1` for `sfc_acres <= 0.163256`
- `SIZE_CLS = 2` for `sfc_acres > 0.163256 AND sfc_acres <= 3.453023`
- `SIZE_CLS = 3` for `sfc_acres > 3.453023`

> **Concept note:** These breaks are not meant to represent "natural" lake types. They are a simple analytical classification that creates three useful buffer groups from a very uneven size distribution.

### Create the `SIZE_CLS` field

1. Open the attribute table for `CA_Lakes_subset`.
2. Start editing.
3. Open the **Field Calculator**.
4. Create a new whole-number field named `SIZE_CLS`.
5. Use this expression:

```qgis
CASE
    WHEN "sfc_acres" <= 0.163256 THEN 1
    WHEN "sfc_acres" <= 3.453023 THEN 2
    ELSE 3
END
```

6. Run the calculation.
7. Save your edits.

### Check the classification with native QGIS tools

1. Open the **Statistics** panel or use **Layer Properties > Source Fields** to inspect the `sfc_acres` field if you want to compare the class breaks with the provided summary statistics.
2. Open the attribute table and sort or filter by `SIZE_CLS`.
3. Confirm that all three classes are present.

If you want a quick visual check, use **Categorized** symbology on `SIZE_CLS`.

![Placeholder image: QGIS attribute table or categorized symbology panel showing the new SIZE_CLS field for California lakes, with classes 1, 2, and 3 derived from the sfc_acres field using the quartile-based thresholds.](images/placeholder_buffering_overlay_ca_size_class.png)

## Part 4: Create the Lake Buffer-Distance Field

Now assign the actual lake-buffer distances to the new lake size classes.

1. Open the attribute table for `CA_Lakes_subset`.
2. Start editing if needed.
3. Open the **Field Calculator**.
4. Create a new whole-number field named `buffdist`.
5. Use this expression:

```qgis
CASE
    WHEN "SIZE_CLS" = 1 THEN 50
    WHEN "SIZE_CLS" = 2 THEN 150
    ELSE 500
END
```

6. Run the calculation.
7. Save edits and stop editing.

Check that the `buffdist` field and `SIZE_CLS` field vary together as expected.

> **Concept note:** This is a common GIS workflow pattern. One field stores an analytical classification, and a second field turns that classification into a geometry rule the buffer tool can use.

## Part 5: Create a Variable-Distance Buffer Around Lakes

1. Open the **Buffer** tool again.
2. Set **Input layer** to `CA_Lakes_subset`.
3. Open the data-defined button to the right of the **Distance** parameter.
4. Choose the `buffdist` field as the distance source.
5. Check **Dissolve result**.
6. Save the output as `VarBuffLakes_CA.shp`.
7. Run the tool.

Arrange the highways, highway buffer, lakes, and lake buffer layers so you can compare the two proximity criteria visually.

![Placeholder image: QGIS map canvas showing California lakes in a local study area, the dissolved 300-meter highway buffer, and the variable-distance lake buffer drawn together for comparison.](images/placeholder_buffering_overlay_ca_buffers.png)

## Deliverable 1

Create and export a layout showing:

- California state highways in your study area
- lakes in your study area
- the highway buffer
- the variable-distance lake buffer

Include:

- a title
- your name
- a scale bar
- a legend

## Part 6: Prepare the Buffer Layers for Overlay

Now prepare the dissolved buffer layers so the overlay result is easier to interpret.

### Save a new copy of the project

1. Save the project to a new folder for the overlay section of the lab.
2. Give the copied project a name such as `overlay_analysis_ca.qgz`.

### Convert multipart buffers to singlepart features

1. Run **Multipart to singleparts** on `VarBuffLakes_CA`.
2. Save the output as `SingleLakeBuffers_CA.shp`.
3. Run **Multipart to singleparts** on `HighwayBuffer300m`.
4. Save the output as `SingleHighwayBuffers_CA.shp`.

Open the resulting attribute tables and confirm that each polygon now has its own row.

> **Concept note:** Multipart features can be awkward in overlay analysis because one row can represent several separate polygons. Singlepart output makes later selection and interpretation more direct.

### Clean the attributes and create inside-buffer flags

For `SingleLakeBuffers_CA`:

1. Open the attribute table.
2. Start editing.
3. Delete fields that are no longer useful for the overlay result if needed.
4. Create a new whole-number field named `inlakebuff`.
5. Assign a value of:

```qgis
1
```

to every row.
6. Save edits.

For `SingleHighwayBuffers_CA`:

1. Repeat the same process.
2. Create a field named `inhwybuff`.
3. Assign a value of:

```qgis
1
```

to every row.
4. Save edits and stop editing.

## Part 7: Remove Lake Interiors from the Lake Buffer

The lake buffer still includes the lake polygons themselves, but candidate sites should be on land near lakes, not in the water.

1. Open **Difference** from the **Processing Toolbox**.
2. Set:

- **Input layer:** `SingleLakeBuffers_CA`
- **Overlay layer:** `CA_Lakes_subset`

3. Save the output as `LakeBuffersOnly_CA.shp`.
4. Run the tool.

Verify that the result contains the buffer land around lakes but not the lake interiors.

> **Concept note:** This is an interpretation step as much as a geometry step. "Near a lake" should match the actual land area students are treating as potentially usable.

## Part 8: Use Union to Combine the Lake and Highway Criteria

1. Open **Union**.
2. Set:

- **Input layer:** `LakeBuffersOnly_CA`
- **Overlay layer:** `SingleHighwayBuffers_CA`

3. Save the output as `BufferUnion_CA.shp`.
4. Run the tool.

Open the attribute table and inspect the `inlakebuff` and `inhwybuff` fields.

You are looking for polygons where both equal `1`.

If you want to test one example first, select a row where:

```qgis
"inlakebuff" = 1 AND "inhwybuff" = 1
```

and zoom to it.

## Part 9: Select and Export Candidate Areas

1. In the `BufferUnion_CA` attribute table, open **Select features by expression**.
2. Use:

```qgis
"inlakebuff" = 1 AND "inhwybuff" = 1
```

3. Apply the selection.
4. Inspect the selected polygons on the map.
5. Right-click `BufferUnion_CA` and choose **Export > Save Selected Features As...**
6. Save the result as `Candidates_CA.shp`.

The `Candidates_CA` layer should represent places that are both:

- near lakes, based on lake size
- near California state highways

> **Concept note:** This is the central suitability-analysis move. The candidate polygons are the places where both spatial criteria are true at once.

## Part 10: Remove Public-Access Lands from the Candidate Areas

The final criterion is that these candidate areas should exclude the public-access lands layer.

1. Add `CA_Public_Access_subset.shp` if needed.
2. Open **Difference** again.
3. Set:

- **Input layer:** `Candidates_CA`
- **Overlay layer:** `CA_Public_Access_subset`

4. Save the output as `FinalCandidates_CA.shp`.
5. Run the tool.

Inspect the result and confirm that candidate polygons overlapping the public-access lands layer have been removed.

![Placeholder image: QGIS map canvas showing final California candidate polygons after subtracting public-access lands, with highways and lakes still visible for context.](images/placeholder_buffering_overlay_ca_final_candidates.png)

## Deliverable 2

Create and export a second layout that includes:

- highways
- lakes
- lands suitable under your lake and highway criteria after removing public-access lands

Include:

- a title
- your name
- a scale bar
- a legend
- a basemap if it helps interpretation without overwhelming the analysis result

## What You Should Understand After This Lab

By the end of this exercise, you should be able to explain:

- why a statewide dataset often needs to be subset before local analysis
- why the California lakes layer needed a derived `SIZE_CLS` field before variable buffering
- how a field such as `buffdist` can drive a data-defined buffer distance
- why `Difference` was needed before and after the overlay step
- how `Union` plus attribute selection produces a suitability-analysis result
