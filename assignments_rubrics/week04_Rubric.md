# Assignments & Rubrics - Week 04

## Week 04 Assignment Overview

Week 04 focuses on how vector GIS workflows can reshape, combine, and reinterpret geography. Students move through five connected ideas:

1. Using an external demographic platform and bringing its outputs into QGIS.
2. Building a site-selection workflow through buffering, overlay, and parcel filtering.
3. Estimating demographic values for a geography that is not a Census unit through areal interpolation.
4. Treating street lines as a movement network and routing through them analytically.
5. Returning to Earth Engine to work with tabular and vector features analytically.

The core Week 04 assignment is graded as a single 10-point assignment made up of four graded components. The Earth Engine exercise extends the weekly sequence and may be assigned separately depending on course pacing.

## Required Lab Pages

- Lab Document: [00 - Introducing SimplyAnalytics.com](https://mapninja.github.io/Earthsys144/week04/00_introducing_simplyanalytics_com.html)
- Lab Document: [01 - Buffering & Overlay Analysis in QGIS](https://mapninja.github.io/Earthsys144/week04/01_buffering_and_overlay_analysis_in_qgis.html)
- Lab Document: [02 - Areal Interpolation of Attributes with QGIS](https://mapninja.github.io/Earthsys144/week04/02_areal_interpolation_of_attributes_with_qgis.html)
- Lab Document: [03 - Network Analysis with QGIS](https://mapninja.github.io/Earthsys144/week04/03_network_analysis_with_qgis.html)
- Lab Document: [04 - Tabular/Vector Data in Google Earth Engine](https://mapninja.github.io/Earthsys144/week04/04_tabular_vector_data_in_google_earth_engine.html)
- Week overview: [Week 04 - Basic Vector Analysis](https://mapninja.github.io/Earthsys144/week04/README.html)

## What Students Should Submit

Submit all of the following:

1. The required output from **Introducing SimplyAnalytics.com**.
2. The final site-selection layout from **Buffering & Overlay Analysis in QGIS**.
3. The required output from **Areal Interpolation of Attributes with QGIS**.
4. The final route layout from **Network Analysis with QGIS**.
5. The required output from **Tabular/Vector Data in Google Earth Engine**, if assigned.

## Rubric

Total possible points: 10

| Criteria | What to look for | Points |
| --- | --- | ---: |
| Introducing SimplyAnalytics.com | Student demonstrates that they can use SimplyAnalytics to build an appropriate export, bring it into QGIS, aggregate the Bigfoot point data spatially, normalize the results meaningfully, and communicate the pattern clearly. The main question is whether the student handled the platform-to-GIS workflow correctly and interpreted the mapped rate responsibly. | 2 |
| Buffering & Overlay Analysis in QGIS | Student demonstrates that they can repair geometry, subset the California layers correctly, classify lakes, build fixed and variable buffers, use overlay logic to create candidate areas, and produce a focused final map around Shasta Lake. The final layout should show both analytical correctness and improving cartographic judgment. | 3 |
| Areal Interpolation of Attributes with QGIS | Student demonstrates that they can compute parent and child areas, create an area-based weight, estimate weighted population, and summarize the results by Fire Hazard Severity Zone class. The main issue is whether the student understands why the weighting workflow is needed and executes it correctly. | 3 |
| Network Analysis with QGIS | Student demonstrates that they can interpret the `oneway` attribute, symbolize directionality, run the shortest-path tool with the correct direction settings, and communicate the route clearly in a final map layout. | 2 |

## Grading Notes

- This rubric treats the core Week 04 assignment as one 10-point submission with four graded components: SimplyAnalytics, buffering and overlay, areal interpolation, and network analysis.
- The Earth Engine exercise is listed with the Week 04 materials because it fits the weekly sequence, but it may be handled separately depending on how the course schedule is paced.
- In the SimplyAnalytics and areal interpolation exercises, the priority is whether the student followed the analytic logic correctly, not just whether the final visual output looks polished.
- In the buffering and overlay exercise, both workflow correctness and cartographic communication matter because the final product is explicitly a site-selection map.
- In the network exercise, the key issue is whether the student understood and used directionality in both symbolization and routing, then communicated the result clearly in layout form.
