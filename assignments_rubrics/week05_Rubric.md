# Assignments & Rubrics - Week 05

## Week 05 Assignment Overview

Week 05 focuses on raster analysis, terrain modeling, hydrologic modeling, and raster workflows in Google Earth Engine. Students move through four required labs and one optional workshop:

1. Preparing and merging DEMs with different resolution and coverage.
2. Using a DEM for terrain profiles and viewshed analysis.
3. Delineating a watershed from DEM-derived flow direction and flow accumulation.
4. Using Google Earth Engine for raster masking, terrain derivatives, zonal summaries, distance rasters, and edge effects.
5. Optionally introducing ArcGIS StoryMaps as a final project communication format.

The core Week 05 assignment is graded as a single 10-point assignment made up of four `TURN_IN` components. The StoryMaps workshop is listed as optional support material and is not part of the Week 05 score unless separately assigned.

## Week 05 Lab Pages

- Lab Document: [01 - TURN IN - Terrain Data Preparation and DEM Merging with QGIS](https://mapninja.github.io/Earthsys144/week05/01_TURN_IN_terrain_and_visibility_with_qgis.html)
- Lab Document: [02 - TURN IN - Visibility Analysis with QGIS](https://mapninja.github.io/Earthsys144/week05/02_TURN_IN_visibility_analysis_with_qgis.html)
- Lab Document: [03 - TURN IN - Watershed with QGIS & WhiteBox Tools](https://mapninja.github.io/Earthsys144/week05/03_TURN_IN_watershed_with_qgis_and_whitebox_tools.html)
- Lab Document: [04 - TURN IN - Basic Raster Analysis with Google Earth Engine](https://mapninja.github.io/Earthsys144/week05/04_TURN_IN_basic_raster_analysis_with_google_earth_engine.html)
- Optional Workshop: [05 - OPTIONAL - Introducing StoryMaps on ArcGIS Online](https://mapninja.github.io/Earthsys144/week05/05_OPTIONAL_introducing_storymaps_on_arcgis_online.html)
- Week overview: [Week 05 - Basic Raster Analysis](https://mapninja.github.io/Earthsys144/week05/README.html)

## What Students Should Submit

Submit all of the following:

1. The final merged terrain surface layout from **Terrain Data Preparation and DEM Merging with QGIS**.
2. The final visibility layout from **Visibility Analysis with QGIS**, including the terrain profile screenshot.
3. The final watershed layout from **Watershed with QGIS & WhiteBox Tools**.
4. The required PDF from **Basic Raster Analysis with Google Earth Engine**, including the modified Part 6 **Get Link** URL.

## Rubric

Total possible points: 10

| Criteria | What to look for | Points |
| --- | --- | ---: |
| Terrain Data Preparation and DEM Merging with QGIS | Student demonstrates that they can inspect DEM coverage, understand `NoData`, create useful hillshade context, resample the coarser DEM to match the finer grid, use conditional logic to merge the DEMs, and export a legible final terrain layout with required map elements. | 2 |
| Visibility Analysis with QGIS | Student demonstrates that they can use a DEM for line-of-sight interpretation, create and include the terrain profile output, run a viewshed from the viewing station, style the result clearly, and export a final layout that communicates the observer, sight line, profile, and visible terrain. | 2 |
| Watershed with QGIS & WhiteBox Tools | Student demonstrates that they can derive and interpret flow direction and flow accumulation, threshold a stream raster, place and snap a pour point to the raster stream network, delineate the watershed, convert streams to vectors, and export a clear final watershed layout. | 3 |
| Basic Raster Analysis with Google Earth Engine | Student demonstrates that they can run and interpret the raster scripts, work with bands, masks, terrain derivatives, zonal summaries, distance rasters, and edge effects, modify the focal state in Part 6, save the script, and submit a valid Get Link URL in a PDF. | 3 |

## Grading Notes

- This rubric treats the core Week 05 assignment as one 10-point submission with four graded components: DEM merging, visibility analysis, watershed modeling, and Google Earth Engine raster analysis.
- The StoryMaps workshop is optional and should not be graded unless separately assigned.
- In the DEM merging exercise, the key issue is whether the student understands why cell size, extent, and `NoData` handling matter before rasters are combined.
- In the visibility exercise, both the profile and viewshed matter. The profile screenshot should be included in the layout because it communicates the line-of-sight terrain relationship.
- In the watershed exercise, emphasize the logic of the workflow: flow direction supports watershed tracing, flow accumulation supports stream extraction, and the pour point must be snapped to the raster stream cell used by the model.
- In the Earth Engine exercise, the final submission should show a meaningful modification to `focalStateAbbreviation` in Part 6 and include a working Get Link URL in a PDF.
