# Introducing Collections, Images, Bands, and Pixels in Google Earth Engine (DRAFT)

> **Note:** To make sure you are viewing the most recent version of this lab guide, hold **Shift** and click the browser refresh button.

> **Turn-in for grading:** This lab includes material that must be turned in for grading. Complete the required deliverables and submit them as instructed by the course.

## Overview

This lab introduces some of the most important ideas in raster-based remote sensing and analysis in Google Earth Engine:

- **Image collections**
- **Images**
- **Bands**
- **Pixels**

These ideas matter because most Earth observation data is not a single picture. Instead, it is usually:

- one of many images collected over time
- made of multiple bands that measure different parts of the electromagnetic spectrum
- built from pixels, where each pixel stores a value

In this exercise, you will progressively narrow your analysis by:

1. starting with an image collection
2. filtering it by area of interest and date
3. selecting individual bands and pixel values
4. masking data with `updateMask()`
5. thresholding pixel values to isolate a condition of interest
6. visualizing imagery using natural color and false color band combinations

You will work with:

- **Dynamic World V1**, a near-real-time land cover dataset derived from Sentinel-2 imagery
- **Hansen Global Forest Change**, a widely used dataset for forest loss and gain analysis
- **Sentinel-2**, for natural color and color-infrared visualization

## Learning Objectives

By the end of this lab, you should be able to:

- Explain the difference between an `ImageCollection` and an `Image` in Earth Engine
- Explain what a band is and why multi-band imagery is useful
- Explain what a pixel value represents in a raster dataset
- Filter an image collection by area of interest and date
- Use `updateMask()` to hide pixels that do not meet a condition
- Select and inspect the values of a single land cover probability band in Dynamic World
- Threshold a raster to isolate deforestation during a chosen ten-year period
- Create both RGB and color-infrared image visualizations from Sentinel-2 bands
- Explain how Dynamic World images are linked to their source Sentinel-2 images through dataset naming

## Before You Start

This lab assumes that you can:

- log in to Google Earth Engine
- open the Code Editor
- create or paste a script
- run a script and view the map

If needed, review the Week 00 Earth Engine setup guide first.

## A Few Core Ideas Before the Code

### What is an image collection?

An **image collection** is a stack or library of images. Each image usually represents a different date, time, or scene.

For example, if a satellite passes over the same area many times, Earth Engine may store all of those scenes together as an `ImageCollection`.

### What is an image?

An **image** is one item from that collection. It may still contain many bands, but it represents a single scene or observation.

### What is a band?

A **band** is one layer inside an image. Different bands measure different parts of the electromagnetic spectrum, such as:

- blue light
- green light
- red light
- near infrared

Some datasets also include bands that are not raw reflectance, but instead represent classifications or modeled probabilities.

### What is a pixel?

A **pixel** is the smallest unit in a raster image. Each pixel stores a value.

That value might represent:

- reflectance in a spectral band
- a land cover class
- the probability of a class
- the year of forest loss

> **Concept note:** In raster GIS, analysis often means asking meaningful questions about pixel values. The map is visual, but the underlying data is numeric.

## Data Used in This Lab

### Dynamic World V1

Dynamic World is a global land cover dataset produced from Sentinel-2 imagery. Instead of only assigning a single class, it also provides per-class probability bands such as:

- `trees`
- `water`
- `built`
- `crops`

That makes it useful for talking about both classification and pixel-level confidence.

### Hansen Global Forest Change

The Hansen dataset includes forest change information derived from Landsat imagery. In this lab, you will use the `lossyear` band to identify pixels where forest loss occurred during a chosen ten-year period.

### Sentinel-2

Sentinel-2 provides the underlying multispectral imagery that supports both visual interpretation and products such as Dynamic World.

In the final section of this lab, you will visualize Sentinel-2 using:

- **RGB** for natural color
- **CIR / IRG** for near-infrared-enhanced visualization of vegetation

