# Basic Raster Analysis with Google Earth Engine

> **Turn-in for grading:** This lab includes material that must be turned in for grading. Complete the required deliverables and submit them as instructed by the course.

## Overview

This lab introduces basic raster analysis in Google Earth Engine using several common kinds of spatial data:

- a forest-change raster, where pixel values describe when forest loss occurred
- a digital elevation model, or DEM, where pixel values describe elevation
- state boundary polygons, which can be used to summarize raster values by place
- power plant point features, which can be converted into a distance raster

You will use code to create new raster layers from existing raster datasets. You will also use the Google Earth Engine Code Editor interface to inspect layers, turn map layers on and off, read pixel values, and view summary results in the Console.

The main idea is that raster analysis is based on pixel values. The map display helps you see patterns, but the analysis itself comes from selecting bands, applying thresholds, masking pixels, calculating terrain derivatives, and summarizing pixel values within a geometry.

> **Concept note:** A raster is a grid of pixels. Each pixel stores a value. In a DEM, that value might be elevation. In a forest-loss dataset, that value might represent the year when forest loss occurred. Raster analysis often means creating a new raster by asking a question about those pixel values.

## What You Should Understand After This Lab

By the end of this exercise, you should be able to explain:

- how raster pixels store numeric information
- how a band is selected from a multi-band raster image
- how thresholding creates a true/false raster from pixel values
- why `updateMask()` is useful for hiding pixels that do not meet a condition
- how slope can be calculated from a DEM
- how `reduceRegion()` summarizes raster values inside a vector geometry
- how `reduceRegions()` summarizes raster values across many vector features
- how vector features can be converted into distance rasters
- how maximum raster values can be used to find the places farthest from a feature
- how edge effects can change distance analysis results near a study-area boundary
- how Earth Engine exports a table through the **Tasks** tab

## Getting Ready

You will need:

