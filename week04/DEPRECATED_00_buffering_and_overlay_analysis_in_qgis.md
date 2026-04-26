# Buffering & Overlay Analysis in QGIS

> **Turn-in for grading:** This lab includes material that must be turned in for grading. Complete the required deliverables and submit them as instructed by the course.

## Overview

This lab walks through two closely related vector-analysis workflows in QGIS:

1. buffering
2. overlay analysis

You will first create:

1. a fixed-distance buffer around roads
2. a variable-distance buffer around lakes based on lake size

You will then combine those buffered layers to identify candidate campground areas that are:

1. close to roads
2. close to lakes
3. on private land rather than public land

> **Concept note:** Buffering turns a distance-based idea such as "near a road" into an actual polygon layer that can be analyzed. Overlay analysis matters because many GIS questions depend on more than one condition being true at the same time.

## Getting Ready

You will need:

- [L9.zip](../data/L9.zip)

### Download and unpack the data

1. Download [L9.zip](../data/L9.zip).
2. Unzip it somewhere stable on your computer.
3. Create a new project folder for this lab.
4. Save a new QGIS project in that folder as `buffering_overlay_analysis.qgz`.

## Data for This Exercise

The main layers are:

- `roads.shp`
- `lakes.shp`
- `public_Hugo.shp`

The suitability logic in this lab is:

1. areas must be within `300 meters` of a road
2. areas must also be within a lake buffer whose distance depends on lake size
3. final candidate sites must not fall on public land

Use these lake-buffer distances:

- `50 meters` for lakes with `SIZE_CLS = 1`
- `150 meters` for lakes with `SIZE_CLS = 2`
- `500 meters` for lakes with `SIZE_CLS = 3`

## Part 1: Create a Fixed-Distance Buffer Around Roads

1. Add `roads.shp` to your QGIS project.

![](images/20250422_153525_image.png)

2. Open the **Processing Toolbox** from **Processing > Toolbox**.
3. Search for **Buffer**.
4. Open **Vector geometry > Buffer**.

![](images/20250422_174803_image.png)

5. Set:

- **Input layer:** `roads`
- **Distance:** `300`
- **Dissolve result:** checked

6. Save the output as something like `roadsBuffer300m.shp`.
7. Run the tool.

![](images/20250422_175310_image.png)

The dissolved road buffer should look something like this when drawn below the roads layer:

![](images/20250422_175436_image.png)

> **Concept note:** A dissolved buffer merges overlapping polygons into one analytical zone. That makes sense here because the question is whether an area is inside the road buffer, not which single road segment created it.

### Compare dissolved and undissolved results

Now repeat the road buffer once more, but this time:

1. keep the distance at `300`
2. leave **Dissolve result** unchecked
3. leave the output as a temporary layer

![](images/20250422_180139_image.png)

Open the attribute tables for the dissolved and undissolved versions and compare them.

Ask yourself:

- how does the geometry differ
- how does the number of rows differ
- when would that difference matter for later analysis

![](images/20250422_180533_image.png)

After inspecting the difference, remove the undissolved test layer.

> **Workflow note:** Temporary layers are useful for experiments and intermediate checks, but they are not safe storage for anything you need later. Save permanent outputs once you know a result matters.

## Part 2: Create a Variable-Distance Buffer Around Lakes

Now create a lake buffer where the distance depends on each lake's size class.

The process has three parts:

1. add a field to hold the buffer distance
2. calculate that value by lake size class
3. use that field to drive the buffer distance

### Create and calculate the `buffdist` field

1. Add `lakes.shp` to the project and open its attribute table.
2. Use **Select features by expression** to select lakes where:

```qgis
"SIZE_CLS" = 1
```

![](images/20250422_202316_image.png)

![](images/20250422_202449_image.png)

3. Open the **Field Calculator**.
4. Create a new whole-number field named `buffdist`.
5. Check **Only update selected features**.
6. Assign the value:

```qgis
50
```

![](images/20250422_202757_image.png)

