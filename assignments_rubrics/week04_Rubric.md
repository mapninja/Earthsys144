# Assignments & Rubrics - Week 04

## Week 04 Assignment Overview

Week 04 focuses on how vector GIS workflows can reshape, combine, and reinterpret geography. Students move through four required labs and one optional workshop:

1. Building a site-selection workflow through buffering, overlay, and parcel filtering.
2. Estimating demographic values for a geography that is not a Census unit through areal interpolation.
3. Treating street lines as a movement network and routing through them analytically.
4. Returning to Earth Engine to work with tabular and vector features analytically.
5. Optionally using an external demographic platform and bringing its outputs into QGIS.

The core Week 04 assignment is graded as a single 10-point assignment made up of four `TURN_IN` components. The SimplyAnalytics workshop is listed as optional support material and is not part of the Week 04 score.

## Week 04 Lab Pages

- Optional Workshop: [00 - OPTIONAL - Introducing SimplyAnalytics.com](https://mapninja.github.io/Earthsys144/week04/00_OPTIONAL_introducing_simplyanalytics_com.html)
- Lab Document: [01 - TURN IN - Buffering & Overlay Analysis in QGIS](https://mapninja.github.io/Earthsys144/week04/01_TURN_IN_buffering_and_overlay_analysis_in_qgis.html)
- Lab Document: [02 - TURN IN - Areal Interpolation of Attributes with QGIS](https://mapninja.github.io/Earthsys144/week04/02_TURN_IN_areal_interpolation_of_attributes_with_qgis.html)
- Lab Document: [03 - TURN IN - Network Analysis with QGIS](https://mapninja.github.io/Earthsys144/week04/03_TURN_IN_network_analysis_with_qgis.html)
- Lab Document: [04 - TURN IN - Tabular/Vector Data in Google Earth Engine](https://mapninja.github.io/Earthsys144/week04/04_TURN_IN_tabular_vector_data_in_google_earth_engine.html)
- Week overview: [Week 04 - Basic Vector Analysis](https://mapninja.github.io/Earthsys144/week04/README.html)

## What Students Should Submit

Submit all of the following:

1. The final site-selection layout from **Buffering & Overlay Analysis in QGIS**.
2. The required output from **Areal Interpolation of Attributes with QGIS**.
3. The final route layout from **Network Analysis with QGIS**.
4. The required output from **Tabular/Vector Data in Google Earth Engine**.

## Rubric

Total possible points: 10

| Criteria | What to look for | Points |
| --- | --- | ---: |
| Buffering & Overlay Analysis in QGIS | Student demonstrates that they can repair geometry, subset the California layers correctly, classify lakes, build fixed and variable buffers, use overlay logic to create candidate areas, and produce a focused final map around Shasta Lake. The final layout should show both analytical correctness and improving cartographic judgment. | 3 |
| Areal Interpolation of Attributes with QGIS | Student demonstrates that they can compute parent and child areas, create an area-based weight, estimate weighted population, and summarize the results by Fire Hazard Severity Zone class. The main issue is whether the student understands why the weighting workflow is needed and executes it correctly. | 3 |
| Network Analysis with QGIS | Student demonstrates that they can interpret the `oneway` attribute, symbolize directionality, run the shortest-path tool with the correct direction settings, and communicate the route clearly in a final map layout. | 2 |
| Tabular/Vector Data in Google Earth Engine | Student demonstrates that they can load and inspect FeatureCollections, filter by attributes, summarize raster values within vector boundaries, style features using attributes, and interpret both attribute and spatial joins. The submitted work should show that scripts run and that Console outputs or map layers are interpreted correctly. | 2 |

## Grading Notes

- This rubric treats the core Week 04 assignment as one 10-point submission with four graded components: buffering and overlay, areal interpolation, network analysis, and Google Earth Engine FeatureCollections.
- The SimplyAnalytics workshop is optional and should not be graded unless separately assigned.
- In the areal interpolation exercise, the priority is whether the student followed the analytic logic correctly, not just whether the final visual output looks polished.
- In the buffering and overlay exercise, both workflow correctness and cartographic communication matter because the final product is explicitly a site-selection map.
- In the network exercise, the key issue is whether the student understood and used directionality in both symbolization and routing, then communicated the result clearly in layout form.