## Part 1: Define an Area of Interest

```javascript
// Stace Maples
// EarthSys 144
// Part 1: Define an Area of Interest (AOI)
//
// This script defines a simple AOI and displays it on the map.
// Many Earth Engine workflows begin by defining where you want to work.

// ----------------------------------------------------------------------------
// Define an Area of Interest (AOI).
// Coordinates are [west, south, east, north] in lon/lat.
// ----------------------------------------------------------------------------
var aoi = ee.Geometry.Rectangle([
  -122.55, 37.05,
  -121.95, 37.55
]);

// Center the map on the AOI.
Map.centerObject(aoi, 10);

// Display the AOI.
Map.addLayer(aoi, {color: 'red'}, 'AOI');

// Print the AOI to the Console for inspection.
print('AOI geometry:', aoi);
```

## Part 2: Start with a Collection, Then Filter It

```javascript
// Stace Maples
// EarthSys 144
// Part 2: Start with a Collection, Then Filter It
//
// This script loads the Dynamic World ImageCollection,
// then filters it by place and date.

// ----------------------------------------------------------------------------
// Define the AOI.
// ----------------------------------------------------------------------------
var aoi = ee.Geometry.Rectangle([
  -122.55, 37.05,
  -121.95, 37.55
]);

Map.centerObject(aoi, 10);
Map.addLayer(aoi, {color: 'red'}, 'AOI');

// ----------------------------------------------------------------------------
// Load Dynamic World Version 1.
// This is an ImageCollection, not a single image.
// ----------------------------------------------------------------------------
var dwCollection = ee.ImageCollection('GOOGLE/DYNAMICWORLD/V1');

// Filter by place.
var dwByPlace = dwCollection.filterBounds(aoi);

// Filter by date.
var dwByDate = dwByPlace.filterDate('2024-06-01', '2024-07-31');

// Print the filtered collection and image count.
print('Dynamic World collection filtered by AOI and date:', dwByDate);
print('Number of Dynamic World images:', dwByDate.size());
```

## Part 3: Move from a Collection to a Single Image

```javascript
// Stace Maples
// EarthSys 144
// Part 3: Move from a Collection to a Single Image
//
// This script filters Dynamic World, then converts one item from the
// collection into a single ee.Image for inspection and display.

// ----------------------------------------------------------------------------
// Define the AOI.
// ----------------------------------------------------------------------------
var aoi = ee.Geometry.Rectangle([
  -122.55, 37.05,
  -121.95, 37.55
]);

Map.centerObject(aoi, 10);
Map.addLayer(aoi, {color: 'red'}, 'AOI');

// ----------------------------------------------------------------------------
// Load and filter Dynamic World.
// ----------------------------------------------------------------------------
var dwCollection = ee.ImageCollection('GOOGLE/DYNAMICWORLD/V1')
  .filterBounds(aoi)
  .filterDate('2024-06-01', '2024-07-31');

// Sort so the newest image is first.
var dwSorted = dwCollection.sort('system:time_start', false);

// Convert the first image in the sorted collection into a single image.
var dwImage = ee.Image(dwSorted.first());

// Print the image and its band names.
print('One Dynamic World image:', dwImage);
print('Band names:', dwImage.bandNames());

// ----------------------------------------------------------------------------
// Display the Dynamic World label band.
// ----------------------------------------------------------------------------
var dwClassPalette = [
  '#419bdf', // water
  '#397d49', // trees
  '#88b053', // grass
  '#7a87c6', // flooded vegetation
  '#e49635', // crops
  '#dfc35a', // shrub and scrub
  '#c4281b', // built
  '#a59b8f', // bare
  '#b39fe1'  // snow and ice
];

Map.addLayer(
  dwImage.select('label'),
  {min: 0, max: 8, palette: dwClassPalette},
  'Dynamic World label'
);
```

## Part 4: Look at Bands and Pixel Values

