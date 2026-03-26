# Introducing Collections, Images, Bands, and Pixels in Google Earth Engine (DRAFT)

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

You should begin almost every Earth Engine workflow by deciding where you are looking.

For this lab, you can use a rectangle, polygon, or imported AOI from earlier work.

```javascript
// Create a simple rectangular Area of Interest (AOI).
// The coordinates are in longitude, latitude order.
// This AOI is around part of the San Francisco Peninsula.
var aoi = ee.Geometry.Rectangle([-122.55, 37.05, -121.95, 37.55]);

// Center the map on the AOI so we can see where we are working.
Map.centerObject(aoi, 10);

// Add the AOI to the map as an outline.
// The color setting here controls the display color only.
Map.addLayer(aoi, {color: 'red'}, 'AOI');
```

> **Why start here?** An AOI keeps your work focused. Instead of working with the whole Earth, you are limiting your analysis to the place that matters to your question.

## Part 2: Start with a Collection, Then Filter It

Dynamic World is an `ImageCollection`, which means there are many images available across dates and locations.

```javascript
// Load the Dynamic World Version 1 image collection.
// This is a collection, not a single image.
var dwCollection = ee.ImageCollection('GOOGLE/DYNAMICWORLD/V1');

// Filter the collection to images that intersect our AOI.
// This keeps only scenes that touch the place we care about.
var dwByPlace = dwCollection.filterBounds(aoi);

// Filter again by date so we work with a manageable time period.
// Here we limit to the 2023 calendar year.
var dwByDate = dwByPlace.filterDate('2023-01-01', '2023-12-31');

// Print the filtered collection so we can inspect it in the Console.
print('Dynamic World images in AOI and date range:', dwByDate);
```

> **Concept note:** This is a very common Earth Engine pattern. You usually start with a large collection and progressively narrow it until it matches your place and time of interest.

## Part 3: Move from a Collection to a Single Image

Many operations become easier to understand if you work with one image at a time.

```javascript
// Sort the filtered collection by time so the newest image is first.
var dwSorted = dwByDate.sort('system:time_start', false);

// Convert the first image in the sorted collection into a single ee.Image.
// This gives us one scene to inspect and visualize.
var dwImage = ee.Image(dwSorted.first());

// Print the image metadata so we can see its bands and properties.
print('One Dynamic World image:', dwImage);
```

## Part 4: Look at Bands and Pixel Values

Dynamic World contains a labeled class band and several probability bands.

For beginning raster analysis, it is very useful to select one band and think carefully about what its pixel values mean.

```javascript
// Select the 'trees' probability band from the Dynamic World image.
// This produces a new single-band image.
var trees = dwImage.select('trees');

// Add the band to the map.
// Values closer to 1 mean higher model confidence that a pixel is trees.
Map.addLayer(
  trees,
  {min: 0, max: 1, palette: ['white', 'darkgreen']},
  'Dynamic World trees probability'
);

// Print the selected band so we can inspect it in the Console.
print('Trees probability band:', trees);
```

> **Concept note:** In this case, each pixel value is not simply "tree" or "not tree." It is a probability value between 0 and 1. That is a nice reminder that not all raster pixels are direct categories. Some are modeled values.

## Part 5: Use the Inspector to Read a Single Pixel

After running the script:

1. Open the **Inspector** tab in Earth Engine.
2. Click on the map inside your AOI.
3. Read the value reported for the `trees` band.

That clicked value is the single-pixel value at that location.

> **Why this matters:** This is one of the key conceptual moves in remote sensing. A map may look like an image, but analysis often depends on understanding that each cell has a numeric value you can query, compare, threshold, and mask.

## Part 6: Use `updateMask()` to Show Only Strong Tree Pixels

`updateMask()` is used to hide pixels that do not meet a condition.

Here, you will keep only pixels where the Dynamic World `trees` probability is high.

```javascript
// Create a Boolean mask where pixels are true if tree probability is above 0.6.
// Pixels below that threshold will be hidden when the mask is applied.
var treesMask = trees.gt(0.6);

// Apply the mask to the original trees probability image.
// Only pixels passing the condition remain visible.
var treesMasked = trees.updateMask(treesMask);

// Add the masked image to the map.
Map.addLayer(
  treesMasked,
  {min: 0.6, max: 1, palette: ['yellow', 'green']},
  'Trees probability > 0.6'
);
```

> **Concept note:** A mask does not necessarily change the underlying pixel values. It changes which pixels are visible or available for subsequent analysis.

## Part 7: Threshold the Hansen Forest Loss Dataset

Now you will move from class probabilities to a different kind of pixel value.

In the Hansen dataset, the `lossyear` band stores the year of forest loss as a coded value:

- `0` means no recorded loss
- `1` means loss in 2001
- `2` means loss in 2002
- and so on

So if you want all forest loss during a ten-year period, you can threshold those values.