7. Repeat the same process for `SIZE_CLS = 2`, assigning:

```qgis
150
```

![](images/20250422_202902_image.png)

![](images/20250422_203228_image.png)

8. Repeat again for `SIZE_CLS = 3`, assigning:

```qgis
500
```

![](images/Buffering_Overlay-417487c9.png)

![](images/Buffering_Overlay-46357406.png)

9. Clear the selection using **Unselect all features**.
10. Save your edits and stop editing.

![](images/Buffering_Overlay-ea82b654.png)

![](images/Buffering_Overlay-f7d6212d.png)

Check that the table now shows larger `buffdist` values for larger lake size classes.

![](images/20250422_203504_image.png)

> **Concept note:** This is a useful GIS pattern: an attribute field can control a later geometry operation. Instead of applying one universal distance to all lakes, the lake type determines the spatial rule.

### Run the variable-distance buffer

1. Open the **Buffer** tool again.
2. Set **Input layer** to `lakes`.
3. Open the small data-defined button at the far right of the **Distance** parameter.

![](images/20250427_114203_image.png)

4. Choose the `buffdist` field as the source of the distance values.
5. Check **Dissolve result**.
6. Save the output as something like `VarBuffLakes.shp`.
7. Run the tool.

![](images/20250425_121047_image.png)

Arrange the roads, road buffer, lakes, and lake buffer layers so you can compare them visually.

![](images/20250422_205738_image.png)

## Deliverable 1

Create and export a layout showing:

- roads
- lakes
- the road buffer
- the variable-distance lake buffer

Include:

- a title
- your name
- a scale bar
- a legend

![](images/Burrering_Overlay-72ec483d.png)

## Part 3: Prepare the Buffer Layers for Overlay

Now that the two proximity layers exist, prepare them so the overlay result will be easier to interpret.

### Save a new copy of the project

1. Save the project to a new folder for the overlay portion of the lab.
2. Give the copied project a name such as `Overlay_Analysis.qgz`.

This leaves your first buffering project untouched while you continue into the suitability workflow.

### Convert multipart buffers to singlepart features

The dissolved buffer outputs are multipart features. That means one table row may represent several disconnected polygons.

1. Open the attribute table for `VarBuffLakes`.
2. Notice that the layer contains many polygons but very few rows.

![](images/20250425_121210_image.png)

3. Search for and open **Multipart to singleparts** in the **Processing Toolbox**.

![](images/20250425_121408_image.png)

4. Use `VarBuffLakes` as the input layer.
5. Save the output as `SingleLakeBuffers.shp`.
6. Run the tool.

![](images/20250425_121538_image.png)

7. Open the output attribute table and confirm that there is now one row per polygon.

![](images/20250425_121739_image.png)

Repeat the same process for the dissolved road buffer and save the result as something like `SingleRoadBuffers.shp`.

![](images/20250425_122525_image.png)

![](images/20250425_122913_image.png)

> **Concept note:** Multipart features can be awkward in overlay workflows because one row can stand for several different polygons. Converting to singlepart features makes later selection and interpretation much clearer.

### Clean the attributes and create inside-buffer flags

For `SingleLakeBuffers`:

1. Open the attribute table.
2. Toggle editing on.
3. Use **Delete field** to remove the existing fields if they are no longer useful for the overlay result.

![](images/Buffering_Overlay-e6fa45d2.png)

![](images/Buffering_Overlay-f567cbfd.png)

4. Create a new field named `inlakebuff`.
5. Assign a value of:

```qgis
1
```

to all rows.

![](images/20250425_121947_image.png)

![](images/Buffering_Overlay-a7f6a6f6.png)

For `SingleRoadBuffers`:

1. Repeat the same process.
2. Create a new field named `inroadbuff`.
3. Assign a value of:

```qgis
1
```

to all rows.

![](images/20250425_123835_image.png)

4. Save edits and stop editing on both layers.

> **Concept note:** These fields work like logical flags. After the overlay, they tell you whether a polygon is inside the lake buffer, the road buffer, or both.

