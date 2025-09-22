# Introducing QGIS with Basic Cartographic Design

## Introduction

Now that you have QGIS installed and configured, it's time to put it to work! This lab introduces you to the QGIS interface and basic cartographic principles while teaching essential skills for document creation, file management, and homework submission that you'll use throughout the course.

## Learning Objectives

By the end of this lab, you will be able to:

- Navigate the QGIS interface confidently
- Understand fundamental spatial data types (points, lines, polygons, pixels)
- Create and save various document types (Markdown, GeoJSON, screenshots)
- Apply basic cartographic design principles
- Create your first professional map layout in QGIS

## 1. Point, Lines, Polygons & Pixels 101

### 1.1 Understanding Spatial Data Types

Before creating maps, understand the fundamental spatial data types:

**Vector Data:**

- **Points**: Discrete locations (cities, sample sites, GPS coordinates)
- **Lines**: Linear features (roads, rivers, boundaries)
- **Polygons**: Areas with defined boundaries (countries, lakes, parcels)

**Raster Data:**

- **Pixels**: Grid cells containing values (satellite imagery, elevation models, climate data)
- Each pixel represents a specific area on Earth's surface
- Resolution determines the size of each pixel

### 1.2 Coordinate Reference Systems

All spatial data exists within a coordinate reference system (CRS):

- **Geographic CRS**: Uses latitude/longitude (e.g., WGS84)
- **Projected CRS**: Uses x/y coordinates in meters/feet (e.g., UTM)
- QGIS can reproject data on-the-fly for visualization

## 2. Creating & Naming Documents

### 2.1 Create a Markdown Document

Markdown is essential for documentation and note-taking:

**What is Markdown?**

- Lightweight markup language for formatting text
- Uses simple syntax for headers, lists, links, and emphasis
- Widely used in GitHub, web publishing, and technical documentation

**Creating Your First Markdown File:**

1. Open your text editor
2. Create a new file named `week00_notes.md`
3. Add basic content with headers, lists, and links
4. Save and preview the formatting

**Basic Markdown Syntax:**

```markdown
# Main Header

## Sub Header

- Bullet point
- Another point
  **Bold text**
  _Italic text_
  [Link text](http://example.com)
```

### 2.2 Create a GitHub Student Account and Repository

GitHub will host your course portfolio:

**Account Setup:**

1. Visit [github.com](https://github.com) and create account
2. Apply for GitHub Student Developer Pack
3. Verify your Stanford email address

**Creating Your First Repository:**

1. Click "New repository" on GitHub
2. Name it `earthsys144-portfolio`
3. Initialize with README.md
4. Clone to your local computer
5. Add your first markdown file and push changes

### 2.3 Create a GeoJSON File

GeoJSON is a standard format for web-based spatial data:

**Using an Online Editor:**

1. Visit [geojson.io](http://geojson.io)
2. Draw some points, lines, and polygons
3. Add properties to each feature
4. Export as GeoJSON file
5. Open in QGIS to verify

**Understanding GeoJSON Structure:**

- Human-readable text format
- Based on JavaScript Object Notation (JSON)
- Contains geometry and properties for each feature
- Widely supported by web mapping libraries

### 2.4 Create a Screenshot

Screenshots are essential for documentation and homework:

**Best Practices:**

- Use built-in tools (macOS: Cmd+Shift+4, Windows: Snipping Tool)
- Crop to show relevant content only
- Save in PNG format for crisp graphics
- Include sufficient context for understanding
- Name files descriptively

**QGIS Screenshot Tips:**

- Clean up the interface before capturing
- Ensure legends and scale bars are visible
- Check that colors display correctly
- Consider the target audience and purpose

## 3. Your First QGIS Map

### 3.1 Loading Data

Practice with sample data:

1. Download sample datasets (Natural Earth, OpenSteetMap extracts)
2. Load vector layers using "Add Vector Layer"
3. Load raster layers using "Add Raster Layer"
4. Explore the attribute tables

### 3.2 Basic Styling

Apply basic cartographic principles:

- Choose appropriate symbols for data type
- Use consistent color schemes
- Ensure sufficient contrast
- Consider colorblind accessibility
- Apply transparency judiciously

### 3.3 Creating a Layout

Design your first map layout:

1. Use Print Layout manager
2. Add map canvas, legend, scale bar, and north arrow
3. Include title and data sources
4. Apply grid and guides for alignment
5. Export as both PNG and PDF

## Conclusion

Congratulations! You've now mastered the fundamentals of QGIS and created your first professional map. You understand the basic spatial data types, can create various document formats, and have applied essential cartographic design principles.

These QGIS skills will be the foundation for all the spatial analysis work we'll do in the coming weeks. The interface navigation, data loading, styling, and layout creation skills you've learned here will be used in every subsequent lab. Keep practicing these fundamentals, and soon they'll become second nature.
