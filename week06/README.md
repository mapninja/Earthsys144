# Week 06 - More Raster & Remote Sensing

This week extends raster analysis into remote sensing, terrain-based movement modeling, sampling, interpolation, and commercial satellite imagery workflows. The materials emphasize how raster cells, bands, metadata, terrain, and processing choices affect the spatial questions students can ask.

## This Week's Materials

- [00 - TURN IN - Basic Remote Sensing with Google Earth Engine](00_TURN_IN_basic_remote_sensing_with_google_earth_engine.md): Sentinel-2 band combinations, metadata, standalone spectral-index scripts, and a student-selected index exercise.
- [01 - TURN IN - Tobler's Hiker Function: Modeling Movement and Terrain-Based Distance](01_TURN_IN_tobler_hiker_function_and_modeling_movement.md): cost distance, slope, walking speed, and travel-time surfaces in Google Earth Engine.
- [02 - TURN IN - Sampling & Interpolation with QGIS](02_TURN_IN_sampling_and_interpolation_with_qgis.md): point sampling and interpolation concepts in QGIS.
- [03 - OPTIONAL - Introducing Planet.com Satellite Imagery](03_OPTIONAL_introducing_planet_com_satellite_imagery.md): Planet imagery concepts and a companion SDK notebook workflow.
- [04 - OPTIONAL - Pan-Sharpen Landsat Imagery with HSV Color Transformation](04_OPTIONAL_pan-sharpen_LANDSAT.md): Landsat true color, panchromatic imagery, and HSV pan sharpening in Google Earth Engine.

## Remote Sensing With Earth Engine

The basic remote sensing lab introduces Sentinel-2 imagery in Google Earth Engine. Students filter imagery by date, bounds, and cloud metadata; compare standalone band-combination scripts for true color, color infrared, urban SWIR, and geology SWIR; calculate standalone spectral indices including NDVI, NBR, NDWI, NDMI, NDBI, BSI, and an iron oxide ratio; and adapt one index for a study area of their own choosing.

The lab examples are intentionally modular. Each Earth Engine code block can be pasted into a blank script and run independently, with map layers toggled off by default so students use the **Layers** widget to compare outputs one at a time.

## Pan Sharpening With Landsat

The pan-sharpening lab introduces Landsat 8 TOA imagery and the relationship between 30-meter multispectral bands and the 15-meter panchromatic band. Students use an HSV color transformation to replace image brightness with panchromatic detail, then compare the original true color image, panchromatic band, and pan-sharpened output.

## Movement Modeling With Earth Engine

The Tobler's Hiker Function lab uses terrain to model movement as travel time rather than straight-line distance. Students calculate slope from elevation, convert slope to walking speed, build a cost surface, and compare reachable areas from an origin point.

## Planet SDK Notebook

The Planet.com workshop is supported by a Colab-oriented notebook:

- [Planet SDK 101: Lake Lagunita Search, Ordering, and NDVI](../data/planet_SDK_101_LakeLagunita.ipynb)

The notebook uses [`data/lakelagunita.geojson`](../data/lakelagunita.geojson) as the area of interest and walks through SDK-based authentication, search, metadata filtering, footprint mapping, order creation, order monitoring, downloading, and NDVI visualization.
