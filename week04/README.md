# Week 04 - Basic Vector Analysis

## Overview

Week 04 moves from table-focused GIS work into **vector analysis**.

The central theme this week is that polygon, line, and network layers are not only things you can display on a map. They are also inputs to analytical workflows that transform geometry, measure spatial relationships, and produce new spatial summaries.

This week brings together several common forms of vector analysis:

1. overlay-based analysis
2. areal interpolation across mismatched polygon systems
3. network analysis along streets or paths
4. enrichment and reporting workflows using external data platforms
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

### [00 - Buffering & Overlay Analysis in QGIS](00_buffering_and_overlay_analysis_in_qgis.md)

This lab introduces fixed-distance and variable-distance buffers, then uses overlay tools to identify candidate areas that satisfy both lake and road proximity criteria.

### [01 - Areal Interpolation of Attributes with QGIS](01_areal_interpolation_of_attributes_with_qgis.md)

This lab introduces area-weighted interpolation using Connecticut block groups and watershed basins. The main goal is to estimate population totals for a target geography whose boundaries do not match the original Census units.

### [02 - Network Analysis with QGIS](02_network_analysis_with_qgis.md)

This lab introduces street networks as analytical structures, then uses one-way attributes and the shortest-path tool to calculate and map a route through the San Francisco street system.

### [03 - Introducing SimplyAnalytics.com](03_introducing_simplyanalytics_com.md)

This lab introduces a Stanford-licensed demographic reporting platform, then brings exported county data into QGIS to join Bigfoot sightings by location and finish with either a per-capita map or an advanced geographically weighted regression workflow.

### 04 - Additional Week 04 Exercise

Placeholder: this slot is reserved for another vector-analysis or enrichment exercise if the weekly sequence expands.

### [05 - Tabular/Vector Data in Google Earth Engine](05_tabular_vector_data_in_google_earth_engine.md)

Placeholder: this lab returns next in the sequence as the course moves into analysis, using feature collections for measurement and summary of pixel data in Earth Engine.

## What to Expect in the Individual Lab Documents

The individual Week 04 lab pages are intended to be workflow-focused.

That means:

- the step-by-step documents emphasize tools, processing order, and interpretation of outputs
- conceptual framing is concentrated here in the weekly overview
- shorter notes remain inside the labs wherever they explain a workflow choice or help prevent a likely beginner mistake

Use this page as the conceptual guide for Week 04, and use the individual lab pages as the operational guides for completing the exercises.
