# Buffering & Overlay Analysis in QGIS

> **Turn-in for grading:** This lab includes material that must be turned in for grading. Complete the required deliverables and submit them as instructed by the course.

## Overview

This lab introduces two foundational vector-analysis workflows in QGIS:

1. **buffering**, which creates zones around features based on distance
2. **overlay analysis**, which combines multiple spatial criteria into a new analytical result

You will use both techniques to build a simple suitability analysis. The scenario is that we want to identify potential recreation or campground areas that are:

- close to roads
- close to lakes
- outside the lakes themselves

In the second part of the workflow, you will combine the road and lake criteria to identify candidate polygons that satisfy both conditions.

> **Concept note:** Buffering is one of the most common GIS operations because many spatial questions are really proximity questions. Overlay analysis matters because real site-selection problems usually depend on more than one criterion at the same time.

## Getting Ready

You will need the workshop dataset:

- [L10.zip](../data/L10.zip)

### Download and unpack the data

1. Download [L10.zip](../data/L10.zip).
2. Unzip it somewhere stable on your computer.
3. Create a project folder for this lab.
4. Save a new QGIS project in that folder as `buffering_overlay_analysis.qgz`.

### Data for This Exercise

The original lab uses three main layers:

- `roads.shp`
- `lakes.shp`
- `public_Hugo.shp`

This workflow focuses primarily on the roads and lakes layers. The public-lands layer may be used later if you extend the suitability analysis further.

## Suitability Criteria

The suitability logic in this lab is:

1. areas must be within `300 meters` of a road
2. areas must also be close to lakes, but the lake buffer distance depends on lake size
3. candidate sites should be on land, not inside the lake polygons

Use these lake-buffer distances:

- `50 meters` for lakes in size class `1`
- `150 meters` for lakes in size class `2`
- `500 meters` for lakes in size class `3`

## Part 1: Create a Fixed-Distance Buffer Around Roads

Start with a standard fixed-distance buffer.

1. Add `roads.shp` to your QGIS project.
2. Open the **Processing Toolbox**.
3. Search for **Buffer** and open **Vector geometry > Buffer**.
4. Set:
   - **Input layer:** `roads`
   - **Distance:** `300`
5. Check **Dissolve result**.
6. Save the output to your project folder with a name such as `roadsBuffer300m.gpkg`.
7. Run the tool.

You should now have a dissolved road buffer that represents all land within 300 meters of a road.

> **Concept note:** A dissolved buffer merges overlapping buffer polygons into one generalized zone. That is useful when the analytical question is simply "inside or outside the road buffer," rather than "which individual road segment created this buffer."

### Compare dissolved and undissolved results

Now repeat the buffer once more, but compare the geometry and table structure.

1. Open the **Buffer** tool again.
2. Use `roads` as the input layer.
3. Keep the distance at `300`.
4. This time, leave **Dissolve result** unchecked.
5. Leave the output as a temporary layer or save it as a clearly named test layer.
6. Run the tool.
7. Open the attribute table for both buffer outputs and compare them.

As you compare them, ask:

- How does the geometry differ?
- How does the number of rows differ?
- In what kinds of analysis would dissolved versus undissolved results matter?

After you inspect the difference, you can remove the undissolved test layer.

> **Workflow note:** Temporary layers are useful for experiments and intermediate results, but they are not a safe place to keep anything you need long-term. Save permanent outputs when the result will matter later in the workflow.

## Part 2: Create a Variable-Distance Buffer Around Lakes

Now build a buffer whose distance depends on each lake's size class.

1. Add `lakes.shp` to the project.
2. Open its **Attribute Table**.
3. Start an edit session if needed.

### Create the buffer-distance field

1. Use **Select features by expression** to select lakes where:

```qgis
"SIZE_CLS" = 1
```

2. Open the **Field Calculator**.
3. Create a new integer field named `buffdist`.
4. Check **Only update selected features**.
5. Assign the value:

```qgis
50
```

6. Apply the calculation.

Now repeat the same logic for the other size classes:

- select `"SIZE_CLS" = 2` and assign `150` to `buffdist`
- select `"SIZE_CLS" = 3` and assign `500` to `buffdist`

7. Clear the selection.
8. Save your edits.

> **Concept note:** This is a common GIS pattern: use attribute values to drive geometry creation. Instead of one universal buffer distance, the lake size class determines how much surrounding area counts as "near" that lake.

### Run the variable-distance buffer

1. Open the **Buffer** tool again.
2. Use `lakes` as the input layer.
3. For the **Distance** parameter, use the data-defined option and choose the `buffdist` field.
4. Check **Dissolve result**.
5. Save the output as something like `VarBuffLakes.gpkg`.
6. Run the tool.

