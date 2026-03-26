# Glossary

This glossary is for **EARTHSYS 144 / ESS 164** and is aimed at students who are new to spatial data, GIS, and remote sensing.

Many of the definitions below are course-oriented paraphrases of foundational GIS terminology, with special attention to terms commonly used in QGIS, ArcGIS Online, Google Earth Engine, and introductory cartography. Several core definitions are informed by the **Esri GIS Dictionary**.

## Area of Interest (AOI)

A specific geographic area selected for analysis or mapping. An AOI helps limit your work to the place relevant to your question.

## Attribute

Descriptive information associated with a spatial feature or raster cell. For example, a school point may have attributes such as name, enrollment, or address.

## Attribute Table

A table containing the attributes associated with the features in a vector layer, or sometimes the values associated with raster categories.

## Band

One layer of information in a raster image. In satellite imagery, different bands measure different parts of the electromagnetic spectrum, such as red, green, blue, or near infrared.

## Basemap

A background map layer used to provide context for other spatial data. Examples include satellite imagery, street maps, and light gray reference maps.

## Buffer

A zone of a specified distance around a feature or set of features. Buffers are often used to ask proximity questions, such as what lies within 500 meters of a school.

## Cartography

The design and making of maps. Cartography includes choices about symbolization, labeling, layout, scale, color, and visual hierarchy.

## Coordinate System

A framework used to locate positions in space. In GIS, coordinate systems define how locations are described, whether in latitude and longitude or in projected map coordinates.

## Coordinate Reference System (CRS)

The full definition of how spatial data is referenced to the earth. A CRS includes a coordinate system and enough information to interpret locations correctly on a map.

## Controlled Vocabulary

A defined set of allowed terms used to keep data entry consistent. In field forms and attribute tables, controlled vocabularies reduce spelling differences, ambiguity, and messy categories.

## Control Point

A known location used during georeferencing to match positions on an image or scanned map to positions in real-world coordinates.

## Classification

The process of sorting data into categories. In GIS, classification may refer to symbol classes on a map or to assigning raster pixels to land cover or other categories.

## Clip

A geoprocessing operation that cuts a dataset down to a specified boundary or area of interest.

## Data Type

The kind of value stored in a field, such as text, integer, decimal number, or date. Matching data types is important for joins, calculations, and queries.

## Digitizing

The process of creating vector features from imagery, maps, or other references by tracing or drawing points, lines, and polygons.

## Ellipsoid

A smooth mathematical model of the earth used in coordinate systems and geodesy. Unlike the geoid, an ellipsoid is simplified so it can be used for measurement and calculation.

## Feature

A vector object representing something on the landscape. Features are usually stored as points, lines, or polygons.

## Field

A column in an attribute table. Each field stores one type of information, such as `NAME`, `DATE`, or `POPULATION`.

## Field Calculator

A tool in GIS software, especially QGIS, used to create new fields, update attribute values, and perform calculations using expressions.

## Foreign Key

A field in one table whose values refer to records in another table. Foreign keys are used to connect related tables.

## Geoprocessing

Operations that create new spatial data from existing data. Common geoprocessing tasks include buffering, clipping, overlay, dissolving, and spatial selection.

## Geocoding

The process of converting a text description of a location, such as a street address, into geographic coordinates.

## Geodatabase

A spatial database format that can store multiple layers, tables, relationships, and other GIS information in one structure. In practice, the term may refer either to Esri geodatabases specifically or more generally to a spatial database.

## GeoJSON

An open format for storing vector spatial data using JSON. GeoJSON commonly stores points, lines, polygons, and their attributes.

## Georeferencing

The process of aligning an image, scanned map, or other dataset to real-world coordinates so it can be used with other spatial data.

## GeoTIFF

A TIFF image file that includes geographic information, allowing it to be placed correctly in geographic space.

## Geographic Information System (GIS)

A system for working with geographically referenced data. GIS is used to organize, visualize, analyze, and interpret spatial information.

## Geoid

A model of the earth's gravitational surface used in discussions of elevation and the shape of the earth. It is different from the simpler mathematical surface used by an ellipsoid.

## Image

In raster GIS and remote sensing, an image is a grid of pixels. In Earth Engine, an `Image` is often a single raster dataset or a single scene from a larger collection.

## Image Collection

In Google Earth Engine, a set of images grouped together, often across time. An image collection may contain many satellite scenes for the same place.

## Join

An operation that connects records from one table to records in another table using a shared field. Joins are often used to add non-spatial information to an existing spatial layer.

## Key Field

A field used to connect records between tables. A key field may function as a primary key in one table and a foreign key in another.

## Label

