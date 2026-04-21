# Week 01 - Coordinates, Geodesy and Geometries

## Overview

Week 01 introduces the coordinate ideas that support everything else in the course.

Before students can analyze imagery, measure features, or write useful Earth Engine scripts, they need to understand what coordinates mean, how geometries are constructed from them, and why coordinate reference systems affect measurement and display. This week builds that foundation by moving between browser-based tools, QGIS, and Google Earth Engine while staying centered on the same core problem: spatial data only makes sense when coordinates are tied to a reference system.

You will move from:

1. defining a study area as a GeoJSON feature
2. examining how coordinate reference systems affect map measurement
3. creating and inspecting basic geometries in Google Earth Engine

## Core Ideas for the Week

### Coordinates need a reference system

A coordinate pair is not meaningful by itself. It only becomes a real location when it is interpreted within a **coordinate reference system (CRS)**.

This week you will encounter two broad CRS types:

- a **geographic CRS**, which stores locations as latitude and longitude
- a **projected CRS**, which places the curved Earth onto a flat surface so measurements can be made in linear units such as meters or feet

### Geometry begins with coordinate pairs

Spatial features are built from coordinates.

- A **point** is one coordinate pair.
- A **line** is an ordered list of coordinate pairs.
- A **polygon** is a closed boundary made from coordinate pairs.
- A **rectangle** is a simple polygon often used as an **area of interest (AOI)**.

You will use those ideas in both GeoJSON and Earth Engine so the relationship between coordinates and geometry becomes explicit.

### The Earth is curved, maps are flat

One of the central ideas in introductory GIS is that measurements change depending on how the Earth is represented.

This is where several important terms belong:

- an **ellipsoid** is a smooth mathematical model used for horizontal positioning
- a **geoid** is a gravity-based surface related to mean sea level
- a **projection** transforms locations from the curved Earth to a flat surface
- a **projected CRS** adds units, parameters, and reference information that make planar mapping possible

The projection error lab makes those distinctions visible by comparing ellipsoidal and planar area.

### Earth Engine still depends on spatial fundamentals

Although Google Earth Engine feels very different from desktop GIS, it still depends on the same spatial ideas.

When you define a point, polygon, or rectangle in Earth Engine, you are still working with coordinates, geometry types, and a CRS. Week 01 is meant to make that continuity clear early.

## How the Week Fits Together

### [01 - TURN IN - Create an Area of Interest with GeoJSON.io](01_TURN_IN_create_an_aoi_with_geojson_io.md)

This lab asks you to define a personal study area for later work in the course. The main point is to create a clean GeoJSON AOI while recognizing that even a simple rectangle is a geometry built from coordinates and stored in a standard spatial format.

### [02 - TURN IN - Projection Error Measurement with QGIS](02_TURN_IN_projection_error_measurement_with_qgis.md)

This lab turns geodesy and projection ideas into something measurable. You will compare county area measured on the ellipsoid with county area measured in a projected system, then map the percent difference so distortion becomes visible.

### [03 - TURN IN - Coordinates and Geometries with Google Earth Engine](03_TURN_IN_introducing_google_earth_engine_with_coordinates_and_pixels.md)

This lab introduces the Earth Engine Code Editor while reinforcing the same coordinate ideas from the first two labs. You will inspect coordinate pairs, create points, lines, polygons, and rectangles, and practice reading Earth Engine objects through the Console and map display.

## What to Expect in the Individual Lab Documents

The individual Week 01 lab pages are intended to be more hands-on and workflow-focused.

That means:

- the lab steps focus on what to open, inspect, create, measure, and export
- the broader conceptual framing is concentrated here in the weekly overview
- short notes remain inside each lab wherever they directly explain a workflow decision or prevent a likely beginner mistake

Use this page as the conceptual guide for Week 01, and use the lab documents as the operational guides for completing the exercises.