```javascript
// Stace Maples
// EarthSys 144
// Part 4: Look at Bands and Pixel Values
//
// This script selects several Dynamic World probability bands and displays them.
// Use the Inspector to click the map and read pixel values.

// ----------------------------------------------------------------------------
// Define the AOI.
// ----------------------------------------------------------------------------
var aoi = ee.Geometry.Rectangle([
  -122.55, 37.05,
  -121.95, 37.55
]);

Map.centerObject(aoi, 10);
Map.addLayer(aoi, {color: 'red'}, 'AOI');

// ----------------------------------------------------------------------------
// Load one Dynamic World image.
// ----------------------------------------------------------------------------
var dwImage = ee.Image(
  ee.ImageCollection('GOOGLE/DYNAMICWORLD/V1')
    .filterBounds(aoi)
    .filterDate('2024-06-01', '2024-07-31')
    .sort('system:time_start', false)
    .first()
);

print('Dynamic World image:', dwImage);
print('Band names:', dwImage.bandNames());

// ----------------------------------------------------------------------------
// Select several probability bands.
// Pixel values in these bands range from 0 to 1.
// ----------------------------------------------------------------------------
var trees = dwImage.select('trees');
var water = dwImage.select('water');
var built = dwImage.select('built');
var crops = dwImage.select('crops');
var grass = dwImage.select('grass');

print('Trees probability band:', trees);
print('Water probability band:', water);
print('Built probability band:', built);
print('Crops probability band:', crops);
print('Grass probability band:', grass);

// ----------------------------------------------------------------------------
// Display the probability bands.
// Turn layers on and off to compare them.
// ----------------------------------------------------------------------------
Map.addLayer(
  trees,
  {min: 0, max: 1, palette: ['white', 'darkgreen']},
  'Trees probability',
  true
);

Map.addLayer(
  water,
  {min: 0, max: 1, palette: ['white', 'blue']},
  'Water probability',
  false
);

Map.addLayer(
  built,
  {min: 0, max: 1, palette: ['white', 'maroon']},
  'Built probability',
  false
);

Map.addLayer(
  crops,
  {min: 0, max: 1, palette: ['white', 'orange']},
  'Crops probability',
  false
);

Map.addLayer(
  grass,
  {min: 0, max: 1, palette: ['white', 'limegreen']},
  'Grass probability',
  false
);

// ----------------------------------------------------------------------------
// Also display the label band for comparison.
// ----------------------------------------------------------------------------
var dwClassPalette = [
  '#419bdf', // water
  '#397d49', // trees
  '#88b053', // grass
  '#7a87c6', // flooded vegetation
  '#e49635', // crops
  '#dfc35a', // shrub and scrub
  '#c4281b', // built
  '#a59b8f', // bare
  '#b39fe1'  // snow and ice
];

Map.addLayer(
  dwImage.select('label'),
  {min: 0, max: 8, palette: dwClassPalette},
  'Dynamic World label',
  false
);

// Use the Inspector to click the map and read pixel values.
```

## Part 5: Use the Inspector to Read a Single Pixel

