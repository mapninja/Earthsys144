# Assignments & Rubrics - Week 06

## Week 06 Assignment Overview

Week 06 focuses on remote sensing, terrain-based movement modeling, sampling and interpolation, and commercial satellite imagery workflows. Students move through four required `TURN_IN` labs and one optional workshop:

1. Sentinel-2 remote sensing and standalone spectral-index scripts in Google Earth Engine.
2. Tobler's Hiker Function and terrain-based travel-time modeling in Google Earth Engine and QGIS.
3. Sampling and interpolation comparison in QGIS.
4. Planet.com satellite imagery concepts and a companion Planet SDK notebook.
5. Optionally exploring HSV pan sharpening with Landsat imagery.

The core Week 06 assignment is graded as a single 10-point assignment made up of four `TURN_IN` components. The pan-sharpening Landsat lab is optional support material and is not part of the Week 06 score unless separately assigned.

## Week 06 Lab Pages

- Lab Document: [00 - TURN IN - Basic Remote Sensing with Google Earth Engine](https://mapninja.github.io/Earthsys144/week06/00_TURN_IN_basic_remote_sensing_with_google_earth_engine.html)
- Lab Document: [01 - TURN IN - Tobler's Hiker Function: Modeling Movement and Terrain-Based Distance](https://mapninja.github.io/Earthsys144/week06/01_TURN_IN_tobler_hiker_function_and_modeling_movement.html)
- Lab Document: [02 - TURN IN - Sampling & Interpolation with QGIS](https://mapninja.github.io/Earthsys144/week06/02_TURN_IN_sampling_and_interpolation_with_qgis.html)
- Lab Document: [03 - TURN IN - Introducing Planet.com Satellite Imagery](https://mapninja.github.io/Earthsys144/week06/03_TURN_IN_introducing_planet_com_satellite_imagery.html)
- Optional Workshop: [04 - OPTIONAL - Pan-Sharpen Landsat Imagery with HSV Color Transformation](https://mapninja.github.io/Earthsys144/week06/04_OPTIONAL_pan-sharpen_LANDSAT.html)
- Week overview: [Week 06 - More Raster & Remote Sensing](https://mapninja.github.io/Earthsys144/week06/README.html)

## What Students Should Submit

Submit all of the following:

1. The required PDF from **Basic Remote Sensing with Google Earth Engine**, including the selected study area, chosen spectral index, screenshot of the index layer, interpretation, and saved Earth Engine **Get Link URL**.
2. The final QGIS map layout from **Tobler's Hiker Function**, plus the saved Earth Engine **Get Link URL** for the final script.
3. The final four-panel PDF layout from **Sampling & Interpolation with QGIS**, comparing the original DEM, IDW, Nearest Neighbor, and Spline results.
4. The required PDF from **Introducing Planet.com Satellite Imagery**, including AOI/search/filter/order-preview evidence and the requested explanation of the notebook safety switch.

## Rubric

Total possible points: 10

| Criteria | What to look for | Points |
| --- | --- | ---: |
| Basic Remote Sensing with Google Earth Engine | Student demonstrates that they can locate and use Sentinel-2 imagery, filter by date/bounds/cloud metadata, choose an appropriate spectral index for a meaningful study area, visualize the result, interpret high and low values cautiously, and submit a working Earth Engine Get Link URL in a PDF. | 2 |
| Tobler's Hiker Function and Terrain-Based Distance | Student demonstrates that they can run and modify the Tobler model, change the origin and/or walking-time assumptions, export the walking-time zones, create a legible QGIS layout with required map elements, and explain how terrain distorts movement compared with flat-ground distance. | 3 |
| Sampling & Interpolation with QGIS | Student demonstrates that they can create and compare systematic, random, and stratified sampling workflows; run IDW, Nearest Neighbor, and Spline interpolation; style outputs consistently; and export a four-panel comparison layout that clearly communicates method differences. | 3 |
| Planet.com Satellite Imagery and SDK Workflow | Student demonstrates that they understand Planet search/order workflow concepts, can document AOI/date/cloud filtering and metadata inspection, can interpret footprints and order previews, and can explain why the notebook uses a safety switch before submitting real Planet orders. | 2 |

## Grading Notes

- This rubric treats the core Week 06 assignment as one 10-point submission with four graded components: remote sensing indices, Tobler movement modeling, sampling/interpolation, and Planet imagery workflows.
- The pan-sharpening Landsat lab is optional and should not be graded unless separately assigned.
- In the remote sensing exercise, the most important issue is whether the index, place, and interpretation fit together. Students should not treat a high index value as proof without visual comparison and local context.
- In the Tobler exercise, emphasize the modeling logic: elevation supports slope, slope supports walking speed, walking speed supports cost, and cumulative cost supports reachable-area mapping.
- In the interpolation exercise, emphasize comparison. A strong submission should make it possible to visually compare how sampling strategy and interpolation method change the resulting surface.
- In the Planet exercise, emphasize workflow literacy and safe ordering behavior. Students should show that they understand the difference between search, filtering, order creation, monitoring, and downloading.
