# Network Analysis with QGIS

> **Turn-in for grading:** This lab includes material that must be turned in for grading. Complete the required deliverables and submit them as instructed by the course.

> **Attribution note:** This exercise is adapted from Ujaval Gandhi's excellent tutorial on basic network visualization and routing in QGIS.

## Overview

This lab introduces **network analysis** in QGIS using a street dataset from San Francisco.

In GIS, a network is a connected system of lines and nodes that can be used to model movement. Roads are one of the most common examples. Once a line dataset is treated as a network, GIS can do more than display it: it can analyze connectivity, direction, and route options.

In this exercise, you will:

1. add and inspect a street-network dataset
2. symbolize one-way streets so traffic direction is visible
3. use the shortest-path tool to calculate a route between two points
4. create a final map layout showing the route

> **Concept note:** A road network is not just a line map. It is a structured system where attributes such as one-way direction affect which routes are actually possible.

## Getting Ready

You will need:

- [Streets Active and Retired.zip](../data/Streets%20Active%20and%20Retired.zip)

### Download and unpack the data

1. Download [Streets Active and Retired.zip](../data/Streets%20Active%20and%20Retired.zip).
2. Unzip it somewhere stable on your computer.
3. Create a project folder for this lab.
4. Save a new QGIS project in that folder as `network_analysis.qgz`.

## Part 1: Add and Inspect the Street Network

1. In the **Browser** panel, browse to the unzipped folder.
2. Add the street shapefile to the map canvas.
3. Open the **Attribute Table** and inspect the fields.
4. Use the **Identify Features** tool on several street segments.

Pay particular attention to the `oneway` field.

In this dataset, the values are:

- `F` for one-way in the forward direction
- `T` for one-way in the reverse direction
- `B` for travel allowed in both directions
- `NULL` values, which you can treat here as two-way segments

> **Concept note:** Network analysis depends heavily on attributes that describe movement rules. Without a field like `oneway`, the software has no way to distinguish between a legal route and an impossible one.

## Part 2: Symbolize One-Way Streets with Rule-Based Styling

Before doing analysis, make the directionality of the network visible.

1. Open the **Layer Styling** panel.
2. Change the symbology to **Rule-based**.
3. Add a new rule.
4. Open the **Expression String Builder** for the rule filter.
5. Build this expression:

```qgis
"oneway" IN ('F', 'T')
```

This selects only the one-way streets.

### Add arrow markers to the one-way streets

1. In the symbol settings for that rule, change the symbol layer type to **Marker line**.
2. Set placement to **On central point**.
3. Choose a marker symbol such as a filled arrowhead.

At this point, all arrows may point in the same direction. That is not yet correct.

### Use a data-defined override for rotation

1. Find the **Rotation** option in the symbol settings.
2. Open the **data-defined override** menu and choose **Edit...**
3. Use this expression:

```qgis
if("oneway" = 'T', 180, 0)
```

4. Apply the expression.

This rotates the arrow 180 degrees for segments where the one-way direction is stored as `T`.

> **Concept note:** This is a good example of how cartography and analysis connect. You are not changing the data here. You are using an attribute to create a more truthful visual representation of how movement works on the network.

> Placeholder image: QGIS street map of San Francisco with arrow markers visible only on one-way streets, rotated according to the `oneway` field.

## Part 3: Calculate a Shortest Path

Now that the network is styled and its directionality is clearer, use it for routing.

1. Open the **Processing Toolbox**.
2. Search for **Shortest path (point to point)**.
3. Open the tool.
4. Set:
   - **Vector layer representing network:** the San Francisco streets layer
   - **Path type:** `Shortest`

### Choose start and end points

You can click on the map using the coordinate picker, or type coordinates directly.

If you want to replicate the example workflow, use:

- **Start point:** `-122.422227,37.768156`
- **End point:** `-122.429083,37.750797`

### Set the direction parameters

Expand the advanced options and configure the one-way rules:

- **Direction field:** `oneway`
- **Value for forward direction:** `F`
- **Value for backward direction:** `T`

Save the output as something like `ShortestPath.gpkg`, then run the tool.

> **Concept note:** The shortest path tool first builds a network graph from the road geometry and its attributes. The route result depends not only on distance, but also on the legal movement rules encoded in the network.

## Part 4: Inspect and Style the Result

1. Add the `ShortestPath` result to the project if it is not added automatically.
2. Style it so it stands out clearly from the road network.
3. Zoom to the route and inspect how it moves through the street system.

As you look at the route, think about why the path is shaped the way it is. In many places there may appear to be several possible visual routes, but the shortest valid route must obey the one-way restrictions in the data.

> **Concept note:** In network analysis, the "best" path is always relative to the cost and rules built into the model. In this lab, the cost is distance and the rule set includes one-way travel direction.

## Deliverable

Create and export a map layout centered on your chosen origin and destination pair.

Include:

- the street network as context
- the shortest path clearly highlighted
- a title
- your name
- the date
- a scale bar
- a legend if it helps interpretation

Choose a basemap or background style that stays visually subordinate to the route.

> Placeholder image: final layout showing a highlighted shortest path over the San Francisco street network, with cartographic elements included.

## What You Should Understand After This Lab

By the end of this exercise, you should be able to explain:

- why a street dataset can be treated as a network
- how the `oneway` field changes both visualization and routing
- why data-defined overrides are useful for network cartography
- how the shortest-path tool uses network geometry and direction rules together
