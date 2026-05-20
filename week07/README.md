# Week 07 - Web Mapping & APIs

## Overview

Week 07 introduces students to the web side of GIS, emphasizing how spatial data move from desktop tools and analytical platforms into interactive web experiences.

The materials for this week focus on three related themes:

- how to turn GIS outputs into web-ready map tiles and hosted web maps
- how to use APIs and data services to geocode, host, and share spatial data
- how to connect imagery, labeling, and feature services into workflows that support mapping and machine learning training data

## Core Ideas for the Week

### Web maps are built from data, code, and services

A web map is not just a static image. It is a combination of data sources, map tiles, hosting infrastructure, and client-side code that requests and renders map content dynamically.

This week reinforces that web mapping workflows often include:

- exporting a geographic raster or vector dataset as tiles
- styling data so it works well in a web viewer
- publishing files or hosting services so the map can be shared
- writing simple web code that requests the map and data layers

### APIs make spatial data reusable

Geocoding and tile services are examples of APIs that let one application request spatial data from another. Students learn why APIs are useful for:

- converting tabular addresses into coordinates
- retrieving map tiles or feature data on demand
- sharing results through GitHub Pages or other web hosts

### Good lab design connects desktop skills to online delivery

This week begins with desktop-oriented workflows in QGIS and shifts toward web publication. The goal is for students to see how the same geographic content can be used in:

- desktop GIS for analysis and preparation
- web map viewers for interactive exploration
- machine learning and labeling workflows for model training

## How the Week Fits Together

### [00 - OPTIONAL - Making & Serving Map Tiles with QGIS](00_OPTIONAL_making_and_serving_map_tiles_with_qgis.md)

This workshop introduces the process of creating XYZ tiles from a georeferenced raster and preparing them for web delivery. It emphasizes the relationship between tile pyramids, coordinate systems, and web hosting.

### [01 - TURN IN - Geocoding Addresses with locator.stanford.edu & OpenRefine](01_TURN_IN_geocoding_addresses_with_locator_stanford_edu_and_openrefine.md)

This lab teaches students how to use OpenRefine and a geocoding API to convert a table of addresses into geographic coordinates. It reinforces why clean data and consistent fields are essential for reliable geocoding.

### [02 - TURN IN - Creating & Hosting a WebMap, using MapLibre & Turf.js and GitHub Pages](02_TURN_IN_creating_and_hosting_a_webmap_using_maplibre_and_turf_js_and_github_pages.md)

This lab shows how a web map is constructed from HTML, JavaScript, a tile layer, and hosted data. Students publish the result using GitHub Pages so the map can be shared online.

### [03 - TURN IN - Getting XYZ Tiles from Google Earth Engine](03_TURN_IN_getting_xyz_tiles_from_earth_engine.md)

This lab bridges cloud-based spatial analysis with desktop GIS by exporting an Earth Engine visualization as an XYZ tile service and bringing it into QGIS.

### [04 - TURN IN BONUS LAB - Tree Labeling in QGIS](04_TURN_IN_BONUS_LAB_tree_labeling_in_qgis.md)

This bonus turn-in asks students to contribute 10 additional labeled grid cells for up to 10 extra points added to their quarter total. It introduces tree crown labeling workflows that support training data creation for machine learning.

## What to Expect in the Individual Lab Documents

The weekly README is intended as the conceptual guide for Week 07. Each individual lab page provides the operational steps needed to complete the exercise.

That means:

- use this page to understand the week’s themes and how the labs connect
- use the lab pages for the step-by-step workflow instructions
- expect the web mapping labs to combine GIS preparation with online publication and service-based workflows
