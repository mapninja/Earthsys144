# Week 04 - Basic Vector Analysis

## Overview

Week 04 moves from table-focused GIS work into **vector analysis**.

The central theme this week is that polygon, line, and network layers are not only things you can display on a map. They are also inputs to analytical workflows that transform geometry, measure spatial relationships, and produce new spatial summaries.

This week brings together several common forms of vector analysis:

1. overlay-based analysis
2. areal interpolation across mismatched polygon systems
3. network analysis along streets or paths
4. optional enrichment and reporting workflows using external data platforms
5. a returning Earth Engine exercise that connects vector features to raster summaries

## Core Ideas for the Week

### Overlay changes what a boundary means

When you buffer, intersect, clip, or union layers, you are not just drawing new shapes. You are creating new spatial units for analysis.

That matters because many GIS workflows depend on redefining geography before measuring or summarizing anything.

### Boundaries rarely line up perfectly

Areal interpolation exists because the units where data is collected are often not the same as the units where you want to report results.

This week, that means learning to estimate values across polygon systems rather than assuming the source boundaries and target boundaries match.

### Networks are analytical structures

Street and path layers are more than lines on a map. In a network analysis workflow, they become connected systems with direction, impedance, and reachable paths.

### External platforms still depend on GIS logic

A workflow that uses services such as SimplyAnalytics or Google Earth Engine still depends on the same GIS thinking:

- what is the unit of analysis
- what is the reporting geography
- what is being measured or summarized
- what assumptions are built into the result

## How the Week Fits Together

### [00 - OPTIONAL - Introducing SimplyAnalytics.com](00_OPTIONAL_introducing_simplyanalytics_com.md)

This optional workshop introduces a Stanford-licensed demographic reporting platform, then brings exported county data into QGIS to join Bigfoot sightings by location and map the result as a normalized county pattern.

### [01 - TURN IN - Buffering & Overlay Analysis in QGIS](01_TURN_IN_buffering_and_overlay_analysis_in_qgis.md)

This lab uses California lakes, state highways, public-access lands, and statewide parcels to support site selection for potential expanded state camping facilities through buffering, overlay, and parcel selection.

### [02 - TURN IN - Areal Interpolation of Attributes with QGIS](02_TURN_IN_areal_interpolation_of_attributes_with_qgis.md)

This lab uses Santa Clara County block-group population data and Fire Hazard Severity Zones to estimate how many people live in each hazard risk class through area-weighted interpolation.

### [03 - TURN IN - Network Analysis with QGIS](03_TURN_IN_network_analysis_with_qgis.md)

This lab introduces street networks as analytical structures, then uses one-way attributes and the shortest-path tool to calculate and map a route through the San Francisco street system.

### [04 - TURN IN - Tabular/Vector Data in Google Earth Engine](04_TURN_IN_tabular_vector_data_in_google_earth_engine.md)

This lab returns to Earth Engine as the course moves into analysis, using feature collections for filtering, attribute inspection, table joins, spatial joins, and raster summaries.

## What to Expect in the Individual Lab Documents

The individual Week 04 lab pages are intended to be workflow-focused.

That means:

- the step-by-step documents emphasize tools, processing order, and interpretation of outputs
- conceptual framing is concentrated here in the weekly overview
- shorter notes remain inside the labs wherever they explain a workflow choice or help prevent a likely beginner mistake

Use this page as the conceptual guide for Week 04, and use the individual lab pages as the operational guides for completing the exercises.