Text placed on a map to identify features or provide information. Labels can be based on attribute values such as names or measurements.

## Layer

A set of spatial data displayed in a map. A layer may be vector, raster, tabular, or a web service.

## Legend

A map element explaining the meaning of symbols, colors, and patterns used in a map.

## Map Layout

The arrangement of map elements for export or printing. A layout usually includes the map frame, title, legend, scale bar, author name, date, and other cartographic elements.

## Map Projection

A mathematical method for representing the curved surface of the earth on a flat map. Every projection introduces some distortion in area, shape, distance, direction, or a combination of these.

## Mask

In raster analysis, a way of hiding or excluding pixels that do not meet a condition. In Google Earth Engine, `updateMask()` is used to control which pixels remain visible or available for analysis.

## Metadata

Information about a dataset, such as who created it, when it was made, what it represents, what coordinate system it uses, and how it should be interpreted.

## Many-to-Many Relationship

A table relationship in which many records in one table can relate to many records in another table. These relationships often require an intermediate bridge or junction table.

## Many-to-One Relationship

A table relationship in which many records in one table relate to one record in another table. In GIS, many polygons may share one lookup-table record, such as a soil type description.

## One-to-Many Relationship

A relationship in which one record in one table corresponds to many records in another table. In GIS, one soil type may relate to many soil polygons.

## Offline Area

A packaged copy of a web map and its needed layers for use on a mobile device without reliable internet access. Offline areas are important in field data collection.

## On-the-Fly Reprojection

The process by which GIS software displays layers with different coordinate reference systems together by reprojecting them temporarily for viewing. This does not necessarily change the stored source data.

## Pixel

The smallest cell in a raster dataset. Each pixel stores a value, such as reflectance, temperature, elevation, probability, or class.

## PLSS (Public Land Survey System)

A land subdivision system used in much of the United States. PLSS grids can be useful as a reference framework in historical mapping and georeferencing exercises.

## Primary Key

A field whose values uniquely identify each record in a table. Primary keys are often used to support joins and relationships between tables.

## Query

A request for specific data from a table or layer. Queries are used to filter, sort, summarize, or select records based on conditions.

## Raster

A spatial data model made of a regular grid of cells or pixels. Raster data is commonly used for imagery, elevation, temperature, and other continuous surfaces.

## Remote Sensing

The collection of information about the earth from sensors that do not require direct physical contact, such as satellites or aircraft-based sensors.

## Schema

The planned structure of a dataset, especially its fields, field types, allowed values, and organization. Good schema design is essential for reliable field collection and analysis.

## Resolution

The level of detail in a dataset. In raster data, spatial resolution usually refers to the size of each pixel on the ground.

## Scale

The relationship between distance on a map and distance on the earth. Scale can also refer more broadly to the level of geographic detail or extent being studied.

## Shapefile

A widely used vector data format that stores geometry and attributes across several linked files. Although older, it is still common in introductory GIS workflows.

## Spatial Analysis

The process of asking and answering questions using the locations, attributes, and relationships of geographic data.

## Spatial Overlay

An analysis process that compares or combines layers based on how their features overlap in space. Overlay is a foundational idea in vector GIS.

## Spatial Join

A join based on spatial relationship rather than only a shared field. For example, points may be joined to polygons based on whether the points fall inside the polygons.

## Spatial Resolution

The ground area represented by each pixel in a raster dataset. For example, a 10-meter raster has pixels representing 10 by 10 meter areas on the ground.

## SQL

Structured Query Language, a language used to ask questions of tables and databases. In GIS, SQL is often used to filter records, join tables, and summarize data.

## Symbology

The visual styling of map layers, including colors, line styles, marker shapes, fills, and classification methods.

## Table

A structured set of rows and columns used to store information. In GIS, tables may be spatially linked to layers or may exist as standalone tabular data.

## Threshold

A chosen cutoff value used to separate pixels or records into categories. For example, you might keep only pixels with tree probability greater than 0.6.

## Virtual Layer

In QGIS, a layer created from an SQL query rather than from a separate saved file. Virtual layers let you treat project layers like database tables for querying and analysis.

## Vector

A spatial data model that represents geographic features as points, lines, and polygons.

## Visualization

The way data is displayed so it can be interpreted visually. In GIS and remote sensing, visualization includes map design, color ramps, band combinations, and symbol choices.

## Web Map

A map designed to be viewed in a web browser or mobile app, often combining basemaps, hosted layers, popups, forms, and sharing settings.

## Sources

- Esri GIS Dictionary: https://support.esri.com/en-us/gis-dictionary
- Course usage and lab context from the materials in this repository