Arrange the road, road-buffer, lake, and lake-buffer layers so you can see how the two proximity criteria differ spatially.

> Placeholder image: QGIS map canvas with roads and lakes on top of their dissolved road and variable-distance lake buffer polygons.

## Deliverable 1

Create and export a map layout showing:

- roads
- lakes
- the road buffer
- the variable-distance lake buffer

Include:

- a clear title
- your name
- a scale bar
- a legend

## Part 3: Prepare the Buffer Layers for Overlay

The dissolved buffer outputs are useful analytically, but before overlay we need to prepare them so the result is easier to interpret.

### Convert multipart buffers to singlepart features

1. Open the attribute table for `VarBuffLakes`.
2. Notice that the dissolved buffer may contain many polygons but very few rows.
3. Open **Multipart to singleparts** from the **Processing Toolbox**.
4. Use `VarBuffLakes` as the input.
5. Save the output as `SingleLakeBuffers.gpkg`.
6. Run the tool.

Open the new attribute table and confirm that the multipart geometry has been separated into individual polygons.

Repeat the same process for the dissolved road buffer:

1. Run **Multipart to singleparts** on the road-buffer layer.
2. Save the result as something like `SingleRoadBuffers.gpkg`.

> **Concept note:** Multipart features can be awkward for overlay analysis because one table row may represent several disconnected polygons. Converting to singlepart features makes later selection and interpretation much clearer.

### Clean the buffer tables and create inside-buffer flags

For each of the new singlepart buffer layers:

1. Open the attribute table.
2. Toggle editing on.
3. Delete the existing fields if they are not helpful for the overlay result.
4. Use the **Field Calculator** to create a simple indicator field:
   - `inlakebuff` for `SingleLakeBuffers`
   - `inroadbuff` for `SingleRoadBuffers`
5. Assign a value of:

```qgis
1
```

6. Save edits and stop editing.

> **Concept note:** These fields act like logical flags. After the overlay, they let you identify which polygons are inside the lake buffer, the road buffer, or both.

## Part 4: Remove the Lake Interior from the Lake Buffer

The lake buffer currently includes the lake polygons themselves, but a campsite or recreation site should be on land near the lake, not in the water.

1. Open the **Difference** tool from the **Processing Toolbox**.
2. Set:
   - **Input layer:** `SingleLakeBuffers`
   - **Overlay layer:** `lakes`
3. Save the output as `LakeBuffersOnly.gpkg`.
4. Run the tool.

Verify that the result shows the buffered land near lakes, with the lake interiors removed.

> **Concept note:** In many overlay workflows, a criterion needs to be interpreted carefully. "Near a lake" is not the same as "inside the lake polygon." Difference helps turn that conceptual distinction into the geometry you actually want.

## Part 5: Use Union to Combine the Lake and Road Criteria

Now combine the land-near-lakes layer with the road-buffer layer.

1. Open the **Union** tool in the **Processing Toolbox**.
2. Set:
   - **Input layer:** `LakeBuffersOnly`
   - **Overlay layer:** `SingleRoadBuffers`
3. Save the output as `BufferUnion.gpkg`.
4. Run the tool.

Open the attribute table for `BufferUnion` and inspect the `inlakebuff` and `inroadbuff` fields.

You are looking for polygons where:

- `inlakebuff = 1`
- `inroadbuff = 1`

Those are the polygons that satisfy both proximity criteria.

## Part 6: Select and Export the Candidate Areas

1. In the `BufferUnion` attribute table, open **Select features by expression**.
2. Use:

```qgis
"inlakebuff" = 1 AND "inroadbuff" = 1
```

3. Apply the selection.
4. Inspect the selected polygons on the map.
5. Right-click `BufferUnion` and choose **Export > Save Selected Features As...**
6. Save the output as `Candidates.gpkg`.

This new candidate layer represents places that are both:

- near a lake, based on the size-dependent buffer
- near a road, based on the 300-meter road buffer

> **Concept note:** This is the core logic of suitability analysis. Instead of asking whether one condition is true, you are asking where several spatial conditions are true at the same time.

> Placeholder image: QGIS map showing the final selected candidate polygons that meet both lake and road proximity criteria.

## Deliverable 2

Create and export a second map layout showing the candidate recreation areas.

Include:

- the final candidate polygons
- enough context layers to interpret the result
- a clear title
- your name
- a scale bar
- a legend

## What You Should Understand After This Lab

By the end of this exercise, you should be able to explain:

- the difference between fixed-distance and variable-distance buffers
- why dissolved and undissolved buffers produce different analytical structures
- why multipart-to-singlepart conversion can matter before overlay analysis
- why `Difference` was needed before combining the lake and road criteria
- how `Union` plus attribute selection produces a simple suitability analysis result