```javascript
// Load the Hansen Global Forest Change image.
// This dataset is a single multi-band image.
var hansen = ee.Image('UMD/hansen/global_forest_change_2023_v1_11');

// Select the lossyear band, which stores the coded year of forest loss.
var lossYear = hansen.select('lossyear');

// Clip the data to the AOI so the display focuses on our study area.
var lossYearClipped = lossYear.clip(aoi);

// Create a mask for forest loss that happened from 2005 through 2014.
// In the Hansen coding, 2001 = 1, so 2005 = 5 and 2014 = 14.
var loss2005to2014 = lossYearClipped.gte(5).and(lossYearClipped.lte(14));

// Apply the mask so only pixels with loss in that ten-year window remain visible.
var lossMasked = lossYearClipped.updateMask(loss2005to2014);

// Add the masked forest loss image to the map.
// The palette is arbitrary, but warm colors help the loss stand out.
Map.addLayer(
  lossMasked,
  {min: 5, max: 14, palette: ['yellow', 'orange', 'red']},
  'Forest loss 2005-2014'
);
```

> **Concept note:** This is a thresholding workflow. You are turning a broad range of pixel values into a narrower condition of interest. This is one of the most common operations in raster analysis.

## Part 8: Natural Color RGB Visualization with Sentinel-2

Now you will work with Sentinel-2 imagery directly so you can compare analysis products to the source imagery.

```javascript
// Load the Sentinel-2 surface reflectance collection.
var s2 = ee.ImageCollection('COPERNICUS/S2_SR_HARMONIZED');

// Filter Sentinel-2 to the same AOI and date range used above.
var s2Filtered = s2
  .filterBounds(aoi)
  .filterDate('2023-01-01', '2023-12-31')
  .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 20));

// Make a median composite so we get one representative image.
// This reduces the impact of clouds and scene-to-scene variation.
var s2Image = s2Filtered.median().clip(aoi);

// Add a natural color RGB visualization.
// B4 is red, B3 is green, and B2 is blue.
Map.addLayer(
  s2Image,
  {bands: ['B4', 'B3', 'B2'], min: 0, max: 3000},
  'Sentinel-2 RGB'
);
```

### What is RGB?

RGB uses:

- `B4` for red
- `B3` for green
- `B2` for blue

This gives an image that looks relatively close to what our eyes expect from a color photograph.

## Part 9: False Color IRG / CIR Visualization

Near infrared is especially useful for vegetation analysis because healthy vegetation reflects strongly in that part of the spectrum.

```javascript
// Add a false-color image using near infrared, red, and green.
// This is often called CIR or false-color infrared visualization.
// Vegetation usually appears bright red in this display.
Map.addLayer(
  s2Image,
  {bands: ['B8', 'B4', 'B3'], min: 0, max: 3000},
  'Sentinel-2 CIR'
);
```

### Why does this help?

RGB is useful for familiar visual interpretation.

CIR is useful because vegetation becomes much easier to distinguish, often appearing bright red or pink, while built surfaces and water appear very different.

> **Concept note:** Visualization is not just cosmetic. Changing band combinations helps you see different physical properties in the landscape.

## Part 10: How Dynamic World and Sentinel-2 Are Connected

Dynamic World is derived from Sentinel-2 imagery. That means the land cover probabilities you viewed earlier are tied to a specific Sentinel-2 acquisition.

In many cases, the image identifiers are closely related, and the Dynamic World image name reflects the Sentinel-2 scene it was built from.

Here is a simple way to inspect that relationship:

```javascript
// Get the system index for the selected Dynamic World image.
// This is often the easiest way to examine how the image is identified.
var dwId = dwImage.get('system:index');

// Print the identifier to the Console so we can compare it to Sentinel-2 scene names.
print('Dynamic World system:index', dwId);
```

When you inspect the metadata for Dynamic World images and Sentinel-2 scenes, you can often see that they correspond to the same underlying acquisition.

> **Why this matters:** Dynamic World is not an unrelated map product floating in space. It is tied to specific Sentinel-2 imagery. That means you can move back and forth between the classified product and the source multispectral image when interpreting what you see.

## Suggested Turn-In

For this lab, students should submit:

- a Google Earth Engine **Get Link** URL
- a script that includes their name in a comment near the top
- inline comments marking any changes they made

Their script should demonstrate:

- an AOI
- collection filtering by place and date
- selection of a single Dynamic World probability band
- use of `updateMask()`
- thresholding of Hansen forest loss for a ten-year period
- RGB and CIR visualization using Sentinel-2 bands

## A Good Script Header Example

```javascript
// Your Name
// Earthsys 144 Week 02
// Collections, images, bands, and pixels in Google Earth Engine
// I filtered Dynamic World and Sentinel-2 by my AOI and dates,
// masked high tree-probability pixels, and mapped forest loss for a ten-year period.
```

## Conclusion

This lab is meant to make a very important transition feel manageable.

You are moving from "satellite imagery is a picture" toward a stronger understanding:

- collections contain many images
- images contain bands
- bands contain pixel values
- pixel values can be filtered, masked, thresholded, and visualized

That way of thinking is the foundation of remote sensing and raster analysis in Earth Engine.
