# Earthsys144 - New Syllabus (working)

## Foundational platforms

- Desktop - QGIS
- Cloud - Google Earth Engine
- Cloud - ArcGIS Online?
- Code - Colab: Python/GDAL/Shapely/GeoPANDAS/jq

## Week 01 - Getting Ready and Basic Skills

### Lecture 01 - Introduction to Spatial Data Science

1. Point, Lines, Polygons & Pixels 101

### Lecture 02 - Setup & Introduction

GitHub/AFS, terminal, QGIS setup, WBT & SAGANP Plugins, AGO & Groups sharing, GEE  

   1. Learn your machine
      1. Data management
         1. Where to put things
         2. Where not to put things
            1. iCloud and the ‘sync’ related problems
      2. Unzipping a file
      3. File Naming
      4. File Types

   2. Installing Software we will use
      1. QGIS Installation
         1. Quick map Services
         2. Whitebox Tools
         3. SAGA and SAGA NG plugin
      2. Other Software
         1. OpenRefine
         2. SecureFTP
         3. Text Editor
   3. Logins
       1. Google Earth Engine Login & Link Sharing
       2. ArcGIS Online
       3. Github.com
       4. Google Colab
       5. Stanford AFS web hosting
   4. Creating & Naming Documents
      1. Create a Markdown Doc
      2. Create a Github Student Account and upload a repo.
      3. Create a GeoJSON File
      4. Create a Screenshot
   5. Submitting Homework
       1. Submitting Images
       2. Submitting PDFs
          1. Common PDF Problems
       3. Submitting Links

## Week 02 - Fundamental Models and Conventions

### Data and Cartographic Models, & Cartography

### Vector / Raster / Tabular / Code

1. Tomlin’s Cartographic Model
2. Points, Lines, Polygons
3. Image Pixels & Bands
4. Layouts
5. Labeling
6. Map Elements
7. Multiple data frames
8. Map Scale

### Geodesy & Coordinate Systesm

9. Data vs Project CRS
10. Changing Projections
11. Ellipsoid vs Geoid
12. Vertical Datums
13. Horizontal Measurements
14. Customizing Projections
15. How not to break you CRS
16. Troubleshooting Projections  

#### Labs

Basic Map Layers & Layout Elemenst

Great circles; US county areas shift parallels and remeasure then diff; $area vs area; MAUP; Cartography; Cartogram, Measuring  

## Week 03 - Capturing Spatial Data

### Satellite Remote Sensing

1. Pixels, Bands, Composites, etc…
2. Visualizations
3. Band Math
4. Reducers
5. Classification
6. Exporting  

### GPS & Field Data Collection

1. Quick Data capture
2. GPS Survey planning
3. GPS Measurement and averaging
1. Creating form-based survey apps
2. Preparing basemaps for fieldwork
3. Occupying a location and calculating spatial mean

#### Labs:

GEE Intermediate/Classification; GPR; QGIS Classification with planet plugin; Planet to GEE  
Photo geocoding; Collector App; make a pdf for Avenza; occupation; ODK with Sheets

## Week 04 - Collecting & Creating Spatial Data

### Spatial Data Sources & Formats

1. Earthworks.stanford.edu
2. OpenStreetMap.org
3. Earth Engine Data Catalog
4. SimplyAnalytics.com
5. Planet.com
6. ArcGIS Online
7. Stanford Data Farm
8. Global Resources
9. Regional Resources
10. Local Resources

### Editing & Metadata

1. Georeference a map & Transformations
2. Create Points, Line & Polygons
3. Advanced editing
4. Streaming
5. Snapping
6. Splitting
7. Creating Grids, tessellations & Random Points
8. Finding & Making ISO/GBL metadata

#### Labs

georeference Sanborn to XYZ to Github layer to EDITING APP or TMS to AFS? Github?  

## Week 05 - Tables, Selections & Basic Spatial Analysis

### Tables, selections and calculations

1. Table formatting and cleaning
2. Column Types & Conversion
3. Filters
4. Basic SQL
5. Field Calculator
6. Joins
7. Relates
8. Summary Statistics

### Basic spatial analysis  

1. Buffer & Proximity
2. Voronoi
3. Spatial Joins & Aggregates
4. Overlay
5. Union
6. Intersect
7. Erase
8. Clip

#### Labs

Gerrymandering using selections and perimeter /area calculations; TRI relations in CARTO; relational database design

occupation revisited, snow map revisited Sampling & Interpolation

## Week 06 - Intermediate Analysis Methods

### Network Analysis

1. Network Measures
2. Routing
3. Geocoding
4. Service Area Isohyets

### Basic Spatial Statistics

1. Spatial Central Tendency
2. Shape
3. Spatial Autocorrelation
4. Moran’s I
5. Geographically Weighted Regression

#### Labs

Snow map revisited; Logistic regression on archaeology;

Geocoding, Shortest Path

## Week 07 - Raster Analysis & Spatial Analysis Models

### Raster & Terrain,Sampling & Interpolation  

1. Mosaicking
2. Resampling
3. Raster<>Vector Conversion
4. Hydrological modeling
5. Visibility
6. Movement

### Spatial modeling, Networks & statistics  

1. Map Algebra
2. Distance
3. Conditionals
4. Zonal Stats

#### Labs

CVA, Solar insulation, watershed modeling, Toblers hiker function with

Tomlin or defensive viewshed; AHP; Ilisu Dam Inundation & Villages

## Week 08 - Web Mapping, APIs & Services

### Web maps, APIs

1. Stanford AFS setup
2. GitHub Pages
3. Create HTML / text files
4. Use Web services
5. WFS
6. WMS
7. WMTS
8. TMS
9. COG

### APIs & Cloud Platforms

1. Reading API & other docs
2. Geocoding
3. Planet Orders
4. Routing & Distance Matrix
5. Elevation

#### Labs

Collect & Connect to WFS, WMS, etc... Geocoding. Tiles? Mapbox?

## Week 09 - More Programming, ML, Odds & Ends…

### Automation, Machine Learning techniques and Drone

Photogrammetry
Training Data
ML Classification
Segmentation
Chat GPT

#### Labs

photogrammetry: Facebook RapID; ODM Farm imagery; RoboSat Pink

## Final Project Ideas

### Create tutorials

Classification in GEE
Field data collection
Hydrological modeling

### Where to live

Hazards:
Flooding
Earthquakes
Volcanoes
Landslides
Tornados
Wildfires
Weather
Annual Rainfall
Max and Min temp
Avg Temp
Snowfall
Days below freezing
Days over 100
Opportunity
University Density
Greenspace
Per Capita Income
Commute times
Housing
Median Home Price
10 yr difference in home prices
Avg Property size
Home Size
Home Age
Community
Diversity Index
Walkability Scores
Crime Rates
Foundational platforms:
Desktop - QGIS
Cloud - Google Earth Engine
Cloud - ArcGIS Online
Code - Colab: Python/GDAL/Shapely/GeoPANDAS/jq
