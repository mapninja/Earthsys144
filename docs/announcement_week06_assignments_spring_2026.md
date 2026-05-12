# Week 06 Assignment Announcement: Remote Sensing, Movement Modeling, and Interpolation

Dear Students,

This week extends raster analysis into **remote sensing**, **terrain-based movement modeling**, and **sampling and interpolation**. The common thread is that raster data are not just pictures: they are grids of values that can be filtered, transformed, modeled, compared, exported, and interpreted.

The Week 06 materials now follow this sequence:

1. **TURN IN - Basic Remote Sensing with Google Earth Engine**
2. **TURN IN - Tobler's Hiker Function: Modeling Movement and Terrain-Based Distance**
3. **TURN IN - Sampling & Interpolation with QGIS**
4. **OPTIONAL - Introducing Planet.com Satellite Imagery**
5. **OPTIONAL - Pan-Sharpen Landsat Imagery with HSV Color Transformation**

## What You Should Complete This Week

Please complete the following assigned work:

1. [00 - TURN IN - Basic Remote Sensing with Google Earth Engine](https://mapninja.github.io/Earthsys144/week06/00_TURN_IN_basic_remote_sensing_with_google_earth_engine.html)
2. [01 - TURN IN - Tobler's Hiker Function: Modeling Movement and Terrain-Based Distance](https://mapninja.github.io/Earthsys144/week06/01_TURN_IN_tobler_hiker_function_and_modeling_movement.html)
3. [02 - TURN IN - Sampling & Interpolation with QGIS](https://mapninja.github.io/Earthsys144/week06/02_TURN_IN_sampling_and_interpolation_with_qgis.html)

The Planet SDK and Landsat pan-sharpening workshops are available as optional support material:

- [03 - OPTIONAL - Introducing Planet.com Satellite Imagery](https://mapninja.github.io/Earthsys144/week06/03_OPTIONAL_introducing_planet_com_satellite_imagery.html)
- [04 - OPTIONAL - Pan-Sharpen Landsat Imagery with HSV Color Transformation](https://mapninja.github.io/Earthsys144/week06/04_OPTIONAL_pan-sharpen_LANDSAT.html)

## Exercise Notes

## [00 - TURN IN - Basic Remote Sensing with Google Earth Engine](https://mapninja.github.io/Earthsys144/week06/00_TURN_IN_basic_remote_sensing_with_google_earth_engine.html)

This exercise introduces Sentinel-2 imagery in Google Earth Engine. You will inspect the Data Catalog, filter imagery by date, bounds, and cloud metadata, compare band combinations, calculate standalone spectral indices, and adapt one index for a study area of your own choosing. Your submission should include a saved Earth Engine **Get Link URL** inside a PDF.

## [01 - TURN IN - Tobler's Hiker Function: Modeling Movement and Terrain-Based Distance](https://mapninja.github.io/Earthsys144/week06/01_TURN_IN_tobler_hiker_function_and_modeling_movement.html)

This exercise models movement as travel time rather than straight-line distance. You will use a DEM to derive slope, apply Tobler's Hiker Function, create walking-time zones, alter the origin point, export the result, and make a final QGIS layout. Your submission should include the final map layout and a saved Earth Engine **Get Link URL**.

## [02 - TURN IN - Sampling & Interpolation with QGIS](https://mapninja.github.io/Earthsys144/week06/02_TURN_IN_sampling_and_interpolation_with_qgis.html)

This exercise compares sampling and interpolation methods in QGIS. You will create systematic, random, and stratified sample sets; run IDW, Nearest Neighbor, and Spline interpolation; and build a four-panel layout comparing the original DEM and interpolated surfaces.

## [03 - OPTIONAL - Introducing Planet.com Satellite Imagery](https://mapninja.github.io/Earthsys144/week06/03_OPTIONAL_introducing_planet_com_satellite_imagery.html)

This optional workshop introduces Planet.com imagery through a Colab-oriented SDK notebook. You can review authentication, AOI mapping, SDK search, metadata filtering, footprint visualization, scene selection, order request construction, order monitoring, downloading, and NDVI visualization. Pay particular attention to the safety switch that prevents accidental real order submission while learning.

## [04 - OPTIONAL - Pan-Sharpen Landsat Imagery with HSV Color Transformation](https://mapninja.github.io/Earthsys144/week06/04_OPTIONAL_pan-sharpen_LANDSAT.html)

This optional workshop introduces HSV pan sharpening with Landsat 8 imagery. It compares 30-meter true color imagery, the 15-meter panchromatic band, and an HSV pan-sharpened output.

## What Students Should Submit

Please submit the following:

1. The required PDF from **Basic Remote Sensing with Google Earth Engine**, including your chosen index, study area, screenshot, interpretation, and **Get Link URL**.
2. The final QGIS map layout from **Tobler's Hiker Function**, plus the saved Earth Engine **Get Link URL**.
3. The final four-panel PDF layout from **Sampling & Interpolation with QGIS**.

## Week 06 Overview

Week overview page:

- [Week 06 - More Raster & Remote Sensing](https://mapninja.github.io/Earthsys144/week06/README.html)

Rubric:

- [Week 06 Rubric](https://mapninja.github.io/Earthsys144/docs/week06_rubric_spring_2026.html)

If you run into trouble, please bring questions to lab, Slack, or office hours so we can work through them together.

Best,

Stace