```javascript
// Stace Maples
// EarthSys 144
// Part 5: Use the Inspector to Read a Single Pixel
//
// This script loads one Dynamic World image and displays several bands.
// Open the Inspector tab and click on the map to read pixel values.

// ----------------------------------------------------------------------------
// Define the AOI.
// ----------------------------------------------------------------------------
var aoi = ee.Geometry.Rectangle([
  -122.55, 37.05,
  -121.95, 37.55
]);

Map.centerObject(aoi, 10);
Map.addLayer(aoi, {color: 'red'}, 'AOI');

// ----------------------------------------------------------------------------
// Load one Dynamic World image.
// ----------------------------------------------------------------------------
var dwImage = ee.Image(
  ee.ImageCollection('GOOGLE/DYNAMICWORLD/V1')
    .filterBounds(aoi)
    .filterDate('2024-06-01', '2024-07-31')
    .sort('system:time_start', false)
    .first()
);

// ----------------------------------------------------------------------------
// Select several bands.
// ----------------------------------------------------------------------------
var trees = dwImage.select('trees');
var water = dwImage.select('water');
var built = dwImage.select('built');

// ----------------------------------------------------------------------------
// Display the bands for inspection.
// ----------------------------------------------------------------------------
Map.addLayer(
  trees,
  {min: 0, max: 1, palette: ['white', 'darkgreen']},
  'Trees probability'
);

Map.addLayer(
  water,
  {min: 0, max: 1, palette: ['white', 'blue']},
  'Water probability',
  false
);

Map.addLayer(
  built,
  {min: 0, max: 1, palette: ['white', 'maroon']},
  'Built probability',
  false
);

// ----------------------------------------------------------------------------
// Display the label band too.
// ----------------------------------------------------------------------------
var dwClassPalette = [
  '#419bdf', '#397d49', '#88b053', '#7a87c6', '#e49635',
  '#dfc35a', '#c4281b', '#a59b8f', '#b39fe1'
];

Map.addLayer(
  dwImage.select('label'),
  {min: 0, max: 8, palette: dwClassPalette},
  'Dynamic World label',
  false
);

print('Click the map with the Inspector tool to read pixel values.');
```

## Part 6: Use `updateMask()` to Show Only Strong Tree Pixels

```javascript
// Stace Maples
// EarthSys 144
// Part 6: Use updateMask() to Show Only Strong Tree Pixels
//
// This script uses the Dynamic World trees probability band,
// then masks out pixels below a threshold.

// ----------------------------------------------------------------------------
// Define the AOI.
// ----------------------------------------------------------------------------
var aoi = ee.Geometry.Rectangle([
  -122.55, 37.05,
  -121.95, 37.55
]);

Map.centerObject(aoi, 10);
Map.addLayer(aoi, {color: 'red'}, 'AOI');

// ----------------------------------------------------------------------------
// Load one Dynamic World image and select the trees band.
// ----------------------------------------------------------------------------
var dwImage = ee.Image(
  ee.ImageCollection('GOOGLE/DYNAMICWORLD/V1')
    .filterBounds(aoi)
    .filterDate('2024-06-01', '2024-07-31')
    .sort('system:time_start', false)
    .first()
);

var trees = dwImage.select('trees');

// ----------------------------------------------------------------------------
// Display the original trees probability band.
// ----------------------------------------------------------------------------
Map.addLayer(
  trees,
  {min: 0, max: 1, palette: ['white', 'darkgreen']},
  'Trees probability'
);

// ----------------------------------------------------------------------------
// Create threshold masks.
// ----------------------------------------------------------------------------
var treesMask60 = trees.gt(0.6);
var treesMask80 = trees.gt(0.8);

// Display the masks themselves.
Map.addLayer(
  treesMask60,
  {min: 0, max: 1, palette: ['black', 'yellow']},
  'Tree mask > 0.6',
  false
);

Map.addLayer(
  treesMask80,
  {min: 0, max: 1, palette: ['black', 'cyan']},
  'Tree mask > 0.8',
  false
);

// ----------------------------------------------------------------------------
// Apply the masks.
// ----------------------------------------------------------------------------
var treesMasked60 = trees.updateMask(treesMask60);
var treesMasked80 = trees.updateMask(treesMask80);

// Display the masked images.
Map.addLayer(
  treesMasked60,
  {min: 0.6, max: 1, palette: ['yellow', 'green']},
  'Trees probability > 0.6'
);

Map.addLayer(
  treesMasked80,
  {min: 0.8, max: 1, palette: ['cyan', 'darkgreen']},
  'Trees probability > 0.8',
  false
);

// ----------------------------------------------------------------------------
// Also display the label band for context.
// ----------------------------------------------------------------------------
var dwClassPalette = [
  '#419bdf', '#397d49', '#88b053', '#7a87c6', '#e49635',
  '#dfc35a', '#c4281b', '#a59b8f', '#b39fe1'
];

Map.addLayer(
  dwImage.select('label'),
  {min: 0, max: 8, palette: dwClassPalette},
  'Dynamic World label',
  false
);
```