- access to the [Google Earth Engine Code Editor](https://code.earthengine.google.com/)
- a Google Earth Engine account
- the ability to create, paste, run, and save scripts in the Code Editor

If needed, review the Week 00 [Logging in to Google Earth Engine](../week00/10_TURN_IN_logging_in_to_google_earth_engine.md) setup guide before continuing.

## Code Editor Tools You Will Use

As you work through the scripts, pay attention to these parts of the Earth Engine interface:

- **Run:** executes the current script.
- **Save:** saves the script to your Earth Engine account.
- **Get Link:** creates a shareable URL for the script.
- **Console:** shows printed objects, dictionaries, lists, and messages from `print()`.
- **Inspector:** lets you click the map and read pixel values or feature properties.
- **Layers:** lets you turn map layers on and off, change opacity, and compare outputs.
- **Geometry tools:** let you draw points, lines, and polygons on the map.
- **Tasks:** manages exports to Google Drive or other destinations.

> **Concept note:** The Code Editor is both a programming environment and a map interface. The script defines the analysis, while the map, Console, Inspector, and Layers tools help you check what the script produced.

![Placeholder image: Screenshot of the Google Earth Engine Code Editor with the script editor, Run button, Save button, Get Link button, Console tab, Inspector tab, Layers panel, and map area labeled for beginning students.](images/gee_code_editor_interface_placeholder.png)

## Part 1: Map Forest Loss After 2010

In this first script, you will load the Hansen Global Forest Change dataset and isolate pixels where forest loss occurred after 2010.

The key band is `lossyear`. This band does not store a calendar year directly. Instead, it stores a number where `1` means 2001, `2` means 2002, and so on. That means forest loss after 2010 can be found by selecting pixels where `lossyear` is greater than `10`.

Before running the script:

1. Open a new script in the Earth Engine Code Editor.
2. Paste the script below.
3. Click **Run**.
4. Look for the red forest-loss pixels on the map.
5. Open the **Layers** panel and toggle the forest-loss layer on and off.
6. Switch to the **Inspector** tab and click a red pixel, then click a nearby non-red area.

> **Concept note:** Thresholding turns continuous or categorical pixel values into a simpler true/false raster. Here, `lossYear.gt(10)` asks: "Is this pixel's loss year greater than 10?" Pixels that meet the condition become `1`; pixels that do not become `0`.

> **Interface note:** If the red pixels are hard to see, use the **Layers** panel to toggle the layer or adjust opacity. You can also zoom in and out to see how forest-loss patterns change with scale.

```javascript
// Stace Maples
// EarthSys 144
// Part 1: Map Forest Loss After 2010
//
// This script introduces a basic raster analysis pattern in Google Earth Engine.
// It uses the Hansen Global Forest Change dataset to map forest loss that
// happened after 2010.
//
// Raster datasets are made of grid cells, or pixels. Each pixel stores a value.
// In the Hansen dataset, the `lossyear` band stores the year when forest loss
// occurred at each pixel.

// ----------------------------------------------------------------------------
// Load the Hansen Global Forest Change dataset as an Earth Engine image.
// An `ee.Image` is a raster dataset that can contain one or more bands.
// ----------------------------------------------------------------------------
var forest = ee.Image('UMD/hansen/global_forest_change_2024_v1_12');

// ----------------------------------------------------------------------------
// Create a point geometry that Earth Engine can use for centering the map.
// Coordinates are written as longitude, latitude.
// ----------------------------------------------------------------------------
var geometry = ee.Geometry.Point([-122.1688463465495, 37.42828781711659]);

// ----------------------------------------------------------------------------
// Select only the `lossyear` band from the multi-band forest image.
// The value 1 means loss in 2001, 2 means loss in 2002, and so on.
// Because 2010 is represented by the value 10, values greater than 10
// represent forest loss from 2011 through 2024.
// ----------------------------------------------------------------------------
var lossYear = forest.select('lossyear');

// ----------------------------------------------------------------------------
// Create a binary raster showing where loss occurred after 2010.
// Pixels with values greater than 10 become 1, or true.
// Pixels with values 10 or lower become 0, or false.
// ----------------------------------------------------------------------------
var lossAfter2010 = lossYear.gt(10);

// ----------------------------------------------------------------------------
// Define how the loss raster should be drawn on the map.
// The palette tells Earth Engine to draw visible pixels in red.
// ----------------------------------------------------------------------------
var visParams = {palette: ['red']};

// ----------------------------------------------------------------------------
// Mask out pixels that do not represent loss after 2010.
// This hides the 0 values so the map only displays pixels with a value of 1.
// ----------------------------------------------------------------------------
var visibleLossAfter2010 = lossAfter2010.updateMask(lossAfter2010);

// ----------------------------------------------------------------------------
// Add the masked forest-loss raster to the map.
// The final text is the layer name that appears in the map layer list.
// ----------------------------------------------------------------------------
Map.addLayer(visibleLossAfter2010, visParams, 'Forest loss after 2010');

// ----------------------------------------------------------------------------
// Center the map on the point geometry.
// The number 9 is the zoom level; larger numbers zoom in closer.
// ----------------------------------------------------------------------------
Map.centerObject(geometry, 9);

// ----------------------------------------------------------------------------
// Use the hybrid basemap so students can see satellite imagery with labels.
// ----------------------------------------------------------------------------
Map.setOptions('HYBRID');

```

After running the script, you should see red pixels where forest loss occurred after 2010. The script uses `updateMask()` so that pixels with a value of `0` are hidden instead of drawn on the map.

Use the map interface to explore:

- Turn the layer on and off in **Layers**.
- Click red pixels with **Inspector** to examine the layer value.
- Pan around the map to see whether forest loss appears clustered or scattered.
- Change the threshold from `gt(10)` to `gt(15)` and run the script again.

> **Concept note:** `updateMask()` does not delete data from the original image. It controls which pixels are visible in the output layer. Masking is useful when you want the map to show only pixels that meet a condition.

## Part 2: Calculate and Display Slope from a DEM

This script uses the SRTM DEM to calculate slope. A DEM stores elevation values, but slope is a derived layer. Earth Engine calculates slope by comparing the elevation of each pixel with nearby pixels.

Before running the script:

1. Clear the previous script or open a new script.
2. Paste the script below.
3. Click **Run**.
4. Use the **Layers** panel to compare the `DEM` layer and the `Slope` layer.
5. Use the **Inspector** tab to click different parts of the terrain and compare values.

> **Concept note:** A terrain derivative is a raster calculated from another raster. Slope is derived from elevation. It is not measured directly in the original DEM; it is computed from the pattern of elevation change around each pixel.

> **Interface note:** The most recently added layer appears above earlier layers. In this script, `Slope` is added after `DEM`, so it appears on top. Use the **Layers** panel to turn `Slope` off if you want to inspect the DEM underneath.

```javascript
// Stace Maples
// EarthSys 144
// Part 2: Calculate and Display Slope from a DEM
//
// This script calculates slope from a digital elevation model, or DEM.
// A DEM is a raster in which each pixel stores an elevation value.
//
// Slope is derived from the elevation surface by comparing each pixel with
// nearby pixels. Steeper places have a larger change in elevation over distance.

// ----------------------------------------------------------------------------
// Load the SRTM elevation dataset as an Earth Engine image.
// SRTM stands for Shuttle Radar Topography Mission.
// ----------------------------------------------------------------------------
var srtm = ee.Image('USGS/SRTMGL1_003');

// ----------------------------------------------------------------------------
// Calculate slope from the elevation image.
// `ee.Terrain.slope()` returns a new raster where each pixel stores slope
// in degrees instead of elevation in meters.
// ----------------------------------------------------------------------------
var slope = ee.Terrain.slope(srtm);

// ----------------------------------------------------------------------------
// Define visualization parameters for the slope raster.
// Visualization parameters control how raster values are drawn on the map.
// They do not change the underlying data.
// ----------------------------------------------------------------------------
var slopeVis = {
  min: 0,
  max: 30,
  palette: ['green', 'yellow', 'red']
};

// ----------------------------------------------------------------------------
// Add the original elevation raster to the map.
// The display range shows low elevations near 0 meters and high elevations
// near 3000 meters.
// ----------------------------------------------------------------------------
Map.addLayer(srtm, {min: 0, max: 3000}, 'DEM');

// ----------------------------------------------------------------------------
// Add the slope raster to the map using the color ramp defined above.
// Earth Engine draws later layers on top of earlier layers, so the slope
// layer will appear above the DEM in the layer stack.
// ----------------------------------------------------------------------------
Map.addLayer(slope, slopeVis, 'Slope');

```

After running the script, the DEM should appear as a grayscale elevation layer and the slope raster should appear as a green-yellow-red layer.

Use the map interface to explore:

- Turn `DEM` and `Slope` on and off in **Layers**.
- Adjust layer opacity to compare elevation and slope.
- Use **Inspector** to click flat areas and steep areas.
- Change the `max` value in `slopeVis` from `30` to `60` and run the script again.

> **Concept note:** Visualization parameters change how a raster is displayed, not the raster values themselves. Changing `min`, `max`, or `palette` can make a pattern easier to see, but it does not recalculate the slope.

## Part 3: Calculate Mean Slope Within a Polygon

This script combines raster and vector analysis. The slope layer is a raster, and the polygon is a vector geometry. The `reduceRegion()` function summarizes the raster pixels that fall inside the polygon.

Before running the script:

1. Clear the previous script or open a new script.
2. Paste the script below.
3. Click **Run**.
4. Open the **Console** tab and look for the printed mean slope result.
5. Use the **Layers** panel to make sure the slope layer is visible.
6. Use the **Inspector** tab to click inside and outside the polygon area.

> **Concept note:** Zonal statistics summarize raster values inside a boundary. In this example, the polygon is the zone, the slope raster provides the values, and the mean reducer calculates the average slope inside that zone.

> **Interface note:** The result of `reduceRegion()` appears in the **Console**, not as a new map layer. The map shows where the analysis happened; the Console shows the numeric result.

![Placeholder image: Screenshot of the Earth Engine Code Editor after running a reduceRegion script, with the Console showing a printed mean slope dictionary, the Layers panel showing the Slope layer, and the Inspector tab visible.](images/gee_reduce_region_console_placeholder.png)

```javascript
// Stace Maples
// EarthSys 144
// Part 3: Calculate Mean Slope Within a Polygon
//
// This script calculates slope from a DEM and then summarizes the mean slope
// inside a polygon area of interest. This is a common raster analysis pattern:
// calculate a raster value first, then summarize those pixel values inside a
// vector boundary.

// ----------------------------------------------------------------------------
// Load the SRTM (Shuttle Radar Topography Mission) digital elevation model (DEM) dataset.
// Each pixel in this image stores elevation in meters.
// ----------------------------------------------------------------------------
var srtm = ee.Image('USGS/SRTMGL1_003');

// ----------------------------------------------------------------------------
// Create a polygon geometry to use as an area of interest.
// Coordinates are written as longitude, latitude pairs.
// ----------------------------------------------------------------------------
var geometry = ee.Geometry.Polygon(
  [[
    [-112.17864990234375, 36.12345548205636],
    [-112.2747802734375, 36.02466804934359],
    [-112.14019775390625, 36.00911716117325],
    [-111.99736151664732, 36.10624062602223]
  ]]
);

// ----------------------------------------------------------------------------
// Center the map on the polygon.
// The number 10 is the zoom level.
// ----------------------------------------------------------------------------
Map.centerObject(geometry, 10);

// ----------------------------------------------------------------------------
// Compute slope from the SRTM elevation data.
// The output slope raster stores slope in degrees.
// ----------------------------------------------------------------------------
var slope = ee.Terrain.slope(srtm);

// ----------------------------------------------------------------------------
// Add the slope layer to the map.
// The display range shows slopes from 0 to 60 degrees.
// ----------------------------------------------------------------------------
Map.addLayer(slope, {min: 0, max: 60}, 'Slope');

// ----------------------------------------------------------------------------
// Compute the mean slope inside the polygon.
// `reduceRegion()` summarizes raster pixel values within a geometry.
// `ee.Reducer.mean()` tells Earth Engine to calculate an average value.
// `scale` sets the pixel size, in meters, used for the calculation.
// ----------------------------------------------------------------------------
var slopeDict = slope.reduceRegion({
  reducer: ee.Reducer.mean(),
  geometry: geometry,
  scale: 30
});

// ----------------------------------------------------------------------------
// Print the result to the Console.
// The dictionary contains the mean slope value for the polygon.
// ----------------------------------------------------------------------------
print('Mean slope within polygon:', slopeDict);

```

After running the script, expand the printed dictionary in the **Console**. The value shown is the average slope, in degrees, for pixels inside the polygon.

Use the interface and code to explore:

- Change the polygon coordinates and run the script again.
- Use the **Geometry tools** to draw a new polygon, then compare it to the scripted geometry.
- Change `scale: 30` to `scale: 90` and observe whether the result changes.
- Add the polygon to the map with `Map.addLayer(geometry, {color: 'red'}, 'Polygon');` if you want to see the exact boundary.

> **Concept note:** The `scale` parameter controls the pixel size used for the calculation. A smaller scale uses finer detail but can take more computation. A larger scale generalizes the raster and may produce a different summary value.

## Part 4: Calculate Forest Loss by State and Export a Table

This script extends the zonal-statistics idea from one polygon to many polygons. Instead of calculating mean slope inside one hand-written polygon, it calculates total forest-loss area inside each state in the contiguous United States.

The script uses:

- `TIGER/2018/States` for state boundaries
- the Hansen Global Forest Change `loss` band for forest-loss pixels
- `ee.Image.pixelArea()` to convert pixels into area
- `reduceRegions()` to summarize the raster across many state polygons
- `Export.table.toDrive()` to send the result to Google Drive

Before running the script:

1. Clear the previous script or open a new script.
2. Paste the script below.
3. Click **Run**.
4. Watch the **Console** for the printed state results.
5. Open the **Tasks** tab after the script finishes creating the export task.
6. Click **Run** next to the export task if you want to send the result to Google Drive.

> **Concept note:** `reduceRegion()` summarizes raster values inside one geometry. `reduceRegions()` summarizes raster values across every feature in a FeatureCollection. Here, each state polygon becomes one row in the output table.

> **Interface note:** Earth Engine exports do not start automatically. `Export.table.toDrive()` creates an export task, but you still need to open the **Tasks** tab and click **Run**.

![Placeholder image: Screenshot of the Earth Engine Tasks tab showing a table export named forest_loss_by_state ready to run, with the Run button highlighted.](images/gee_tasks_export_placeholder.png)

```javascript
// Stace Maples
// EarthSys 144
// Part 4: Calculate Forest Loss by State and Export a Table
//
// This script calculates total forest loss, in acres, for each state in the
// contiguous United States. It combines a raster forest-loss layer with vector
// state boundaries, then exports the state-level result to Google Drive.

// ----------------------------------------------------------------------------
// Load U.S. state boundaries from the Census TIGER dataset.
// A FeatureCollection is a group of vector features.
// Each state feature has geometry and attribute fields.
// ----------------------------------------------------------------------------
var tigerStates = ee.FeatureCollection('TIGER/2018/States');

// ----------------------------------------------------------------------------
// Load the Hansen Global Forest Change dataset.
// This is a multi-band raster image with forest cover and forest-loss bands.
// ----------------------------------------------------------------------------
var forest = ee.Image('UMD/hansen/global_forest_change_2024_v1_12');

// ----------------------------------------------------------------------------
// Select the `loss` band.
// In this band, pixels with forest loss have a value of 1.
// Pixels without forest loss have a value of 0.
// ----------------------------------------------------------------------------
var loss = forest.select('loss');

// ----------------------------------------------------------------------------
// Filter states to the contiguous United States.
// STATEFP is the state FIPS code stored in the state attributes.
// The list below excludes Alaska, Hawaii, and U.S. territories.
// ----------------------------------------------------------------------------
var excludedStateFips = ['02', '15', '60', '66', '69', '72', '78'];

var states = tigerStates.filter(
  ee.Filter.inList('STATEFP', excludedStateFips).not()
);

// ----------------------------------------------------------------------------
// Center the map on the state dataset.
// A lower zoom level shows the full contiguous United States.
// ----------------------------------------------------------------------------
Map.centerObject(states, 4);

// ----------------------------------------------------------------------------
// Display the state boundaries.
// This layer helps you see the vector zones used for the raster summary.
// ----------------------------------------------------------------------------
Map.addLayer(states, {color: 'red'}, 'State boundaries');

// ----------------------------------------------------------------------------
// Display forest-loss pixels.
// `updateMask(loss)` hides pixels where the loss value is 0.
// ----------------------------------------------------------------------------
Map.addLayer(
  loss.updateMask(loss),
  {min: 0, max: 1, palette: ['red']},
  'Forest loss pixels'
);

// ----------------------------------------------------------------------------
// Convert forest-loss pixels to acres.
// `ee.Image.pixelArea()` creates a raster where each pixel stores its area in
// square meters. Multiplying by `loss` keeps area only where loss equals 1.
// Dividing by 4047 converts square meters to acres.
// ----------------------------------------------------------------------------
var lossAcres = loss
  .multiply(ee.Image.pixelArea())
  .divide(4047);

// ----------------------------------------------------------------------------
// Sum forest-loss acres inside each state.
// `reduceRegions()` runs the same reducer for every state feature.
// The result is a new FeatureCollection with a `forest_loss_acres` property.
// ----------------------------------------------------------------------------
var stateForestLoss = lossAcres.reduceRegions({
  collection: states,
  reducer: ee.Reducer.sum().setOutputs(['forest_loss_acres']),
  scale: 30
});

// ----------------------------------------------------------------------------
// Print a small preview to the Console.
// Limiting the preview keeps the Console easier to read.
// ----------------------------------------------------------------------------
print('State forest loss preview:', stateForestLoss.limit(10));

// ----------------------------------------------------------------------------
// Select the fields to keep in the exported table.
// Keeping the geometry means the GeoJSON can be opened as a map layer later.
// ----------------------------------------------------------------------------
var exportTable = stateForestLoss.select([
  'NAME',
  'STUSPS',
  'STATEFP',
  'forest_loss_acres'
]);

// ----------------------------------------------------------------------------
// Create an export task for Google Drive.
// After running the script, open the Tasks tab and click Run to start export.
// ----------------------------------------------------------------------------
Export.table.toDrive({
  collection: exportTable,
  description: 'forest_loss_by_state',
  folder: 'GEE_Examples',
  fileFormat: 'GeoJSON'
});
```

After running the script, the map should show state boundaries and forest-loss pixels. The **Console** should show a preview of the output FeatureCollection. The full export is managed in the **Tasks** tab.

Use the interface and code to explore:

- Expand one printed state feature in the **Console** and find `forest_loss_acres`.
- Use **Layers** to toggle state boundaries and forest-loss pixels.
- Open the **Tasks** tab and inspect the export task before running it.
- Change `fileFormat: 'GeoJSON'` to `fileFormat: 'CSV'` if you want a table without geometry.

> **Concept note:** Multiplying a binary raster by `ee.Image.pixelArea()` is a common way to calculate area. The binary raster says where the condition is true, and `pixelArea()` supplies the area of each true pixel.

> **Concept note:** Exporting is separate from displaying. A layer added with `Map.addLayer()` appears in the browser map. A table created with `Export.table.toDrive()` is written to your Google Drive only after you run the task.

## Part 5: Create a Distance-to-Power-Plant Raster and Find the Farthest Area

This script creates a raster where each pixel stores its distance to the nearest power plant. It starts with point features from `WRI/GPPD/power_plants`, filters them to California, and then creates a distance raster at a 1 kilometer analysis scale.

The result identifies the area of California that is farthest from a mapped power plant and prints that maximum distance to the Console.

Before running the script:

1. Clear the previous script or open a new script.
2. Paste the script below.
3. Click **Run**.
4. Look for the distance-to-power-plant raster on the map.
5. Open the **Console** and find the printed maximum distance.
6. Use the **Layers** panel to compare `Power plants`, `Distance to nearest power plant`, and `Farthest point from a power plant`.
7. Notice that the map centers and zooms to the farthest point after the result is created.

> **Concept note:** A distance raster stores proximity. Each pixel value is the distance from that pixel to the nearest target feature. In this script, the target features are power plants, so higher pixel values represent places farther from power plants.

> **Concept note:** The maximum value in a distance raster marks the pixel or pixels farthest from the target features. This script first identifies the farthest raster area, then converts that area into a point so it can be mapped as a simple location.

> **Interface note:** Use the **Inspector** tab to click the `Farthest point from a power plant` layer. Compare that location to the maximum distance printed in the **Console**.

```javascript
// Stace Maples
// EarthSys 144
// Part 5: Create a Distance-to-Power-Plant Raster and Find the Farthest Area
//
// This script uses power plant point features to create a distance raster.
// It then finds the area of California farthest from a mapped power plant and
// prints that distance to the Console.

// ----------------------------------------------------------------------------
// Load U.S. state boundaries.
// These polygons provide the state boundary used for this analysis.
// ----------------------------------------------------------------------------
var states = ee.FeatureCollection('TIGER/2018/States');

// ----------------------------------------------------------------------------
// Load the Global Power Plant Database.
// Power plants are vector point features, not raster pixels.
// ----------------------------------------------------------------------------
var powerPlantDataset = ee.FeatureCollection('WRI/GPPD/power_plants');

// ----------------------------------------------------------------------------
// Select California from the state boundary dataset.
// STUSPS is the state postal abbreviation field in the TIGER states data.
// ----------------------------------------------------------------------------
var california = states.filter(ee.Filter.eq('STUSPS', 'CA'));

// ----------------------------------------------------------------------------
// Convert the California feature into one simplified analysis geometry.
// This geometry is used to clip rasters and summarize values.
// Simplifying the boundary prevents "too many edges" errors while keeping
// enough detail for a 1 kilometer statewide raster analysis.
// ----------------------------------------------------------------------------
var californiaGeometry = ee.Feature(california.first())
  .geometry()
  .simplify(1000);

// ----------------------------------------------------------------------------
// Keep only power plants that intersect California.
// Filtering reduces the number of features used in the distance calculation.
// ----------------------------------------------------------------------------
var powerPlants = powerPlantDataset.filterBounds(californiaGeometry);

// ----------------------------------------------------------------------------
// Style the power plant features for display.
// The styled layer is only for visualization. The distance calculation still
// uses the original vector point features.
// ----------------------------------------------------------------------------
var powerPlantsDisplay = powerPlants.style({
  color: '#4285F4',
  pointSize: 3,
  width: 1
});

// ----------------------------------------------------------------------------
// Set the analysis scale and maximum search distance in meters.
// The distance raster is interpreted at a 1 kilometer scale.
// Pixels farther than the search distance are assigned the capped value.
// ----------------------------------------------------------------------------
var analysisScale = 1000;
var maxDistanceMeters = 1000000;

// ----------------------------------------------------------------------------
// Create a distance-to-power-plant raster.
// `FeatureCollection.distance()` measures distance from each pixel center to
// the nearest power plant within the search radius.
// `unmask(maxDistanceMeters)` gives far-away pixels the capped maximum value.
// `reproject()` sets the displayed/processed raster scale to 1 kilometer.
// ----------------------------------------------------------------------------
var distanceToPowerPlant = powerPlants
  .distance({
    searchRadius: maxDistanceMeters,
    maxError: 50
  })
  .unmask(maxDistanceMeters)
  .clip(californiaGeometry)
  .rename('distance_to_power_plant_meters')
  .reproject({
    crs: 'EPSG:5070',
    scale: analysisScale
  });

// ----------------------------------------------------------------------------
// Define visualization settings for the distance raster.
// Darker colors represent shorter distances. Brighter colors represent places
// farther from power plants.
// ----------------------------------------------------------------------------
var distanceVis = {
  min: 0,
  max: 300000,
  palette: ['1a9850', 'fee08b', 'd73027']
};

// ----------------------------------------------------------------------------
// Display California, power plants, and the distance raster.
// The power plant layer is turned off by default because there are many points.
// ----------------------------------------------------------------------------
Map.centerObject(californiaGeometry, 6);
Map.addLayer(californiaGeometry, {color: 'blue'}, 'California boundary', false);
Map.addLayer(powerPlantsDisplay, {}, 'Power plants', false);
Map.addLayer(
  distanceToPowerPlant,
  distanceVis,
  'Distance to nearest power plant'
);

// ----------------------------------------------------------------------------
// Find the maximum distance to a power plant.
// This identifies the farthest distance value inside California.
// ----------------------------------------------------------------------------
var maxDistanceStats = distanceToPowerPlant.reduceRegion({
  reducer: ee.Reducer.max(),
  geometry: californiaGeometry,
  scale: analysisScale,
  maxPixels: 1e13,
  tileScale: 4
});

// ----------------------------------------------------------------------------
// Get the maximum distance value from the output dictionary.
// The value is stored in meters, so we also convert it to kilometers.
// ----------------------------------------------------------------------------
var maxDistanceMetersObserved = ee.Number(
  maxDistanceStats.get('distance_to_power_plant_meters')
);

var maxDistanceKilometersObserved = maxDistanceMetersObserved.divide(1000);

// ----------------------------------------------------------------------------
// Create a raster showing the farthest area.
// Because the raster is analyzed at 1 kilometer scale, we show pixels within
// 1 kilometer of the maximum distance.
// ----------------------------------------------------------------------------
var farthestArea = distanceToPowerPlant
  .gte(maxDistanceMetersObserved.subtract(analysisScale))
  .selfMask();

// ----------------------------------------------------------------------------
// Convert the farthest raster area into a point feature.
// `reduceToVectors()` turns the farthest-area pixels into vector features.
// `centroid()` converts those vector features into a single representative
// point location.
// ----------------------------------------------------------------------------
var farthestAreaVectors = farthestArea.reduceToVectors({
  geometry: californiaGeometry,
  scale: analysisScale,
  geometryType: 'centroid',
  eightConnected: true,
  labelProperty: 'farthest_area',
  maxPixels: 1e13,
  tileScale: 4
});

var farthestPoint = ee.Feature(
  farthestAreaVectors.geometry().centroid(analysisScale)
);

// ----------------------------------------------------------------------------
// Display the farthest-area raster and the representative point.
// The raster layer is off by default so the point is easier to see.
// ----------------------------------------------------------------------------
Map.addLayer(farthestArea, {palette: ['purple']}, 'Farthest area raster', false);
Map.addLayer(farthestPoint, {color: 'purple'}, 'Farthest point from a power plant');

// ----------------------------------------------------------------------------
// Center and zoom the map to the farthest point.
// A zoom level of 9 gives enough context to see the surrounding region.
// ----------------------------------------------------------------------------
Map.centerObject(farthestPoint, 9);

// ----------------------------------------------------------------------------
// Calculate the approximate area of the farthest-area pixels in square km.
// This describes the mapped area within 1 km of the maximum distance.
// ----------------------------------------------------------------------------
var farthestAreaSquareKm = ee.Image.pixelArea()
  .updateMask(farthestArea)
  .divide(1000000)
  .reduceRegion({
    reducer: ee.Reducer.sum(),
    geometry: californiaGeometry,
    scale: analysisScale,
    maxPixels: 1e13,
    tileScale: 4
  });

// ----------------------------------------------------------------------------
// Print the maximum distance and farthest-area summary to the Console.
// ----------------------------------------------------------------------------
print('Maximum distance to nearest power plant, meters:', maxDistanceMetersObserved);
print('Maximum distance to nearest power plant, kilometers:', maxDistanceKilometersObserved);
print('Approximate farthest-area size, square km:', farthestAreaSquareKm);
print('Farthest point feature:', farthestPoint);
print('Maximum distance summary dictionary:', maxDistanceStats);
```

After running the script, the distance raster should show a statewide pattern of distance to mapped power plants across California. The map should automatically center and zoom to the `Farthest point from a power plant` layer, which shows a representative point for the area with the highest distance values at 1 kilometer scale.

Use the interface and code to explore:

- Turn `Power plants` on in the **Layers** panel and zoom in to compare plant locations with the distance raster.
- Use **Inspector** to click the purple point and inspect its feature information.
- Find the printed maximum distance in the **Console** and compare meters to kilometers.
- Turn on `Farthest area raster` to see the raster pixels used to create the point.
- Change `analysisScale` from `1000` to `5000` and observe how the farthest-area layer changes.
- Change `maxDistanceMeters` if the distance raster appears capped at the maximum search distance.
- Change the state abbreviation from `CA` to another state abbreviation and observe how the result changes.

> **Concept note:** The analysis scale controls the pixel size used for the distance raster and summary. A 1 kilometer scale means each output pixel represents an area roughly 1 kilometer across. This is appropriate for a statewide overview, but it is not precise enough for parcel-level interpretation.

> **Concept note:** The search radius caps the distance calculation. A larger search radius can represent farther distances, but it can also make the calculation heavier. A smaller search radius is faster, but it may flatten very remote places into the same maximum value.

> **Concept note:** This is an analytical definition of distance from power infrastructure, not a complete measure of energy access. It depends on the power plant dataset, the California analysis boundary, the search radius, and the 1 kilometer raster scale.

## Part 6: Reduce Edge Effects with a 100 Mile Buffer

The previous script only selected power plants inside California. That is a reasonable first analysis, but it creates a common spatial analysis problem called an **edge effect**. Edge effects happen when an analysis boundary cuts off nearby features outside the study area. A place near the California border might be close to a power plant in Nevada, Oregon, Arizona, or Mexico, but a California-only selection will ignore that nearby plant.

This version keeps the distance raster clipped to a focal state, using California as the starting example, but it selects power plants from a 100 mile buffer around that state. The result is often different near state borders because the distance calculation can now "see" nearby power plants just outside the state.

Before running the script:

1. Clear the previous script or open a new script.
2. Paste the script below.
3. Click **Run**.
4. Compare the new maximum distance to the maximum distance from Part 5.
5. Turn on the 100 mile buffer layer and `Buffered power plant selection` in the **Layers** panel.
6. Notice whether the farthest point or maximum distance changed.
7. Change the focal state abbreviation from `CA` to another state, such as `TX`, and run the script again.

> **Concept note:** A buffer expands a geometry by a specified distance. Here, the buffer does not change the area being summarized. The raster is still clipped to the focal state. The buffer only changes which power plants are allowed to influence the distance calculation.

> **Concept note:** Edge effects are differences in results caused by the boundary of the analysis area rather than by the real-world pattern being studied. Using a buffer is one common way to reduce edge effects because it allows nearby features outside the study area to be included in calculations.

```javascript
// Stace Maples
// EarthSys 144
// Part 6: Reduce Edge Effects with a 100 Mile Buffer
//
// This script repeats the state-level power plant distance analysis, but it
// selects power plants from a 100 mile buffer around the focal state. The
// distance raster is still clipped to the focal state.
//
// Comparing this result with Part 5 shows edge effects. Edge effects happen
// when a study boundary cuts off nearby features that should influence an
// analysis near the boundary.

// ----------------------------------------------------------------------------
// Load U.S. state boundaries.
// These polygons provide the state boundary used for this analysis.
// ----------------------------------------------------------------------------
var states = ee.FeatureCollection('TIGER/2018/States');

// ----------------------------------------------------------------------------
// Load the Global Power Plant Database.
// Power plants are vector point features, not raster pixels.
// ----------------------------------------------------------------------------
var powerPlantDataset = ee.FeatureCollection('WRI/GPPD/power_plants');

// ----------------------------------------------------------------------------
// Select the focal state from the state boundary dataset.
// STUSPS is the state postal abbreviation field in the TIGER states data.
// Change `focalStateAbbreviation` from 'CA' to another two-letter state code,
// such as 'TX', to run the same analysis for a different state.
// ----------------------------------------------------------------------------
var focalStateAbbreviation = 'CA';
var focalState = states.filter(ee.Filter.eq('STUSPS', focalStateAbbreviation));

// ----------------------------------------------------------------------------
// Convert the focal state feature into one simplified analysis geometry.
// Simplifying the boundary prevents "too many edges" errors while keeping
// enough detail for a 1 kilometer statewide raster analysis.
// ----------------------------------------------------------------------------
var focalStateGeometry = ee.Feature(focalState.first())
  .geometry()
  .simplify(1000);

// ----------------------------------------------------------------------------
// Create a 100 mile buffer around the focal state.
// Earth Engine distance values are in meters, so we convert miles to meters.
// This buffer is used only to select nearby power plants outside the state.
// ----------------------------------------------------------------------------
var metersPerMile = 1609.344;
var bufferDistanceMiles = 100;
var bufferDistanceMeters = bufferDistanceMiles * metersPerMile;
var focalStateBuffer = focalStateGeometry.buffer(bufferDistanceMeters);

// ----------------------------------------------------------------------------
// Select power plants that fall inside the 100 mile buffer.
// This reduces edge effects because power plants just outside the state can
// now influence distance values near the state boundary.
// ----------------------------------------------------------------------------
var bufferedPowerPlants = powerPlantDataset.filterBounds(focalStateBuffer);

// ----------------------------------------------------------------------------
// Style the buffered power plant features for display.
// The styled layer is only for visualization. The distance calculation still
// uses the original vector point features.
// ----------------------------------------------------------------------------
var bufferedPowerPlantsDisplay = bufferedPowerPlants.style({
  color: '#4285F4',
  pointSize: 3,
  width: 1
});

// ----------------------------------------------------------------------------
// Set the analysis scale and maximum search distance in meters.
// The distance raster is interpreted at a 1 kilometer scale.
// Pixels farther than the search distance are assigned the capped value.
// ----------------------------------------------------------------------------
var analysisScale = 1000;
var maxDistanceMeters = 1000000;

// ----------------------------------------------------------------------------
// Create a distance-to-power-plant raster.
// The input power plants come from the buffered area, but `clip()` keeps the
// final raster inside the focal state. This lets outside power plants influence
// border areas without expanding the mapped result beyond the state.
// ----------------------------------------------------------------------------
var distanceToBufferedPowerPlant = bufferedPowerPlants
  .distance({
    searchRadius: maxDistanceMeters,
    maxError: 50
  })
  .unmask(maxDistanceMeters)
  .clip(focalStateGeometry)
  .rename('distance_to_buffered_power_plant_meters')
  .reproject({
    crs: 'EPSG:5070',
    scale: analysisScale
  });

// ----------------------------------------------------------------------------
// Define visualization settings for the distance raster.
// Darker colors represent shorter distances. Brighter colors represent places
// farther from power plants.
// ----------------------------------------------------------------------------
var distanceVis = {
  min: 0,
  max: 300000,
  palette: ['1a9850', 'fee08b', 'd73027']
};

// ----------------------------------------------------------------------------
// Display the focal state, the 100 mile buffer, power plants, and the distance raster.
// The buffer and power plant layers are turned off by default so the raster is
// easier to read first.
// ----------------------------------------------------------------------------
Map.centerObject(focalStateGeometry, 6);
Map.addLayer(focalStateGeometry, {color: 'blue'}, focalStateAbbreviation + ' boundary', false);
Map.addLayer(focalStateBuffer, {color: 'orange'}, bufferDistanceMiles + ' mile ' + focalStateAbbreviation + ' buffer', false);
Map.addLayer(bufferedPowerPlantsDisplay, {}, 'Buffered power plant selection', false);
Map.addLayer(
  distanceToBufferedPowerPlant,
  distanceVis,
  'Distance to nearest buffered power plant'
);

// ----------------------------------------------------------------------------
// Find the maximum distance to a power plant inside the focal state.
// Because the power plant selection includes the buffer, this maximum may be
// lower or in a different location than an analysis that used only in-state
// power plants.
// ----------------------------------------------------------------------------
var maxDistanceStats = distanceToBufferedPowerPlant.reduceRegion({
  reducer: ee.Reducer.max(),
  geometry: focalStateGeometry,
  scale: analysisScale,
  maxPixels: 1e13,
  tileScale: 4
});

// ----------------------------------------------------------------------------
// Get the maximum distance value from the output dictionary.
// The value is stored in meters, so we also convert it to kilometers and miles.
// ----------------------------------------------------------------------------
var maxDistanceMetersObserved = ee.Number(
  maxDistanceStats.get('distance_to_buffered_power_plant_meters')
);

var maxDistanceKilometersObserved = maxDistanceMetersObserved.divide(1000);
var maxDistanceMilesObserved = maxDistanceMetersObserved.divide(metersPerMile);

// ----------------------------------------------------------------------------
// Create a raster showing the farthest area.
// Because the raster is analyzed at 1 kilometer scale, we show pixels within
// 1 kilometer of the maximum distance.
// ----------------------------------------------------------------------------
var farthestArea = distanceToBufferedPowerPlant
  .gte(maxDistanceMetersObserved.subtract(analysisScale))
  .selfMask();

// ----------------------------------------------------------------------------
// Convert the farthest raster area into a point feature.
// This gives us a simple mapped location to inspect and compare with Part 5.
// ----------------------------------------------------------------------------
var farthestAreaVectors = farthestArea.reduceToVectors({
  geometry: focalStateGeometry,
  scale: analysisScale,
  geometryType: 'centroid',
  eightConnected: true,
  labelProperty: 'farthest_area',
  maxPixels: 1e13,
  tileScale: 4
});

var farthestPoint = ee.Feature(
  farthestAreaVectors.geometry().centroid(analysisScale)
);

// ----------------------------------------------------------------------------
// Display the farthest-area raster and the representative point.
// The raster layer is off by default so the point is easier to see.
// ----------------------------------------------------------------------------
Map.addLayer(farthestArea, {palette: ['purple']}, 'Buffered farthest area raster', false);
Map.addLayer(farthestPoint, {color: 'purple'}, 'Buffered farthest point');

// ----------------------------------------------------------------------------
// Center and zoom the map to the farthest point.
// A zoom level of 9 gives enough context to see the surrounding region.
// ----------------------------------------------------------------------------
Map.centerObject(farthestPoint, 9);

// ----------------------------------------------------------------------------
// Calculate the approximate area of the farthest-area pixels in square km.
// This describes the mapped area within 1 km of the maximum distance.
// ----------------------------------------------------------------------------
var farthestAreaSquareKm = ee.Image.pixelArea()
  .updateMask(farthestArea)
  .divide(1000000)
  .reduceRegion({
    reducer: ee.Reducer.sum(),
    geometry: focalStateGeometry,
    scale: analysisScale,
    maxPixels: 1e13,
    tileScale: 4
  });

// ----------------------------------------------------------------------------
// Print the maximum distance and farthest-area summary to the Console.
// Compare these values with Part 5 to see how edge effects changed the result.
// ----------------------------------------------------------------------------
print('Buffered analysis maximum distance, meters:', maxDistanceMetersObserved);
print('Buffered analysis maximum distance, kilometers:', maxDistanceKilometersObserved);
print('Buffered analysis maximum distance, miles:', maxDistanceMilesObserved);
print('Approximate buffered farthest-area size, square km:', farthestAreaSquareKm);
print('Focal state abbreviation:', focalStateAbbreviation);
print('Buffered farthest point feature:', farthestPoint);
print('Buffered maximum distance summary dictionary:', maxDistanceStats);
```

After running the script, compare the printed values with the California-only result from Part 5. If the maximum distance gets smaller, or if the farthest point moves, that difference is evidence of edge effects. The California-only analysis ignored nearby power plants outside the state. The buffered analysis includes those nearby features while still measuring and mapping distance only inside the focal state.

Use the interface and code to explore:

- Turn on the 100 mile buffer layer to see the expanded selection area.
- Turn on `Buffered power plant selection` and look for power plants just outside the focal state.
- Use **Inspector** to click the `Buffered farthest point`.
- Compare the buffered maximum distance to the Part 5 maximum distance.
- Change `bufferDistanceMiles` from `100` to `25`, `50`, or `200` and observe how the result changes.
- Change `focalStateAbbreviation` from `CA` to another state abbreviation, such as `TX`, and run the script again.

> **Concept note:** Buffers do not remove all edge effects. They reduce them by giving the analysis more surrounding context. If important features exist beyond the buffer distance, they can still be excluded.

## Deliverable

For your final submission, use the Part 6 script. Change `focalStateAbbreviation` from `CA` to another U.S. state abbreviation, such as `TX`, then run the script again.

Create a short Google Doc and export it as a PDF. The PDF should include:

- your name
- the lab title
- the focal state abbreviation you chose
- a Google Earth Engine **Get Link** URL for your saved, modified Part 6 script
- a brief note describing how the result changed when you changed the focal state

Your changed script should include a comment near `focalStateAbbreviation` that identifies the state you changed. For example:

```javascript
// Final submission change: I changed the focal state from CA to TX.
var focalStateAbbreviation = 'TX';
```

> **Course turn-in rule:** All `TURN_IN` assignments in this course are submitted as PDF files. If the deliverable is a URL, put it in a Google Doc and export that document as a PDF for submission.
