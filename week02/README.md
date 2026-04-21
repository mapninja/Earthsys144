# Week 02 - Making and Collecting Data

## Overview

Week 02 shifts the course from working with existing spatial data toward creating it.

That is an important transition. A large share of GIS work is not just analyzing data that already exists. It is deciding what should count as data, how it should be structured, how accurately it should be captured, and how it should be documented so the results remain useful later.

This week approaches data creation from several directions:

1. designing and collecting new observations in the field
2. georeferencing a scanned historical map so it becomes usable spatial data
3. digitizing new vector features from imagery in QGIS
4. understanding how raster collections and pixels are structured in Earth Engine

## Core Ideas for the Week

### Creating data requires design decisions

Spatial data does not begin as neutral truth. Someone decides:

- what the feature is
- what geometry type it should have
- which attributes need to be recorded
- how values should be standardized
- how accurate the result needs to be for the task at hand

Those decisions shape the quality and usefulness of the finished dataset.

### A dataset is more than geometry

Whether you are collecting field observations or digitizing from imagery, you are also creating a table.

That means schema design matters:

- field names should be understandable
- attribute types should match the kind of values being stored
- controlled vocabularies help reduce messy, inconsistent entries
- project organization matters because the files, layers, and forms all need to stay connected

### Georeferencing connects images to coordinate space

A scanned map or image file is just a picture until it is tied to known locations in a coordinate system.

Georeferencing depends on:

- choosing a useful reference layer
- placing control points carefully
- thinking about projection and distortion
- checking the result visually and spatially

This is one of the most important workflows for historical GIS and archival mapping.

### Digitizing is interpretive

When you digitize points, lines, or polygons from imagery, you are making judgments.

You are deciding:

- where a boundary begins and ends
- whether something should be represented as a point, line, or polygon
- how much detail is appropriate
- how to keep features topologically clean and visually consistent

This is why data creation is never only technical. It is also analytical and interpretive.

### Raster data is also structured data

The Earth Engine lab for this week extends the data-creation theme into raster thinking.

Students often see imagery as a picture first. This week asks you to see it as structured data:

- an **image collection** contains many images
- an **image** contains one or more bands
- a **band** stores one kind of measurement or modeled value
- a **pixel** stores the value at a specific location

That structure matters because later remote sensing analysis depends on filtering, masking, and comparing those values deliberately.

## How the Week Fits Together

### [01 - PICK ONE TO TURN IN - Introducing ArcGIS Field Maps and ArcGIS Online for Data Collection](01_PICK_ONE_TO_TURN_IN_introducing_arcgis_fieldmaps_and_arcgis_online_for_data_collection.md)

This lab focuses on designing a field collection workflow. The main goal is to think carefully about geometry, forms, schema, controlled vocabularies, offline use, and the practical realities of collecting new data with a mobile app.

### [02 - PICK ONE TO TURN IN - Georeferencing with QGIS and AllMaps.org](02_PICK_ONE_TO_TURN_IN_georeferencing_with_qgis_and_allmaps_org.md)

This lab introduces georeferencing through a historical Wyoming map and a PLSS reference layer. The emphasis is on connecting an image to coordinate space and understanding why reference data, projection choice, and control-point placement matter.

### [03 - TURN IN - Editing with QGIS](03_TURN_IN_data_creation_in_qgis.md)

This lab introduces vector data creation through digitizing. You will create point, line, and polygon layers from imagery and learn that editing in GIS depends on careful interpretation, clean structure, and good project habits.

### [04 - TURN IN - Introducing Collections, Images, Bands, and Pixels in Google Earth Engine](04_TURN_IN_introducing_collections_and_pixels_in_earth_engine.md)

This lab introduces raster structure in Earth Engine. The goal is to understand how collections, images, bands, and pixels relate to one another before moving deeper into analysis later in the course.

## What to Expect in the Individual Lab Documents

The individual Week 02 lab pages are intended to be more hands-on and workflow-focused.

That means:

- the lab steps emphasize what to download, configure, digitize, inspect, and export
- the broader conceptual framing is concentrated here in the weekly overview
- shorter notes remain inside the labs wherever they explain a workflow choice, a setup dependency, or a likely beginner stumbling point

Use this page as the conceptual guide for Week 02, and use the individual lab documents as the operational guides for completing the exercises.