## Part 7: Threshold the Hansen Forest Loss Dataset

```javascript
// Stace Maples
// EarthSys 144
// Part 7: Threshold the Hansen Forest Loss Dataset
//
// This script selects the Hansen lossyear band,
// then isolates forest loss from 2005 through 2014.

// ----------------------------------------------------------------------------
// Define the AOI.
// ----------------------------------------------------------------------------
var aoi = ee.Geometry.Rectangle([
  -122.55, 37.05,
  -121.95, 37.55
]);

Map.centerObject(aoi, 10);
Map.addLayer(aoi, {color: 'red'}, 'AOI');

// ----------------------------------------------------------------------------
// Load the Hansen Global Forest Change dataset.
// ----------------------------------------------------------------------------
var hansen = ee.Image('UMD/hansen/global_forest_change_2023_v1_11');

var treeCover2000 = hansen.select('treecover2000').clip(aoi);
var lossYear = hansen.select('lossyear').clip(aoi);

print('Hansen image:', hansen);
print('Hansen band names:', hansen.bandNames());

// ----------------------------------------------------------------------------
// Display tree cover in year 2000 for context.
// ----------------------------------------------------------------------------
Map.addLayer(
  treeCover2000,
  {min: 0, max: 100, palette: ['white', 'darkgreen']},
  'Tree cover 2000',
  false
);

// ----------------------------------------------------------------------------
// Display the raw lossyear band.
// 0 = no loss, 1 = 2001, 2 = 2002, etc.
// ----------------------------------------------------------------------------
Map.addLayer(
  lossYear,
  {min: 0, max: 23, palette: ['black', 'yellow', 'orange', 'red']},
  'Hansen lossyear raw',
  false
);

// ----------------------------------------------------------------------------
// Create a mask for loss from 2005 through 2014.
// ----------------------------------------------------------------------------
var loss2005to2014 = lossYear.gte(5).and(lossYear.lte(14));

// Display the Boolean mask.
Map.addLayer(
  loss2005to2014,
  {min: 0, max: 1, palette: ['black', 'red']},
  'Loss mask 2005-2014',
  false
);

// Apply the mask.
var lossMasked = lossYear.updateMask(loss2005to2014);

// Display the masked result.
Map.addLayer(
  lossMasked,
  {min: 5, max: 14, palette: ['yellow', 'orange', 'red']},
  'Forest loss 2005-2014'
);
```

## Part 8: Natural Color RGB Visualization with Sentinel-2

```javascript
// Stace Maples
// EarthSys 144
// Part 8: Natural Color RGB Visualization with Sentinel-2
//
// This script loads Sentinel-2 Surface Reflectance imagery,
// filters it, and creates a median composite for RGB display.

// ----------------------------------------------------------------------------
// Define the AOI.
// ----------------------------------------------------------------------------
var aoi = ee.Geometry.Rectangle([
  -122.55, 37.05,
  -121.95, 37.55
]);

Map.centerObject(aoi, 10);
Map.addLayer(aoi, {color: 'red'}, 'AOI');

// ----------------------------------------------------------------------------
// Load and filter Sentinel-2 Surface Reflectance.
// ----------------------------------------------------------------------------
var s2 = ee.ImageCollection('COPERNICUS/S2_SR_HARMONIZED')
  .filterBounds(aoi)
  .filterDate('2024-06-01', '2024-07-31')
  .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 20));

print('Filtered Sentinel-2 collection:', s2);
print('Number of Sentinel-2 images:', s2.size());

// ----------------------------------------------------------------------------
// Create a median composite and clip to the AOI.
// ----------------------------------------------------------------------------
var s2Image = s2.median().clip(aoi);

// Display the RGB image.
// B4 = red, B3 = green, B2 = blue.
Map.addLayer(
  s2Image,
  {bands: ['B4', 'B3', 'B2'], min: 0, max: 3000},
  'Sentinel-2 RGB'
);
```

