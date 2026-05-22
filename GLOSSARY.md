# Glossary

This glossary is part of the **Lab Section Guide for EarthSys144: Fundamentals of GIScience**, updated for **Spring 2026**. It is aimed at students who are new to spatial data, GIS, and remote sensing.

Many of the definitions below are course-oriented paraphrases of foundational GIS terminology, with special attention to terms commonly used in QGIS, ArcGIS Online, Google Earth Engine, and introductory cartography. Several core definitions are informed by the **Esri GIS Dictionary**.

## Area of Interest (AOI)

A specific geographic area selected for analysis or mapping. An AOI helps limit your work to the place relevant to your question.

## Areal Interpolation

A method for estimating values from one set of polygon boundaries to another when the source and target areas do not match. In introductory GIS, areal interpolation often uses area-weighting to estimate how much of a population or attribute should be assigned to each target polygon.

## ArcGIS StoryMaps

A web-based Esri platform for combining maps, text, images, multimedia, and other content into a spatial narrative. In this course, StoryMaps are used as a way to communicate GIS analysis as an explanation or argument, not just as a standalone map.

## Absolute Change

The raw numeric difference between one value and another. In GIS tables, absolute change is often calculated by subtracting an earlier value from a later one.

## Attribute

Descriptive information associated with a spatial feature or raster cell. For example, a school point may have attributes such as name, enrollment, or address.

## Attribute Table

A table containing the attributes associated with the features in a vector layer, or sometimes the values associated with raster categories.

## Band

One layer of information in a raster image. In satellite imagery, different bands measure different parts of the electromagnetic spectrum, such as red, green, blue, or near infrared.

## Band Combination

A way of displaying selected raster or imagery bands through the red, green, and blue channels of a screen. Different band combinations can make vegetation, water, built surfaces, bare soil, rock, or burn scars easier to interpret.

## Basemap

A background map layer used to provide context for other spatial data. Examples include satellite imagery, street maps, and light gray reference maps.

## Buffer

A zone of a specified distance around a feature or set of features. Buffers are often used to ask proximity questions, such as what lies within 500 meters of a school.

## Callout

Text or a graphic annotation placed near a map feature and connected to it with a line, arrow, or pointer. Callouts are often used in layouts to draw attention to an important place or event without crowding the map itself.

## Cartography

The design and making of maps. Cartography includes choices about symbolization, labeling, layout, scale, color, and visual hierarchy.

## Choropleth Map

A map that uses differences in color or shading to show how a value varies across areas such as counties, census tracts, or states. Choropleth maps depend heavily on sensible classification and symbol choices.

## Column

A vertical field in a table that stores one type of information for every record. In GIS attribute tables, a column might store county name, population, or median household income.

## Coordinate System

A framework used to locate positions in space. In GIS, coordinate systems define how locations are described, whether in latitude and longitude or in projected map coordinates.

## Coordinate Reference System (CRS)

The full definition of how spatial data is referenced to the earth. A CRS includes a coordinate system and enough information to interpret locations correctly on a map.

## Controlled Vocabulary

A defined set of allowed terms used to keep data entry consistent. In field forms and attribute tables, controlled vocabularies reduce spelling differences, ambiguity, and messy categories.

## Cost Surface

A raster in which each pixel stores the modeled cost of moving through that location. Cost may represent time, effort, money, risk, or another form of resistance.

## Control Point

A known location used during georeferencing to match positions on an image or scanned map to positions in real-world coordinates.

## Cumulative Cost

A raster analysis method that accumulates movement cost outward from a source location. The result shows the least accumulated cost required to reach each pixel from the source.

## Classification

The process of sorting data into categories. In GIS, classification may refer to symbol classes on a map or to assigning raster pixels to land cover or other categories.

## Clip

A geoprocessing operation that cuts a dataset down to a specified boundary or area of interest.

## Data Type

The kind of value stored in a field, such as text, integer, decimal number, or date. Matching data types is important for joins, calculations, and queries.

## Digitizing

The process of creating vector features from imagery, maps, or other references by tracing or drawing points, lines, and polygons.

## Distance Raster

A raster in which each pixel stores its distance to the nearest target feature, such as a road, river, power plant, or other mapped object. Distance rasters are useful for proximity analysis because they turn vector locations into a continuous surface of distance values.

## Edge Effects

Differences in analysis results caused by the boundary of the study area rather than by the real-world pattern being studied. Edge effects are common when nearby features outside the analysis boundary are excluded even though they would influence results near the boundary.

## Ellipsoid

