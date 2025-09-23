# QGIS Tutorial: Creating Points, Lines, and Polygon Shapefiles

## Introduction

In this tutorial, you will learn how to create and edit shapefiles in QGIS, focusing on digitizing points, lines, and polygons. This exercise will help you develop skills in geospatial data creation, including working with Cloud Optimized GeoTIFFs (COGs), using snapping for topological accuracy, and comparing imagery sources for better feature identification.

We will use a COG orthophoto available at [https://stacks.stanford.edu/file/vq494qx9344/odm_orthophoto_COG_d.tif](https://stacks.stanford.edu/file/vq494qx9344/odm_orthophoto_COG_d.tif) as the base layer. You will also toggle between this COG and Google Hybrid imagery (added via the Quick Map Services plugin) for comparison.

---

## Step 1: Adding the COG to QGIS

1. Open QGIS and go to **Layer > Add Layer > Add Raster Layer**.
2. In the dialog, click **Source Type** and select **Protocol**.
3. Paste the URL of the COG:  
   `https://stacks.stanford.edu/file/vq494qx9344/odm_orthophoto_COG_d.tif`.
4. Click **Add** to load the COG into your project.

### Notes on COG Performance
- Initially, the COG may load slowly as QGIS fetches data from the server.
- As you pan and zoom around the image, QGIS will cache the views, improving performance over time.
- To cache views, pan around the area of interest (the Farm property) before starting digitization.

---

## Step 2: Adding Google Hybrid Imagery

1. Install the **Quick Map Services** plugin if not already installed:
   - Go to **Plugins > Manage and Install Plugins**.
   - Search for "Quick Map Services" and click **Install**.
2. Add Google Hybrid imagery:
   - Go to **Web > Quick Map Services > Settings** and enable the "Google" provider.
   - Then, go to **Web > Quick Map Services > Google > Google Hybrid**.

---

## Step 3: Creating New Empty Layers

The first step in creating a new spatial dataset using “heads up digitizing” is to create a new empty layer for your features to go into. In this case, we will create three empty shapefiles: one for points, one for lines, and one for polygons.

1. Go to **Layer > Create Layer > New Shapefile Layer**.
2. A window will open with entries for a file name, geometry type (e.g., point, line, polygon), coordinate system, and field characteristics for a table.

### Create Three Layers:

#### First Layer: Trees (Points)
1. Browse to your Lab Data folder and name the file: **trees**.
2. Set the **Geometry Type** to "Point".
3. Set the coordinate system to **EPSG:26915 - NAD83 / UTM zone 15N** (use the drop-down list to select the Project CRS).
4. Add an attribute field named `Tree_ID` (type: Integer).
5. Leave the remainder of the options blank and click **OK**.

#### Second Layer: Paths and Sidewalks (Lines)
1. Browse to your Lab Data folder and name the file: **paths**.
2. Set the **Geometry Type** to "LineString".
3. Set the coordinate system to **EPSG:26915 - NAD83 / UTM zone 15N**.
4. Add an attribute field named `Path_Type` (type: Text).
5. Leave the remainder of the options blank and click **OK**.

#### Third Layer: Structures (Polygons)
1. Browse to your Lab Data folder and name the file: **structures**.
2. Set the **Geometry Type** to "Polygon".
3. Set the coordinate system to **EPSG:26915 - NAD83 / UTM zone 15N**.
4. Add an attribute field named `Structure_Name` (type: Text).
5. Leave the remainder of the options blank and click **OK**.

---

## Step 4: Digitizing Features

### Points: Digitizing Trees
1. Load the **trees** shapefile into the project and toggle editing mode.
2. Use the **Add Point Feature** tool to place a point on each tree within the Farm property:
   - Toggle between the COG and Google Hybrid imagery for better identification.
   - Assign a unique `Tree_ID` to each tree.

### Lines: Digitizing Paths and Sidewalks
1. Load the **paths** shapefile into the project and toggle editing mode.
2. Enable snapping for topological accuracy:
   - Go to **Project > Snapping Options**.
   - Enable snapping for the line layer and set the tolerance to 10 pixels.
   - Check **Avoid Overlaps** and **Enable Topological Editing**.
3. Use the **Add Line Feature** tool to trace paths and sidewalks:
   - Place vertices at intersections to ensure proper snapping for network integration.

#### Sidenote: What is Snapping?
Snapping ensures that vertices and edges of features align precisely, preventing gaps or overlaps. This is crucial for creating topologically correct data, especially for networks like paths and sidewalks.

### Polygons: Digitizing Structures
1. Load the **structures** shapefile into the project and toggle editing mode.
2. Enable snapping for polygons:
   - Use the same snapping settings as for lines.
3. Use the **Add Polygon Feature** tool to trace the outlines of buildings and other structures.

---

## Step 5: Saving and Exporting Data

1. Save your edits for each shapefile by toggling off editing mode.
2. Export the shapefiles if needed:
   - Right-click the layer in the **Layers Panel** and select **Export > Save Features As**.

---

## Conclusion

By completing this tutorial, you have learned how to:
- Add and work with a COG in QGIS.
- Digitize points, lines, and polygons with topological accuracy.
- Use snapping and caching to improve performance and data quality.

These skills are foundational for creating high-quality geospatial datasets and will be valuable in various GIS applications.
