# Assignments & Rubrics - Week 02

## Week 02 Assignment Overview

Week 02 focuses on making and collecting spatial data in three different ways:

1. Creating vector data in QGIS by labeling tree crowns from aerial imagery.
2. Building a mobile field data collection workflow with ArcGIS Online and Field Maps.
3. Working with raster structure in Google Earth Engine through collections, images, bands, and pixels.

This Week 02 assignment is graded as a single 10-point assignment made up of three required turn-ins.

## Required Lab Pages

- Lab Document: [01 - TURN IN - Data Creation in QGIS](https://mapninja.github.io/Earthsys144/week02/01_TURN_IN_data_creation_in_qgis.html)
- Lab Document: [03 - TURN IN - Introducing ArcGIS Field Maps and ArcGIS Online for Data Collection](https://mapninja.github.io/Earthsys144/week02/03_TURN_IN_introducing_arcgis_fieldmaps_and_arcgis_online_for_data_collection.html)
- Lab Document: [04 - TURN IN - Introducing Collections, Images, Bands, and Pixels in Google Earth Engine](https://mapninja.github.io/Earthsys144/week02/04_TURN_IN_introducing_collections_and_pixels_in_earth_engine.html)
- Week overview: [Week 02 - Making and Collecting Data](https://mapninja.github.io/Earthsys144/week02/README.html)

## What Students Should Submit

Submit all of the following:

1. The three required files from the QGIS tree labeling lab:
   - the selected grid cell GeoJSON
   - the digitized tree crowns GeoJSON
   - the exported map layout PDF
2. The ArcGIS Online web map URL from the Field Maps lab.
3. The ArcGIS Online view layer URL from the Field Maps lab.
4. A working Google Earth Engine "Get Link" URL for the Earth Engine lab.

For the Google Earth Engine submission, students must:

- include their name in a comment near the top of the script
- include inline comments marking any changes they made

## Rubric

Total possible points: 10

| Criteria | What to look for | Points |
| --- | --- | ---: |
| Tree labeling assignment completed | Student submitted the required QGIS tree labeling files and completed the assigned tree crown labeling task for their selected tile. Credit is based on completion of the assigned labeling work, not on older point, line, and polygon digitizing categories. | 3 |
| Map layout includes required cartographic elements | The exported QGIS map includes a title, scale, CRS, legend, student name, and date, and it clearly documents the tree labeling work. | 2 |
| Field Maps submission is complete and usable | Student submitted both required ArcGIS Online URLs, and the shared view layer is available and contains at least 12 collected point features. | 3 |
| Google Earth Engine submission works and demonstrates the required concepts | Student submitted a working Earth Engine Get Link URL. The shared script includes the student's name in a comment, marks edits with inline comments, and shows the required workflow elements: an AOI, filtering by place and date, a selected Dynamic World probability band, use of `updateMask()`, Hansen forest-loss thresholding, and RGB and CIR Sentinel-2 visualization. | 2 |

## Grading Notes

- This rubric treats Week 02 as one 10-point assignment with three graded components: QGIS tree labeling, ArcGIS Field Maps, and Google Earth Engine.
- For the QGIS portion, completion of the assigned labeling task is the key grading standard. The intent is to confirm that the student completed the labeling workflow and submitted the required outputs.
- For the map layout, check for the basic cartographic elements and whether the final PDF clearly documents the student's work.
- For the Field Maps item, both submitted links should work, and the view layer should show a populated collected dataset rather than an empty configuration.
- For the Earth Engine item, the script should both function and demonstrate the concepts introduced in the lab, with clear commenting suitable for review.
