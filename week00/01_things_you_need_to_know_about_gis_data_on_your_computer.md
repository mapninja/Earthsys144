# Things You Need to Know About GIS Data on Your Computer

## Introduction

Understanding how to work with spatial data formats and naming conventions is crucial for successful GIS work. This lab will teach you about different data formats, proper naming strategies, and how to recognize spatial data in unexpected places.

## Learning Objectives

By the end of this lab, you will be able to:

- Apply GIS-compatible file naming conventions
- Understand different spatial data formats and their trade-offs
- Recognize spatial data in non-spatial formats
- Choose appropriate formats for different GIS tasks

## File Naming Conventions

**Use Esri Raster naming rules as your universal standard** - they represent the most restrictive (and finicky) naming requirements in GIS, so following them ensures compatibility across all software.

### The Esri Standard (Least Common Denominator)

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

   - Full file paths should stay well under 256 characters
   - "Flatten" deep folder structures to avoid issues

**Good Esri-compatible names:**

- `Pop_Dens2020.tif` (uses underscore to replace space)
- `Elev_12m.tif` (underscore separates words)
- `Land_Cover.shp` (underscores allowed and encouraged)
- `Roads_2024.gpkg` (follows all rules with underscores)

**Names that break Esri compatibility:**

- `elevation-12m.tif` (hyphen causes raster export failures)
- `2020_population.tif` (starts with number - will fail)
- `land cover data.shp` (spaces cause cryptic errors)
- `COUNT.shp` (SQL reserved word causes confusion)
- `VeryLongRasterDatasetName.tif` (over 14 characters)
- `pop&density.tif` (ampersand causes failures)

### Practical Implementation

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

## Basic File Organization for GIS

Understanding how to organize and recognize spatial data files is fundamental for efficient GIS work. While detailed format specifications are covered in Week 01, here are the basics you need to know for file management.

### Recognizing Spatial Data Files

**Multi-file formats** (keep together):

- **Shapefiles**: Look for `.shp`, `.shx`, `.dbf` files with the same name
- **For Example**:

  `roads.shp`,
  `roads.shx`,
  `roads.dbf`

  all belong together

**Single-file formats**:

- **GeoJSON**: `.geojson` files
- **GeoTIFF**: `.tif` or `.tiff` files with spatial information
- **GeoPackage**: `.gpkg` files

**Folders that are actually datasets**:

- **File Geodatabase**: `.gdb` folders (treat as single units)

### File Organization Best Practices

**Create a logical folder structure:****

```
Project_Name/
├── data/
│   ├── raw/          (original downloads)
│   ├── processed/    (cleaned/modified data)
│   └── outputs/      (analysis results)
├── maps/
├── scripts/
└── documentation/
```

**Keep related files together:**

- All shapefile components in the same folder
- Metadata files with their datasets
- Projection files (`.prj`) with their data

**Document your data sources:**

- Keep a simple text file listing where data came from
- Note download dates and any modifications made
