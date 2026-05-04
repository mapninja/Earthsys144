# Week 05 - Basic Raster Analysis

## Overview

Week 05 shifts the course from mostly vector workflows into **raster analysis** and terrain modeling.

This week asks students to think of rasters not just as images, but as structured grids of values that can be transformed, combined, queried, and visualized analytically.

The workflows in this week move through several related raster ideas:

1. working with raster values and imagery in Earth Engine
2. preparing and merging digital elevation models
3. using terrain surfaces for visibility analysis
4. extending terrain analysis into watershed processing
5. communicating spatial analysis through web presentation formats

## Core Ideas for the Week

### Raster cells are measurements

Each raster cell stores a value. In different datasets, that value might represent:

- elevation
- reflectance
- slope
- visibility
- land cover

Raster analysis works by transforming and comparing those values systematically.

### Grid structure matters

Before rasters can be combined well, they often need to match in:

- extent
- cell size
- alignment
- no-data handling

This is why preparation steps such as resampling and filling null cells are part of the analysis itself.

### Terrain models support more than visualization

Digital elevation models are often used as map backgrounds, but they are also analytical surfaces.

This week uses DEMs to support:

- hillshade creation
- raster merging
- terrain profiles
- viewshed analysis
- watershed processing

### Display choices affect interpretation

Raster outputs often need thoughtful styling to become legible. Color ramps, hillshades, transparency, and blending modes all shape how easily a user can interpret the result.

## How the Week Fits Together

### [01 - TURN IN - Terrain Data Preparation and DEM Merging with QGIS](01_TURN_IN_terrain_and_visibility_with_qgis.md)

This lab introduces raster preparation through hillshading, no-data handling, resampling, and conditional raster merging so that two DEMs of different resolution can be combined into one terrain surface.

### [02 - TURN IN - Visibility Analysis with QGIS](02_TURN_IN_visibility_analysis_with_qgis.md)

This lab uses a DEM, viewing station, and line of sight to create a terrain profile and a viewshed, showing how elevation models can be used for line-of-sight analysis.

### [03 - TURN IN - Watershed with QGIS & WhiteBox Tools](03_TURN_IN_watershed_with_qgis_and_whitebox_tools.md)

This lab extends terrain analysis into hydrologic modeling by deriving flow accumulation, extracting a stream raster, snapping a pour point, delineating a watershed, and converting the modeled stream network to vectors.

### [04 - TURN IN - Basic Raster Analysis with Google Earth Engine](04_TURN_IN_basic_raster_analysis_with_google_earth_engine.md)

This lab introduces raster concepts such as image collections, images, bands, and pixel values through Earth Engine.

### [05 - OPTIONAL - Introducing StoryMaps on ArcGIS Online](05_OPTIONAL_introducing_storymaps_on_arcgis_online.md)

This workshop introduces ArcGIS StoryMaps as the required final project submission format and as a web-based tool for communicating map-based narratives with text, images, and other media. Students log in through Stanford ArcGIS Online, create a first story, add text and map blocks, preview the result, and understand sharing settings.

## What to Expect in the Individual Lab Documents

The individual Week 05 lab pages are intended to be workflow-focused.

That means:

- the step-by-step guides emphasize tool choice, raster preparation, and interpretation of results
- the broader conceptual framing is concentrated here in the week overview
- short notes remain inside the lab documents where they directly clarify a workflow decision or help prevent a likely beginner mistake

Use this page as the conceptual guide for Week 05, and use the individual lab pages as the operational guides for completing the exercises.
