# Week 01 - Coordinates, Geodesy and Geometries

Week 01 introduces the coordinate concepts that sit underneath the rest of the course. The labs move between Google Earth Engine and QGIS, but they are working on the same core problem: spatial data only makes sense when you understand how coordinates are defined, how geometries are built from those coordinates, and how coordinate reference systems affect measurement.

By the end of Week 01, you should be able to:

- Explain why coordinates are only meaningful within a coordinate reference system.
- Recognize the difference between geographic and projected coordinate systems.
- Work with points, lines, polygons, and rectangular extents in Google Earth Engine.
- Use basic Earth Engine scripting patterns to inspect coordinates, geometries, and spatial objects.
- Distinguish among ellipsoids, geoids, projections, and full coordinate reference systems.
- Explain the difference between ellipsoidal and planar measurement.
- Measure and visualize projection error in QGIS.

## Week 01 Labs

These three Week 01 labs include material that must be turned in for grading.

### 01 - TURN IN - Create an Area of Interest with GeoJSON.io

[Open the lab](01_TURN_IN_create_an_aoi_with_geojson_io.md)

In this lab you define your personal study area for the rest of the quarter. You will use [geojson.io](https://geojson.io) to draw a rectangular AOI at least as large as the Stanford campus, relocate it to a place of personal significance — hometown, research site, or field area — add identifying properties, and export the result as a GeoJSON file to submit to Canvas.

### 02 - TURN IN - Projection Error Measurement with QGIS

[Open the lab](02_TURN_IN_projection_error_measurement_with_qgis.md)

This lab turns geodesy and projection ideas into something measurable. You will compare area measured on the ellipsoid with area measured in a projected coordinate system, then calculate and symbolize the percent difference across U.S. counties. The purpose is not just to practice QGIS tools, but to make projection distortion visible and interpretable in relation to concepts such as geographic versus projected CRS, on-the-fly reprojection, and lines of true scale.

### 03 - TURN IN - Coordinates and Geometries with Google Earth Engine

[Open the lab](03_TURN_IN_introducing_google_earth_engine_with_coordinates_and_pixels.md)

This lab introduces the Earth Engine Code Editor as a cloud-based GIS environment and uses it to build spatial thinking from the ground up. You will review the JavaScript structures that appear constantly in Earth Engine scripts, then use them to define and inspect coordinate pairs, points, lines, polygons, and rectangles. The turn-in asks you to reset to a blank script, choose your own location, use the Inspector to capture two corner coordinates, and build a rectangle from them in code. The goal is to get comfortable reading and writing simple Earth Engine code while understanding that every coordinate pair is tied to a CRS, usually WGS 84 in this workflow.
