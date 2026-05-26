# Being John Snow: Point Pattern Analysis & Spatial Statistics in a Python Notebook

> **Notebook location:** The runnable Colab notebook for this lab lives in [`data/Being_John_Snow_Python_Notebook.ipynb`](../data/Being_John_Snow_Python_Notebook.ipynb).
>
> **Source note:** This lab combines the short Week 08 Python-notebook bullet outline with the fuller old-course QGIS version of *Being John Snow* and turns them into a Python workflow.

## What You Should Understand

This notebook version keeps the same core story as the QGIS lab, but it expresses the analysis in Python so that students can see how spatial statistics can be carried out with code.

The main ideas are:

1. Voronoi mapping of water pumps, followed by a spatial join of deaths to pumps.
2. Spatial mean, weighted spatial mean, standard ellipse, and standard distance.
3. Network-based service areas that behave like Voronoi polygons, but use travel time instead of simple straight-line distance.
4. Kernel density surfaces to highlight the outbreak hotspot.

> **Concept Note:**
> John Snow’s map is a classic example of point pattern analysis. The question is not just “where are the deaths?” but “which pump, route, or neighborhood structure may be associated with the pattern?”

## Before You Start

The companion notebook is designed for **Google Colab**.

The notebook itself installs the Python packages it needs, including:

- `geopandas`
- `shapely`
- `pyogrio`
- `rasterio`
- `contextily`
- `mapclassify`
- `osmnx` for the optional network-service-area extension

It also downloads the John Snow archive directly from the course repository if the archive is not already present.

## Data in the Archive

The `Being_John_Snow.zip` archive contains the raw files used by the notebook:

- `Water_Pumps.geojson`
- `deathAddresses.csv`
- `Study_Area.shp`
- `John_Snow_Map.tif`

The notebook converts the death-address CSV into a point layer, loads the pump layer, and reprojects the analysis to a metric CRS so it can compute distances, ellipses, and density surfaces correctly.

## Notebook Workflow

The notebook is organized into the same analytical arc you saw in the QGIS lab:

### 1. Load and inspect the data

The notebook begins by downloading the archive, unpacking it, and loading the point and polygon layers.

### 2. Build Voronoi polygons

The pumps are used to generate Thiessen/Voronoi polygons. These polygons represent simple service areas based on nearest-distance logic.

### 3. Spatial join the deaths

Each death point is assigned to the pump polygon that contains it. This makes it easy to summarize the number of deaths associated with each pump.

### 4. Compute spatial summaries

The notebook calculates:

- a mean center
- a weighted mean center
- a standard distance
- a standard ellipse

These are the same kinds of summary measures the older QGIS lab used to describe the outbreak cluster.

### 5. Create a kernel density hotspot surface

The notebook turns the death locations into a smooth surface that highlights the Broad Street hotspot.

### 6. Optional network-based service areas

The notebook also includes a short optional section on network-based service areas. This is the most direct Python analogue to the old bullet that described service areas as a travel-time version of Voronoi polygons.

## Why This Notebook Version Exists

The old QGIS lab is still a great introduction to the John Snow story, but a Python notebook has a few advantages:

- it is easier to reuse the same logic with other outbreaks or point-pattern datasets
- the code can be adapted into a workflow that students can run in Colab
- students can compare geometric concepts such as Voronoi polygons, mean centers, and kernel density directly in code

> **Concept Note:**
> The notebook is not meant to replace the historical narrative. It is meant to make the same spatial ideas more reusable and more programmable.

## What to Turn In

If you are using this as an assignment, the notebook should show:

- a Voronoi service-area map
- a spatial-join summary of deaths by pump
- a mean-center / weighted-mean-center visualization
- a standard distance or ellipse visualization
- a kernel density hotspot map

Optional, if you extend the notebook:

- a travel-time network service area analysis

## Related Materials

- [Old-course QGIS lab: *Being John Snow: Point Pattern Analysis & Spatial Statistics with QGIS*](../old_course/Labs/Week_08/Being_John_Snow.md)
- [Week 08 notebook file](../data/Being_John_Snow_Python_Notebook.ipynb)