A smooth mathematical model of the earth used in coordinate systems and geodesy. Unlike the geoid, an ellipsoid is simplified so it can be used for measurement and calculation.

## Feature

A vector object representing something on the landscape. Features are usually stored as points, lines, or polygons.

## Field

A column in an attribute table. Each field stores one type of information, such as `NAME`, `DATE`, or `POPULATION`.

## Field Name

The label used to identify a field in a table. A field name such as `MHHINC2020` tells you what kind of values that column stores.

## Field Calculator

A tool in GIS software, especially QGIS, used to create new fields, update attribute values, and perform calculations using expressions.

## Flow Accumulation

A raster hydrology layer that counts how many upstream cells drain through each cell. High flow-accumulation values often indicate where water is likely to concentrate into channels or streams.

## Flow Direction

A raster hydrology layer that records the downslope direction water would flow from each cell. Flow direction is derived from a DEM and is used to trace drainage paths and delineate watersheds.

## Friction Surface

A raster surface that represents how difficult it is to move across each pixel. In movement modeling, steep slopes, water, dense vegetation, or other barriers may be treated as friction.

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

## Google Sheets JSONP

A way for a simple web page to request public Google Sheet data through a script tag instead of a CSV download. In this course, JSONP helps avoid common browser CORS restrictions when building a spreadsheet-driven web map.

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

## HSV

A color model that describes color using hue, saturation, and value. In remote sensing, HSV can be used for pan sharpening by keeping hue and saturation from a color image while replacing value with a sharper panchromatic band.

## Iron Oxide Ratio

A geology-oriented band ratio that compares red and blue reflectance to highlight possible iron-rich exposed rock or soil. Like other spectral indices, it should be interpreted with true color imagery, local knowledge, and appropriate caution.

## Isochrone

A line or area representing equal travel time from a source. In terrain-based movement modeling, isochrones can show what places are reachable within one hour, one day, or another time threshold.

## Join

An operation that connects records from one table to records in another table using a shared field. Joins are often used to add non-spatial information to an existing spatial layer.

## JSONP

Short for JSON with Padding. JSONP is an older browser pattern that loads data using a `<script>` tag and calls a named JavaScript function when the data arrives.

## Key Field

A field used to connect records between tables. A key field may function as a primary key in one table and a foreign key in another.

## Label

Text placed on a map to identify features or provide information. Labels can be based on attribute values such as names or measurements.

## Landsat

A long-running series of earth observation satellite missions operated by NASA and the U.S. Geological Survey. Landsat imagery is commonly used for land cover, vegetation, water, urban, geology, and change-detection analysis.

## Layer

A set of spatial data displayed in a map. A layer may be vector, raster, tabular, or a web service.

## Legibility

The degree to which map text, symbols, and layout elements can be read and understood easily. Legibility depends on choices such as font size, contrast, spacing, and the amount of visual clutter in the design.

## Legend

A map element explaining the meaning of symbols, colors, and patterns used in a map.

## Locator Map

A small supporting map that shows where the main map area sits within a larger geographic context. Locator maps help readers orient themselves quickly, especially when the main map covers a small or unfamiliar place.

## Map Layout

The arrangement of map elements for export or printing. A layout usually includes the map frame, title, legend, scale bar, author name, date, and other cartographic elements.

## MapLibre GL JS

An open-source JavaScript library for drawing interactive web maps in a browser. In this course, MapLibre is used to display basemaps, GeoJSON points, and popups from an HTML file.

## Map Projection

A mathematical method for representing the curved surface of the earth on a flat map. Every projection introduces some distortion in area, shape, distance, direction, or a combination of these.

## Mask

In raster analysis, a way of hiding or excluding pixels that do not meet a condition. In Google Earth Engine, `updateMask()` is used to control which pixels remain visible or available for analysis.

## Metadata

Information about a dataset, such as who created it, when it was made, what it represents, what coordinate system it uses, and how it should be interpreted.

## Normalized Difference

A ratio that compares two raster bands by subtracting them and dividing by their sum. Normalized difference formulas are common in remote sensing because they emphasize contrast between wavelengths while reducing the effect of overall brightness.

## Normalized Burn Ratio (NBR)

A spectral index that compares near infrared and shortwave infrared reflectance to highlight burned-area signals. NBR is often used for fire analysis, especially when comparing pre-fire and post-fire imagery.

## Normalized Difference Built-up Index (NDBI)

A spectral index that compares shortwave infrared and near infrared reflectance to highlight built-up or dry impervious surfaces. NDBI can also respond to bare soil, so it should be interpreted alongside true color imagery and local context.

