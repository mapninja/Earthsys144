## **Proposed Lab Structure for EarthSys144**

### **Lab 1: Intro to GIS & Spatial Data Models**

- **QGIS:** Navigate GUI, add vector/raster layers, inspect attribute tables, change symbology.
- **ArcGIS Online:** Load hosted feature layers, explore basemaps, create and share web maps.
- **GEE:** Intro to Code Editor, load `US Counties`, explore layer properties. Load Hansen Forestry Data, properties & Select Pixels
- **Python:** Use `geopandas` to load shapefiles, inspect geometry, and plot.
- **RStudio:** Use `sf` package to read vector data, explore geometry types, plot with `ggplot2`.

---

### **Lab 2: Coordinate Systems, Projections & Measurement**

- **QGIS:** Reproject layers, measure distance/area in different CRS, compare results.
- **ArcGIS Online:** Use built-in measurement tools; explore limitations of projections in web maps.
- **GEE:** Load two geometries, calculate area and distance using `.area()` and `.distance()`.
- **Python:** Reproject and measure features with `pyproj` and `shapely`.
- **RStudio:** Compare projected vs. geographic measurements using `sf::st_area()` and `st_distance()`.

---

### **Lab 3: Digitizing & Field Data Collection**

- **QGIS:** Georeference a maps and Digitize features (point/line/polygon), edit attributes, save as geojson.
- **ArcGIS Online:** Use ArcGIS Field Maps or Survey123 to collect and sync field data.
- **GEE:** Manually define geometries in the Code Editor; convert drawn features to FeatureCollection. Collect Landuse values for the locations and write to csv.
- **Python:** Create geometries from GPX using `geopandas`. Perform basic spatial stats (centroid, spatial distance, ellipsoid,...)
- **RStudio:** Import GPX with lat/lon, convert to spatial object with `sf`.Perform basic spatial stats (centroid, spatial distance, ellipsoid,...)

---

### **Lab 4: Attribute Joins, Queries & Tables**

- **QGIS:** Perform attribute joins; use field calculator; filter with expressions. Use SQL in DBManager.
- **Redivis:** Use SQL expressions to subset CoreLogic data.
- **GEE:** Perform `.filter()` and `.join()` operations; create filtered maps by attribute.
- **Python:** Join tabular data with `pandas.merge()` and map with `geopandas`.
- **RStudio:** Perform attribute joins using `dplyr::left_join()` and visualize with `tmap`.

---

### **Lab 5: Raster Analysis & Terrain Modeling**

- **QGIS:** Use GDAL and Raster tools to generate slope/aspect from DEM; extract values.
- **ArcGIS Online:** Visualize terrain layers; extract elevation using popups and Smart Mapping.
- **GEE:** Load SRTM data, calculate slope using `ee.Terrain.products()`.
- **Python:** Use `rasterio` and `numpy` to calculate slope from DEM array.
- **RStudio:** Use `terra` to load raster, calculate slope, and plot with `rasterVis`.

---

### **Lab 6: Remote Sensing & Multiband Imagery**

- **QGIS:** Load multiband raster; use Raster Calculator to create NDVI.
- **ArcGIS Online:** Use Sentinel/Landsat imagery from Living Atlas; visualize band combinations.
- **GEE:** Calculate NDVI using Sentinel-2; mask clouds; visualize time series.
- **Python:** Use `rasterio` or `sentinelsat` to process satellite data; calculate vegetation indices.
- **RStudio:** Use `terra` to compute NDVI from multi-band data; visualize with `leaflet`.

---

### **Lab 7: Spatial Analysis & Modeling**

- **QGIS:** Buffer, intersect, dissolve, and spatial joins; model builder (optional).
- **ArcGIS Online:** Perform analysis with hosted feature layers: buffers, drive-time areas.
- **GEE:** Model flood extent with elevation and land cover; visualize risk zones.
- **Python:** Spatial overlay and buffering with `geopandas`; automate workflows with `snakemake` or `pyogrio`.
- **RStudio:** Use `sf` and `rmapshaper` to build spatial workflows for access analysis.

---

### **Lab 8: Cartographic Design & Publishing**

- **QGIS:** Create a print layout with legend, scale bar, north arrow, and export.
- **ArcGIS Online:** Design and publish interactive web maps or StoryMaps.
- **GEE:** Create interactive map with `Map.addLayer` and export to asset or drive.
- **Python:** Build static maps with `matplotlib`, or interactive maps with `folium` or `plotly`.
- **RStudio:** Use `tmap` for cartographic design; export to PDF or HTML.
