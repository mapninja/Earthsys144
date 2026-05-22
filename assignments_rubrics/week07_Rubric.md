# Assignments & Rubrics - Week 07

## Week 07 Assignment Overview

Week 07 focuses on web mapping and spatial data APIs. Students practice taking GIS-prepared content into web-ready formats, converting tabular addresses into coordinates, and bridging cloud-based visualizations with desktop GIS. The week emphasizes practical skills for publishing and sharing spatial results online.

The core Week 07 assignment is graded as a submission composed of the `TURN IN` components below. The Tree Labeling workflow is both a required Week 07 turn-in and a bonus opportunity: students complete the required labeling cells, then may label additional suitable cells for extra credit as described in the lab.

## Week 07 Lab Pages

- Lab Document: [01 - TURN IN - Geocoding Addresses with locator.stanford.edu & OpenRefine](https://mapninja.github.io/Earthsys144/week07/01_TURN_IN_geocoding_addresses_with_locator_stanford_edu_and_openrefine.html)
- Lab Document: [02 - TURN IN - Creating & Hosting a Web Map with MapLibre and Google Sheets JSONP](https://mapninja.github.io/Earthsys144/week07/02_TURN_IN_creating_and_hosting_a_webmap_using_maplibre_jsonp_and_github_pages.html)
- Lab Document: [03 - TURN IN - Getting XYZ Tiles from Google Earth Engine](https://mapninja.github.io/Earthsys144/week07/03_TURN_IN_getting_xyz_tiles_from_earth_engine.html)
- Lab Document: [04 - TURN IN BONUS LAB - Tree Labeling in QGIS](https://mapninja.github.io/Earthsys144/week07/04_TURN_IN_BONUS_LAB_tree_labeling_in_qgis.html)
- Week overview: [Week 07 - Web Mapping & APIs](https://mapninja.github.io/Earthsys144/week07/README.html)

## What Students Should Submit

Submit all of the following as a single ZIP or PDF bundle (as specified on Canvas):

1. A PDF or link demonstrating successful geocoding of the provided address table (CSV) including: the cleaned input, the geocoding request URL or summary of steps, and a short note on any failed or ambiguous matches.
2. A live web map URL hosted on GitHub Pages, Stanford AFS, or equivalent, showing the published MapLibre map with the Google Sheets JSONP data layer and simple popups.
3. A QGIS layout PDF showing the Earth Engine XYZ tile layer(s) in QGIS, the correct layer order and opacity, and a text box containing the copied XYZ URL(s).
4. The required Tree Labeling submission described in Lab 04, including the completed postfire and prefire label outputs.

## Rubric

Total possible points: 10

| Criteria | What to look for | Points |
| --- | --- | ---: |
| Geocoding with OpenRefine & locator.stanford.edu | Student demonstrates a clean address table (consistent fields), successful batch geocoding workflow in OpenRefine, handling of ambiguous or missing matches, and provides coordinates or a geocoded file ready for mapping. | 3 |
| Creating & Hosting a Web Map (MapLibre + Google Sheets JSONP) | Student provides a working hosted web map URL, documents the Google Sheet data source, shows styled points/popups, and uses the JSONP template correctly. | 4 |
| Getting XYZ Tiles from Google Earth Engine | Student demonstrates the Earth Engine visualization, prints a working XYZ tile URL, imports the tile into QGIS, and verifies that the color/styling parameters produce the expected visualization. | 3 |
| Tree Labeling in QGIS | Student submits the required postfire and prefire tree-label outputs for the required suitable grid cells. Additional completed suitable cells may earn bonus credit as described in the lab. | See Canvas |

## Grading Notes

- Treat the first three Week 07 deliverables as the core web mapping and APIs bundle unless Canvas specifies otherwise.
- Treat the Tree Labeling lab as a required Week 07 turn-in with a separate bonus opportunity, following the current Lab 04 instructions.
- For the web map, the hosted URL should be live and publicly accessible (GitHub Pages is preferred for reproducibility).
- Instructors should prioritize correctness and reproducibility: a working URL or downloadable artifact that demonstrates the workflow is worth more than cosmetic choices.