## Normalized Difference Moisture Index (NDMI)

A spectral index that compares near infrared and shortwave infrared reflectance to highlight moisture differences in vegetation or soil.

## Normalized Difference Vegetation Index (NDVI)

A spectral index that compares near infrared and red reflectance to highlight green vegetation vigor. Healthy vegetation often has high NDVI because it reflects near infrared strongly and absorbs red light.

## Normalized Difference Water Index (NDWI)

A spectral index that compares green and near infrared reflectance to highlight open water or water-related contrast, depending on the specific formula and setting.

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

## Pan Sharpening

An image-fusion technique that combines lower-resolution multispectral color bands with a higher-resolution panchromatic band to create a sharper-looking color image. Pan-sharpened imagery is useful for visual interpretation but should be used cautiously for quantitative spectral analysis.

## Panchromatic Band

A grayscale satellite image band that records a broad range of wavelengths in one band. Panchromatic bands often have finer spatial resolution than multispectral color bands from the same sensor.

## Percent Change

A measure of change expressed relative to the starting value, usually as a percentage. Percent change is often more useful than absolute change when comparing places with very different starting values.

## PLSS (Public Land Survey System)

A land subdivision system used in much of the United States. PLSS grids can be useful as a reference framework in historical mapping and georeferencing exercises.

## Pour Point

The outlet point used to delineate a watershed. In raster hydrology, the pour point should align with the raster cell representing the intended drainage location so the watershed model traces the correct contributing area.

## Primary Key

A field whose values uniquely identify each record in a table. Primary keys are often used to support joins and relationships between tables.

## Query

A request for specific data from a table or layer. Queries are used to filter, sort, summarize, or select records based on conditions.

## Row

A horizontal record in a table. In an attribute table, each row usually represents one spatial feature such as one county, road, or parcel.

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

## Sentinel-2

A European Space Agency satellite mission that collects multispectral imagery of the earth. Sentinel-2 imagery is commonly used for vegetation, water, urban, burn, agriculture, and land-cover analysis.

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

## Spectral Index

A raster layer calculated from two or more imagery bands to highlight a surface property such as vegetation greenness, moisture, water, burned area, built-up land, or bare soil.

## Snapping

An editing or processing operation that moves a point, line, or polygon vertex to align with another feature or grid location. In watershed analysis, snapping a pour point helps align a vector outlet with the raster cell center used by the hydrologic model.

## StoryMap

A web-based spatial presentation that combines maps with narrative text, images, video, and other media. A StoryMap is useful when the goal is to explain a spatial question, method, result, and interpretation in a reader-friendly format.

## SQL

Structured Query Language, a language used to ask questions of tables and databases. In GIS, SQL is often used to filter records, join tables, and summarize data.

## Static Website

A website made from files such as HTML, CSS, JavaScript, and images that can be served directly without a custom database or server-side application. GitHub Pages and Stanford AFS can host static websites.

## Symbology

The visual styling of map layers, including colors, line styles, marker shapes, fills, and classification methods.

## Table

A structured set of rows and columns used to store information. In GIS, tables may be spatially linked to layers or may exist as standalone tabular data.

## Threshold

A chosen cutoff value used to separate pixels or records into categories. For example, you might keep only pixels with tree probability greater than 0.6.

## Top Of Atmosphere (TOA)

Satellite reflectance measured or modeled at the top of the earth's atmosphere, before full atmospheric correction to surface reflectance. TOA imagery is often useful for display and introductory image-processing demonstrations.

## Virtual Layer

In QGIS, a layer created from an SQL query rather than from a separate saved file. Virtual layers let you treat project layers like database tables for querying and analysis.

## Vector

A spatial data model that represents geographic features as points, lines, and polygons.

## Visualization

The way data is displayed so it can be interpreted visually. In GIS and remote sensing, visualization includes map design, color ramps, band combinations, and symbol choices.

## Visual Hierarchy

The ordering of map elements so the most important information stands out first and less important information recedes. Visual hierarchy is created through size, color, contrast, placement, and styling choices.

## Web Map

A map designed to be viewed in a web browser or mobile app, often combining basemaps, hosted layers, popups, forms, and sharing settings.

## XYZ Tile

A small map image requested through a URL pattern that uses `{z}`, `{x}`, and `{y}` placeholders for zoom level, tile column, and tile row. XYZ tiles let web maps and GIS software load only the pieces of a map needed for the current view.

## Sources

- Esri GIS Dictionary: https://support.esri.com/en-us/gis-dictionary
- Course usage and lab context from the materials in this repository