## Part 9: False Color IRG / CIR Visualization

```javascript
// Stace Maples
// EarthSys 144
// Part 9: False Color IRG / CIR Visualization
//
// This script loads Sentinel-2 imagery and compares RGB with CIR.
// In CIR, vegetation usually appears bright red.

// ----------------------------------------------------------------------------
// Define the AOI.
// ----------------------------------------------------------------------------
var aoi = ee.Geometry.Rectangle([
  -122.55, 37.05,
  -121.95, 37.55
]);

Map.centerObject(aoi, 10);
Map.addLayer(aoi, {color: 'red'}, 'AOI');

// ----------------------------------------------------------------------------
// Load and filter Sentinel-2.
// ----------------------------------------------------------------------------
var s2Image = ee.ImageCollection('COPERNICUS/S2_SR_HARMONIZED')
  .filterBounds(aoi)
  .filterDate('2024-06-01', '2024-07-31')
  .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 20))
  .median()
  .clip(aoi);

// ----------------------------------------------------------------------------
// Display RGB.
// ----------------------------------------------------------------------------
Map.addLayer(
  s2Image,
  {bands: ['B4', 'B3', 'B2'], min: 0, max: 3000},
  'Sentinel-2 RGB'
);

// ----------------------------------------------------------------------------
// Display CIR / IRG.
// B8 = near infrared, B4 = red, B3 = green.
// ----------------------------------------------------------------------------
Map.addLayer(
  s2Image,
  {bands: ['B8', 'B4', 'B3'], min: 0, max: 3000},
  'Sentinel-2 CIR'
);
```

## Part 10: Modify the Script to Explore a New Place

Now that you have built a working false-color visualization in Part 9, your final task is to adapt that script so it works somewhere else in the world.

Start with your Part 9 script and make the following changes:

1. Change the **AOI** so it covers a different place somewhere else in the world.
2. Change the **date filter range** so the script loads imagery from a different time period.
3. Run the script again and confirm that it produces a new image for your new AOI and date range.
4. Keep the RGB and CIR visualizations so you can compare how the new place looks in both band combinations.

As you make these changes, add your usual script header as comments at the top of the script.

Your header should include:

- your name
- the course name
- the lab title
- a short note explaining what place and date range you chose

> **Why do this?** One of the most important Earth Engine skills is learning how to adapt a working script to a new place and time. If you can change the AOI and date range successfully, you are beginning to use the script as an analytical tool rather than just following it mechanically.

## To Turn-In

For this lab, students should submit:

- a PDF exported from Google Docs that contains their Google Earth Engine **Get Link** URL to their modified script
- that includes their name in a comment near the top
- inline comments marking any changes they made

To prepare your submission:

1. Copy your Google Earth Engine **Get Link** URL.
2. Create a short Google Doc with your name, the lab title, and the URL.
3. Export the Google Doc as a PDF.
4. Upload that PDF to Canvas.

> **Course turn-in rule:** All `TURN_IN` assignments in this course are submitted as PDF files. If the deliverable is a URL, put it in a Google Doc and export that document as a PDF for submission.

Your script should demonstrate:

- an AOI
- a changed AOI and changed date range that produce imagery for a new place
- collection filtering by place and date
- RGB and CIR visualization using Sentinel-2 bands

## A Good Script Header Example

```javascript
// Your Name
// EarthSys 144
// Collections, Images, Bands, and Pixels in Google Earth Engine
// I filtered Sentinel-2 by my AOI and dates,
```
