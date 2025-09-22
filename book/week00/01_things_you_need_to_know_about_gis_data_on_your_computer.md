# Things You Need to Know About GIS Data on Your Computer

## Introduction

Understanding how to work with spatial data formats and naming conventions is crucial for successful GIS work. This lab will teach you about different data formats, proper naming strategies, and how to recognize spatial data in unexpected places.

## Learning Objectives

By the end of this lab, you will be able to:

- Apply GIS-compatible file naming conventions
- Understand different spatial data formats and their trade-offs
- Recognize spatial data in non-spatial formats
- Choose appropriate formats for different GIS tasks

## 1. File Naming Conventions

**Use Esri Raster naming rules as your universal standard** - they represent the most restrictive (and finicky) naming requirements in GIS, so following them ensures compatibility across all software.

### 1.1 The Esri Standard (Least Common Denominator)

Esri has the strictest naming requirements in GIS. Following their official rules ([Esri Community: How to Name Things in ArcGIS](https://community.esri.com/t5/data-management-blog/how-to-name-things-in-arcgis/ba-p/897194)) ensures universal compatibility:

**The Official Esri Rules:**

1. **Avoid spaces and most special characters** in pathnames and filenames

   - No spaces, &, -, or other special characters
   - **Underscores (\_) are allowed and encouraged** as space replacements
   - These restrictions prevent cryptic failures in processing

2. **Keep pathnames under 128 characters** total

   - Windows absolute pathname limit is 260 characters
   - Shorter paths prevent mysterious errors

3. **Start with a letter** always

   - Never begin with numbers or non-alphabetic characters
   - Applies to files, folders, fields, and all GIS objects

4. **Avoid SQL reserved words**

   - Skip: OBJECTID, VALUE, COUNT, NOT, OR, ON, IN, OVER, SELECT
   - Prevents confusion in database operations

5. **Keep field names ≤ 10 characters**

   - This is a dBase (.dbf) limit affecting shapefiles
   - Use aliases for longer descriptive names

6. **Raster names ≤ 14 characters**

   - Must start with letter (critical for raster datasets)
   - Special characters in paths cause export failures
   - Grid format compatibility requires this limit

7. **Path length matters**
   - Full file paths should stay well under 260 characters
   - "Flatten" deep folder structures to avoid issues

**✅ Good Esri-compatible names:**

- `Pop_Dens2020.tif` (uses underscore to replace space)
- `Elev_12m.tif` (underscore separates words)
- `Land_Cover.shp` (underscores allowed and encouraged)
- `Roads_2024.gpkg` (follows all rules with underscores)

**❌ Names that break Esri compatibility:**

- `elevation-12m.tif` (hyphen causes raster export failures)
- `2020_population.tif` (starts with number - will fail)
- `land cover data.shp` (spaces cause cryptic errors)
- `COUNT.shp` (SQL reserved word causes confusion)
- `VeryLongRasterDatasetName.tif` (over 14 characters)
- `pop&density.tif` (ampersand causes failures)

### 1.2 Practical Implementation

**When naming is out of your control:**

- Downloaded datasets often have non-compliant names
- **Rename immediately** upon extraction
- Document original names if needed for reference

**Recommended naming strategy:**

1. **Replace spaces with underscores**: `Land Cover` → `Land_Cover`
2. **Abbreviate intelligently**: `Temperature` → `Temp`, `Precipitation` → `Precip`
3. **Use underscores for readability**: `Pop_Dens_2024` instead of `PopDens2024`
4. **Embed key info with separators**: `Roads_2024`, `Elev_30m`
5. **Version with underscores**: `Model_v1`, `Test_2024`

**Why this matters (from Esri's official warning):**

- **Prevents cryptic error messages**: Raster tools fail with "999999" errors
- **Avoids export failures**: Special characters break raster processing
- **Enables reliable scripting**: ArcPy validates names automatically
- **Prevents "tempting fate"**: As Esri warns - violations "may work" but cause unpredictable failures
- **Universal compatibility**: These rules work across all GIS software

**Special considerations:**

- **Database fields**: Same rules apply to column names in attribute tables
- **Project files**: Apply to .qgz, .aprx, and other project file names
- **Folder names**: While less critical, consistency helps with scripting

## 2. File Types

Understanding spatial data formats is crucial for choosing the right tool for each task.

### 2.1 Vector Data Formats

**Shapefiles (.shp) - The Multi-File Format:**

- **Actually 3-15+ files** working together as one dataset
- **Required files**: `.shp` (geometry), `.shx` (index), `.dbf` (attributes)
- **Common optional files**: `.prj` (projection), `.cpg` (encoding), `.sbn/.sbx` (spatial index)
- **Limitations**:
  - 2GB file size limit per component
  - Field names ≤ 10 characters
  - 255 field limit
  - No mixed geometry types
- **Advantages**:
  - **Spatially indexed** for fast queries
  - **Supports topology** and advanced geometry operations
  - **Universal compatibility** across all GIS software
  - **Proven reliability** for complex spatial analysis

**GeoJSON (.geojson) - The Web Standard:**

- **Single file** containing geometry and attributes
- **Human-readable** text format (can edit in text editor)
- **Advantages**:
  - Web-friendly and lightweight
  - No file size component limits
  - Supports nested attributes and arrays
  - Direct JavaScript compatibility
- **Limitations**:
  - **No spatial indexing** - slow for large datasets
  - **Designed for web mapping** - not optimized for analysis
  - **Size constraints** - becomes unwieldy over ~50MB
  - **No projection file** - coordinate system embedded but harder to manage

**Other Specialized Vector Formats:**

**KML/KMZ (.kml/.kmz) - Google Earth's Native Format:**

- **Software-specific**: Designed primarily for Google Earth visualization
- **KML**: XML-based, human-readable text format
- **KMZ**: Compressed KML with embedded images/resources
- **Strengths**: Excellent for 3D visualization, placemarks, and tours
- **Limitations**: Limited analysis capabilities, Google Earth ecosystem dependency
- **Common uses**: Public data sharing, field site visualization, storytelling

**GPX (.gpx) - The GPS Exchange Standard:**

- **Activity tracking format**: Standard export from fitness and navigation apps
- **Common sources**: Strava, Garmin Connect, AllTrails, iPhone Health, Android Fit
- **Data types**: GPS tracks, waypoints, routes with timestamps
- **Typical content**: Running/cycling routes, hiking trails, geocaching points
- **Analysis potential**: Speed, elevation profiles, activity patterns
- **Conversion needed**: Usually imported to GIS for spatial analysis

**GeoPackage (.gpkg) - The Modern Multi-Purpose Format:**

- **SQLite-based**: Industry standard database with spatial extensions
- **Multi-layer container**: Single file can hold multiple vector and raster datasets
- **No shapefile limitations**: Unlimited field names, file sizes, geometry types
- **Advanced features**: Complex queries, relationships, spatial indexes
- **Growing adoption**: Becoming preferred format for complex projects
- **OGC standard**: Open Geospatial Consortium approved specification

### 2.2 Raster Data Formats

**GeoTIFF (.tif/.tiff) - The Traditional Standard:**

- **Single file** with embedded spatial reference
- **Lossless compression** options available
- **Universal GIS compatibility**
- **Supports multiple bands** (RGB, multispectral, etc.)

**Cloud Optimized GeoTIFF (COG) - The Modern Evolution:**

- **Built on GeoTIFF** but optimized for cloud/web access
- **Internal tiling** enables efficient partial reading
- **Multiple resolution overviews** for fast zooming
- **HTTP range request compatible** - stream data without full download
- **Becoming the new standard** for web-based raster analysis

**Other Raster Formats:**

- **.jpg/.png**: Web-friendly but lose spatial reference
- **.nc**: NetCDF for scientific/climate data
- **.hdf**: Hierarchical format for satellite data

### 2.3 Spatial Databases

**GeoPackage (.gpkg) - The Swiss Army Knife:**

- **SQLite-based** single file containing multiple layers
- **Combines vector and raster** data
- **No size limits** like shapefiles
- **Supports complex queries** and relationships

**Other Database Formats:**

- **.sqlite**: Spatial extension of SQLite
- **.mdb/.accdb**: Microsoft Access (legacy, avoid if possible)

### 2.4 Text Formats with Hidden Spatial Data

**The "Spatial Data That Doesn't Know It's Spatial Yet":**

Many datasets contain geographic information but aren't explicitly spatial formats:

**CSV/Excel (.csv, .xlsx) with Geographic Encoding:**

- **County names**: "Santa Clara County" (can be geocoded to boundaries)
- **Addresses**: "123 Main St, Palo Alto, CA" (can be geocoded to points)
- **Lat/Long columns**: Decimal degrees waiting to become geometry
- **ZIP codes**: Postal codes that can be mapped to areas
- **State abbreviations**: "CA" can become California polygon

**JSON/Text (.json, .txt) with Embedded Locations:**

- **Social media data**: Geotagged tweets with coordinates
- **Sensor data**: Weather stations with lat/long metadata
- **Survey responses**: Addresses or place names in text fields

**Common Geographic Identifiers to Watch For:**

- Administrative units (county, state, country names)
- Postal codes (ZIP, postal codes)
- Coordinate pairs (latitude/longitude, X/Y)
- Place names (cities, landmarks, addresses)
- Administrative codes (FIPS codes, ISO country codes)

**Making Text Data Spatial:**

- **Geocoding**: Convert addresses to coordinates
- **Joining**: Link administrative names to boundary polygons
- **Coordinate parsing**: Extract lat/long from text fields
- **Spatial reference**: Assign appropriate coordinate systems

## Next Steps

With a solid understanding of GIS data formats and naming conventions, you're ready to begin installing and using the software tools we'll work with throughout the course.
