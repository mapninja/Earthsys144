# Assignments & Rubrics - Week 01

## Week 01 Assignment Overview

Week 01 focuses on the coordinate concepts that support the rest of the course. Students move between Google Earth Engine, QGIS, and GeoJSON.io to practice three connected ideas:

1. Building and inspecting coordinates and geometries in Google Earth Engine.
2. Measuring and visualizing projection error in QGIS.
3. Creating a reusable Area of Interest (AOI) file for later labs.

This Week 01 assignment is graded as a single 10-point assignment made up of three graded deliverables.

## Required Lab Pages

- Lab Document: [01 - TURN IN - Coordinates and Pixels with Google Earth Engine](https://mapninja.github.io/Earthsys144/week01/01_TURN_IN_introducing_google_earth_engine_with_coordinates_and_pixels.html)
- Lab Document: [02 - TURN IN - Projection Error Measurement with QGIS](https://mapninja.github.io/Earthsys144/week01/02_TURN_IN_projection_error_measurement_with_qgis.html)
- Lab Document: [03 - TURN IN - Create an Area of Interest with GeoJSON.io](https://mapninja.github.io/Earthsys144/week01/03_TURN_IN_create_an_aoi_with_geojson_io.html)
- Week overview: [Week 01 - Coordinates, Geodesy and Geometries](https://mapninja.github.io/Earthsys144/week01/README.html)

## What Students Should Submit

Submit both of the following:

1. A working Google Earth Engine "Get Link" URL for the Week 01 Earth Engine lab.
2. A finished QGIS map showing the results of the projection error exercise.
3. A GeoJSON AOI file exported from GeoJSON.io.

## Rubric

Total possible points: 10

| Criteria | What to look for | Points |
| --- | --- | ---: |
| Final map uses the correct projected CRS | In the [Week 01 QGIS projection error lab](https://mapninja.github.io/Earthsys144/week01/02_TURN_IN_projection_error_measurement_with_qgis.html), is the final map shown in State Plane California III as instructed? | 1 |
| Projection distortion pattern is communicated clearly | Does the map effectively display distortion, including the lower-error pattern along the lines of true scale and the higher-error pattern away from them? | 2 |
| Map includes basic cartographic elements | The final QGIS map includes essential layout elements such as a title, scale, legend, author name, and date. | 3 |
| Earth Engine script has been altered appropriately | In the [Week 01 Earth Engine lab](https://mapninja.github.io/Earthsys144/week01/01_TURN_IN_introducing_google_earth_engine_with_coordinates_and_pixels.html), has the student altered the script in the required way so the Area of Interest is moved properly and the script still works? | 2 |
| Google Earth Engine Get Link works | Student submitted a working "Get Link" URL for the Week 01 Earth Engine lab, and the shared script opens successfully. | 1 |
| GeoJSON.io AOI file is submitted correctly | Student submitted the [Week 01 AOI lab](https://mapninja.github.io/Earthsys144/week01/03_TURN_IN_create_an_aoi_with_geojson_io.html) as a GeoJSON file. The file should open successfully, represent a rectangle at least as large as the Stanford campus reference box, and include the required identifying properties. | 1 |

## Grading Notes

- This rubric treats Week 01 as one 10-point assignment with three graded deliverables: the QGIS projection error map, the Google Earth Engine script link, and the GeoJSON.io AOI file.
- For the map, the key questions are whether the student used the correct CRS, made projection error visible, and included the basic layout elements.
- For the Earth Engine item, both successful alteration of the script and a working shared link matter.
- For the GeoJSON.io item, check both file validity and whether the student included the required feature information.
