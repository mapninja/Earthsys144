# Introducing Model Builder in QGIS

> **Attribution note:** This workshop is adapted from Ujaval Gandhi’s tutorial, [Automating Complex Workflows using Processing Modeler (QGIS3)](https://www.qgistutorials.com/en/docs/3/processing_graphical_modeler.html). The original tutorial, workflow idea, and example imagery are credited to Ujaval Gandhi and the QGIS Tutorials and Tips project.

## What You Should Understand

By the end of this workshop, you should understand why QGIS Model Builder is useful and how it helps turn a multi-step GIS workflow into something you can run again with one click.

The key idea is simple: instead of repeating every tool manually, you build a model that connects those tools together in a fixed order.

That matters because:

1. Your inputs might change.
2. You may want to experiment with a different parameter, such as grid size.
3. You may want to rerun the same workflow on updated data without rebuilding every step from scratch.

## Why Model Builder Matters

Many GIS workflows are really chains of smaller tasks. One tool creates an intermediate output, the next tool uses that output, and so on.

Model Builder is useful because it lets you:

1. Describe the workflow once.
2. Reuse the workflow later.
3. Share the workflow with someone else.
4. Run the same process on many inputs as a batch job.

In this exercise, we will build a model that turns the `ASAM_events` point layer into a density-style map by placing a hexagonal grid over the data and counting how many `ASAM_events` points fall inside each polygon.

## Example Data

This tutorial uses two public datasets:

1. The `ASAM_events` point layer of maritime piracy incidents from the National Geospatial-Intelligence Agency’s Maritime Safety Information portal.
2. The `ne_10m_land` polygon layer from Natural Earth.

You can download the same source data directly from the original tutorial page if you want to follow the identical example. For the course version, the important part is not the topic itself but the workflow:

1. Start with `ASAM_events`.
2. Reproject `ne_10m_land` to match the project.
3. Create a grid.
4. Keep only the grid cells that intersect `ASAM_events`.
5. Count the `ASAM_events` points inside each cell.
6. Style the result.

## Getting Ready

If you want to follow the original example exactly, download the source files used in the QGIS tutorial:

1. [ASAM_shp.zip](https://www.qgistutorials.com/downloads/ASAM_shp.zip)
2. [ne_10m_land.zip](https://www.qgistutorials.com/downloads/ne_10m_land.zip)

These are the same data files used in the original tutorial by Ujaval Gandhi. Save them in a dedicated folder so you can find them easily in the QGIS Browser panel.

## Concept Notes

> **Concept Note:**
> A model is a reusable workflow, not just a one-time map. Once you connect the inputs and algorithms, you can rerun the same logic with different data or different settings.

> **Concept Note:**
> The project CRS matters because some tools need measurements in the units of the project. In this tutorial, the equal-area projection helps the grid cells cover comparable area.

## The Workflow We Will Build

Here is the workflow in plain language:

1. Accept the `ASAM_events` point layer as an input.
2. Accept the `ne_10m_land` polygon layer as a base layer.
3. Accept a numeric input for grid size.
4. Reproject `ne_10m_land` to the project CRS.
5. Create a hexagonal grid over the extent of the reprojected layer.
6. Keep only the grid cells that intersect `ASAM_events`.
7. Count the `ASAM_events` points in each remaining polygon.
8. Symbolize the output using graduated colors.

## Step 1: Load the Data

Open the two data layers in QGIS:

1. The `ne_10m_land` polygon layer.
2. The `ASAM_events` point layer.

The `ASAM_events` layer in the original tutorial does not include projection information, so QGIS asks you to define the CRS. Use `WGS 84` for the `ASAM_events` data.

![Loading the `ne_10m_land` and `ASAM_events` layers in QGIS](https://www.qgistutorials.com/en/_images/1142.png)

![Choosing WGS 84 for the `ASAM_events` layer CRS](https://www.qgistutorials.com/en/_images/2121.png)

## Step 2: Open the Processing Modeler

Once the layers are loaded, open the Model Builder from the Processing menu.

In QGIS, go to:

`Processing` > `Graphical Modeler`

![Opening the Graphical Modeler from the Processing menu](https://www.qgistutorials.com/en/_images/358.png)

When the Modeler window opens, give the model a name and save it. In the original tutorial, the model is called `piracy hexbin`.

![Naming and saving the new model](https://www.qgistutorials.com/en/_images/430.png)

## Step 3: Add the Model Inputs

Every model starts with inputs. Inputs are the pieces of information a user can change when the model runs.

For this workflow, we need three inputs:

1. The `ASAM_events` point layer.
2. The `ne_10m_land` polygon layer.
3. A number for grid size.

Add those inputs to the canvas.

![Adding inputs to the model canvas](https://www.qgistutorials.com/en/_images/628.png)

In the original workflow, the point input is named `Input Points` and is connected to `ASAM_events`. The polygon input is named `Base Layer` and is connected to `ne_10m_land`. The number input is named `Grid Size`.

## Step 4: Reproject the Base Layer

The next step is to reproject `ne_10m_land` to the project CRS.

Why do this? Because the grid tool needs to work in the units of the project CRS, and a global equal-area projection gives us a better basis for comparing grid cells.

Add the `Reproject layer` algorithm and connect it to the `ne_10m_land` base layer input.

![Adding the Reproject layer algorithm](https://www.qgistutorials.com/en/_images/1035.png)

When you configure the algorithm, use `ne_10m_land` as the input and tell QGIS to use the project CRS as the target CRS.

![Configuring the reproject step](https://www.qgistutorials.com/en/_images/1143.png)

## Step 5: Create a Hexagonal Grid

Now add the grid step.

In the original tutorial, the grid is hexagonal. That shape is useful because it creates a regular tessellation without favoring horizontal or vertical directions the way square cells sometimes do.

Add the `Create grid` algorithm and set:

1. Grid type: `Hexagon (polygon)`
2. Grid extent: the extent from the reprojected layer
3. Horizontal spacing: use the model input for `Grid Size`
4. Vertical spacing: use the same `Grid Size` input

![Adding the Create grid algorithm](https://www.qgistutorials.com/en/_images/1236.png)

![Setting the grid spacing from a model input](https://www.qgistutorials.com/en/_images/1334.png)

![Using the same model input for vertical spacing](https://www.qgistutorials.com/en/_images/1432.png)

## Step 6: Keep Only Grid Cells With Data

At this point, the model creates a grid over the full extent of `ne_10m_land`. Some cells contain `ASAM_events`, and others do not.

To keep only the useful cells, add `Extract by location`.

Set it up so the grid cells are extracted where they intersect `ASAM_events`.

![Adding Extract by location](https://www.qgistutorials.com/en/_images/1527.png)

![Configuring the intersection test](https://www.qgistutorials.com/en/_images/1625.png)

## Step 7: Count the Points in Each Polygon

Now we can summarize the `ASAM_events` points in the cells that remain.

Add `Count points in polygon` and connect:

1. The extracted grid cells as the polygons.
2. The `ASAM_events` layer as the points.

The output will contain a point-count field for each grid cell.

![Adding Count points in polygon](https://www.qgistutorials.com/en/_images/1727.png)

![Setting the output name for the counted polygons](https://www.qgistutorials.com/en/_images/1823.png)

## Step 8: Save the Model

Your model is now complete.

Save it so QGIS can reuse it from the Processing Toolbox.

![Saving the completed model](https://www.qgistutorials.com/en/_images/1919.png)

## Step 9: Run the Model

Switch back to the main QGIS window.

Before running the model, set the project CRS to a global equal-area projection. The original tutorial uses Mollweide, which works well here because it preserves area better for this kind of summary map.

![Opening Project Properties to set the CRS](https://www.qgistutorials.com/en/_images/2018.png)

Choose the Mollweide projection in the CRS tab.

![Selecting the Mollweide CRS](https://www.qgistutorials.com/en/_images/2122.png)

Then open the model from the Processing Toolbox and run it.

Use a grid size that makes sense for the CRS units. In the original example, the grid size is set to `100000` meters.

![Running the model from the Processing Toolbox](https://www.qgistutorials.com/en/_images/2219.png)

![Choosing the grid size for the model](https://www.qgistutorials.com/en/_images/2317.png)

## Step 10: Style the Result

The output layer contains a count field that shows how many `ASAM_events` points fell into each grid cell.

To make the map easier to read:

1. Open the layer properties.
2. Switch to Symbology.
3. Use `Graduated` styling.
4. Choose the count field as the column.
5. Use a color ramp such as `Viridis`.
6. Use a classification method such as `Natural Breaks (Jenks)`.

![Opening the output layer properties](https://www.qgistutorials.com/en/_images/2416.png)

![Setting graduated symbology](https://www.qgistutorials.com/en/_images/2515.png)

![Adjusting the fill and stroke style](https://www.qgistutorials.com/en/_images/2614.png)

![Choosing a color ramp and classifying the output](https://www.qgistutorials.com/en/_images/2715.png)

When you turn off the original `ASAM_events` point layer, you should be able to see the density pattern much more clearly.

![Final hexbin-style result](https://www.qgistutorials.com/en/_images/2914.png)

## What This Teaches

This exercise is not just about one specific map.

It teaches a bigger GIS habit:

1. Break a complicated workflow into repeatable pieces.
2. Keep the inputs flexible.
3. Reuse the model when the data change.
4. Use cartography to make the output easier to interpret.
