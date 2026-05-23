# Assignments & Rubrics - Week 07

## Week 07 Assignment Overview

Week 07 focuses on web mapping and spatial data APIs. Students practice taking GIS-prepared content into web-ready formats, converting tabular addresses into coordinates, publishing spreadsheet-driven web maps, and bridging cloud-based visualizations with desktop GIS. The week emphasizes practical skills for publishing, sharing, and validating spatial results online.

The Week 07 work has two parts:

1. A core web mapping and APIs bundle made from Labs 01, 02, and 03.
2. Lab 04, which is a required tree-labeling turn-in and also includes an extra-credit opportunity.

For Lab 04, students complete the required labeling cells first. They may then label additional suitable cells for bonus credit as described in the lab.

## Week 07 Lab Pages

- Lab Document: [01 - TURN IN - Geocoding Addresses with locator.stanford.edu & OpenRefine](https://mapninja.github.io/Earthsys144/week07/01_TURN_IN_geocoding_addresses_with_locator_stanford_edu_and_openrefine.html)
- Lab Document: [02 - TURN IN - Creating & Hosting a Web Map with MapLibre and Google Sheets JSONP](https://mapninja.github.io/Earthsys144/week07/02_TURN_IN_creating_and_hosting_a_webmap_using_maplibre_jsonp_and_github_pages.html)
- Lab Document: [03 - TURN IN - Getting XYZ Tiles from Google Earth Engine](https://mapninja.github.io/Earthsys144/week07/03_TURN_IN_getting_xyz_tiles_from_earth_engine.html)
- Lab Document: [04 - TURN IN BONUS LAB - Tree Labeling in QGIS](https://mapninja.github.io/Earthsys144/week07/04_TURN_IN_BONUS_LAB_tree_labeling_in_qgis.html)
- Week overview: [Week 07 - Web Mapping & APIs](https://mapninja.github.io/Earthsys144/week07/README.html)

## What Students Should Submit

Submit the following as directed on Canvas:

1. The final geocoded CSV exported from OpenRefine, including the original address fields plus `Longitude` and `Latitude` columns, and a map layout PDF or image showing the geocoded points.
2. A live web map URL hosted on GitHub Pages, Stanford AFS, or equivalent, showing the published MapLibre map with the Google Sheets JSONP data layer and simple popups.
3. A QGIS layout PDF showing the Earth Engine XYZ tile layer(s) in QGIS, the correct layer order and opacity, and a text box containing the copied XYZ URL(s). A legend is not required for Earth Engine XYZ image tiles.
4. The required Tree Labeling submission described in Lab 04: two separate, unzipped GeoJSON files containing the completed postfire and prefire label outputs. If students complete bonus cells, those labels should be included in the same two GeoJSON outputs.

## Rubric

Core web mapping and APIs bundle: 10 points

| Criteria | What to look for | Points |
| --- | --- | ---: |
| Geocoding with OpenRefine & locator.stanford.edu | Student submits the final geocoded CSV from OpenRefine with original address fields plus `Longitude` and `Latitude`, and provides a map layout that clearly shows the geocoded points. | 3 |
| Creating & Hosting a Web Map (MapLibre + Google Sheets JSONP) | Student provides a working hosted web map URL, documents the Google Sheet data source, shows styled points/popups, and uses the JSONP template correctly. | 4 |
| Getting XYZ Tiles from Google Earth Engine | Student demonstrates the Earth Engine visualization, prints a working XYZ tile URL, imports the tile into QGIS, and verifies that the color/styling parameters produce the expected visualization. A legend is not expected unless the student adds their own vector layers that need one. | 3 |

Required tree-labeling turn-in and bonus:

| Criteria | What to look for | Points |
| --- | --- | ---: |
| Tree Labeling in QGIS | Student submits two separate, unzipped GeoJSON label outputs, one postfire and one prefire, for the first 4 suitable grid cells from their random sample. Labels avoid cells with structures, roads, or other human-built infrastructure and are complete enough to support review. | See Canvas |
| Bonus tree-labeling cells | Each additional suitable grid cell beyond the required 4 includes both postfire and prefire labels. | 1 extra credit point per additional completed cell, up to 10 extra credit points for the quarter |

## Grading Notes

- Treat Labs 01, 02, and 03 as the core 10-point web mapping and APIs bundle unless Canvas specifies otherwise.
- Treat Lab 04 as a required Week 07 turn-in with a separate bonus opportunity, following the current Lab 04 instructions.
- For the web map, the hosted URL should be live and publicly accessible. GitHub Pages or Stanford AFS are both acceptable.
- For Lab 02, the map should use the Google Sheets JSONP workflow, not the older CSV/csv2geojson workflow.
- For Lab 04, only count bonus cells that include both postfire and prefire labels.
- Instructors should prioritize correctness and reproducibility: a working URL or downloadable artifact that demonstrates the workflow is worth more than cosmetic choices.