## Part 4: Remove the Lake Interior from the Lake Buffer

The lake buffer currently includes the lake polygons themselves. Since campsites should be on land near lakes, remove the water area from the buffer.

1. Search for **Difference** in the **Processing Toolbox**.

![](images/20250425_124648_image.png)

2. Set:

- **Input layer:** `SingleLakeBuffers`
- **Overlay layer:** `lakes`

3. Save the output as `LakeBuffersOnly.shp`.
4. Run the tool.

![](images/20250425_124204_image.png)

Verify that the result contains the buffer area around lakes but not the lake interiors themselves.

![](images/20250425_124252_image.png)

> **Concept note:** "Near a lake" is not the same as "inside a lake." The geometry has to match the actual interpretation of the criterion.

## Part 5: Use Union to Combine the Lake and Road Criteria

Now combine the lake-buffer land area with the road buffer.

1. Search for and open **Union**.

![](images/20250425_124755_image.png)

2. Set:

- **Input layer:** `LakeBuffersOnly`
- **Overlay layer:** `SingleRoadBuffers`

3. Save the output as `BufferUnion.shp`.
4. Run the tool.

![](images/20250425_124841_image.png)

Open the attribute table for `BufferUnion` and inspect the `inlakebuff` and `inroadbuff` fields.

You are looking for polygons where both fields equal `1`.

1. Find a row where:

```qgis
"inlakebuff" = 1 AND "inroadbuff" = 1
```

2. Click the row number to select it.
3. Use **Zoom to Selected**.

![](images/20250425_125057_image.png)

![](images/Buffering_Overlay-40d205af.png)

You should see a polygon that satisfies both proximity criteria.

## Part 6: Select and Export Candidate Areas

1. In the `BufferUnion` attribute table, open **Select features by expression**.

![](images/Buffering_Overlay-7a6534b1.png)

![](images/20250427_114754_image.png)

2. Use the expression:

```qgis
"inlakebuff" = 1 AND "inroadbuff" = 1
```

3. Apply the selection.

The selected polygons should represent the places that are both near roads and near lakes.

![](images/20250427_114820_image.png)

4. Right-click `BufferUnion`.
5. Choose **Export > Save Selected Features As...**
6. Save the result as `Candidates.shp`.

![](images/20250427_114938_image.png)

Display the new `Candidates` layer and verify that it matches the selected areas.

![](images/20250427_115004_image.png)

Some of the selected records may still be multipart features. Use the manual selection tool to inspect a few polygons if needed.

![](images/Buffering_Overlay-209ecb06.png)

![](images/20250427_115037_image.png)

Clear your selection before continuing.

> **Concept note:** This is the heart of suitability analysis. The candidate polygons are not created by one input layer alone. They are the places where multiple spatial conditions are true at once.

## Part 7: Remove Public Lands from the Candidate Areas

We have one final condition: the campgrounds should be on private land.

1. Add `public_Hugo.shp` to the project.
2. Open **Difference** again.
3. Use:

- **Input layer:** `Candidates`
- **Overlay layer:** `public_Hugo`

4. Save the output as `FinalCandidates.shp`.
5. Run the tool.

![](images/20250427_115207_image.png)

The westernmost lakes should now show the public-land portions carved out of the candidate areas.

![](images/20250427_115321_image.png)

## Deliverable 2

Create and export a second layout that includes:

- roads
- lakes
- lands suitable for campgrounds on private land

Include:

- a title
- your name
- a scale bar
- a legend
- a basemap if it helps interpretation without overwhelming the analysis result

![](images/Buffering_Overlay-ec20e840.png)

## What You Should Understand After This Lab

By the end of this exercise, you should be able to explain:

- the difference between fixed-distance and variable-distance buffers
- why dissolved and undissolved buffers produce different analytical structures
- why multipart-to-singlepart conversion matters before overlay analysis
- why `Difference` was needed before combining the lake and road criteria
- how `Union` plus attribute selection produces a suitability-analysis result
