# Wildfire Detection & Severity Measurement in Google Earth Engine

> **Attribution note:** This workshop is adapted from a Google Earth Blog post by Christophe Restif and Avi Hoffman, [How to generate wildfire boundary maps with Earth Engine](https://medium.com/google-earth/how-to-generate-wildfire-boundary-maps-with-earth-engine-b38eadc97a38). The workflow, the fire-mask logic, and the original concept all come from that source.

## What You Should Understand

This lab shows how Earth Engine can turn a stream of wildfire-detection pixels into a mapped fire boundary.

The most important idea is that this script is about:

1. Finding fire-detection pixels over time.
2. Turning the fire mask codes into confidence values.
3. Combining two GOES satellites.
4. Smoothing the result so it looks more like a real wildfire footprint.
5. Converting the final mask into polygons.

This workflow is useful for understanding wildfire extent and the shape of the affected area.

> **Concept Note:**
> This script is better described as a wildfire boundary workflow than a strict burn-severity index. It uses fire-detection confidence values from GOES fire products, then outlines the affected area.

> **Concept Note:**
> When you work with a time series in Earth Engine, you often need to reduce many images into one summary image. Here, the summary is the maximum fire confidence observed over the event period.

## Getting Ready

Open a new script in the Earth Engine Code Editor and paste the code blocks below into it as you go:

- [Earth Engine Code Editor](https://code.earthengine.google.com/)

The code in this lab uses:

1. `NOAA/GOES/16/FDCF`
2. `NOAA/GOES/17/FDCF`
3. A fire location near the Kincade Fire in California
4. A buffered area of interest around that fire location

The script focuses on a known wildfire event and a specific date range:

- Start date: `2019-10-23`
- End date: `2019-11-06`

> **Concept Note:**
> The date window matters because the fire mask values are time-specific. We are not looking at a whole year or a general background image. We are focusing on the event itself.

## Why This Workflow Works

Earth Engine is useful here because it can:

1. Filter an image collection by date and location.
2. Transform coded pixel values into a simpler confidence scale.
3. Reduce a time series into one summary image.
4. Smooth and vectorize the result to create a boundary outline.

The original Fire Detection and Characterization product gives a set of mask codes that indicate whether a pixel is likely part of a fire. The script turns those codes into numeric confidence values so the rest of the workflow can process them more easily.

## Step 1: Load the Fire Detection Collections

Start by defining the fire location, the date range, and the area of interest.

```javascript
// Wildfire Detection & Severity Measurement in Google Earth Engine
// This script turns GOES fire-detection pixels into a wildfire boundary outline.

// STEP 1: Define the fire location and time window.
// We are using the Kincade Fire area in California as the example.
var kincade = {
  // Longitude of the fire center point.
  longitude: -122.8,
  // Latitude of the fire center point.
  latitude: 38.7,
  // Start date for the event window.
  start: '2019-10-23',
  // End date for the event window.
  end: '2019-11-06'
};

// STEP 2: Define an area of interest around the fire location.
// Buffering the point gives us a larger region to inspect around the fire.
var radius_of_interest_meters = 40000;
// Make a point geometry, then expand it into a circle-like area.
var area_of_interest = ee.Geometry.Point([
  kincade.longitude,
  kincade.latitude
]).buffer(radius_of_interest_meters);

// STEP 3: Load the GOES fire detection collections.
// These collections contain the fire-detection mask values we need.
var goes_16_data = ee.ImageCollection('NOAA/GOES/16/FDCF')
  .filterDate(kincade.start, kincade.end)
  .filterBounds(area_of_interest);

var goes_17_data = ee.ImageCollection('NOAA/GOES/17/FDCF')
  .filterDate(kincade.start, kincade.end)
  .filterBounds(area_of_interest);

// STEP 4: Inspect the map view.
// This centers the map on the fire area so the layers will be easy to see.
Map.centerObject(area_of_interest, 9);
// Draw the area of interest so we can see the region being studied.
Map.addLayer(area_of_interest, {color: 'green'}, 'Area of interest', true, 0.2);
```

![Placeholder: map centered on the wildfire area of interest, with the buffer outline visible around the Kincade Fire location.](images/wildfire_aoi_placeholder.png)

## Step 2: Convert Fire Mask Codes to Confidence Values

The GOES fire product uses mask codes to describe the likelihood that a pixel belongs to a fire.

We will convert those codes into a simpler confidence score from `0` to `1`.

```javascript
// STEP 5: Define the mask codes we want to keep.
// The list includes the main fire mask codes and their temporally filtered versions.
var fire_mask_codes = [10, 30, 11, 31, 12, 32, 13, 33, 14, 34, 15, 35];

// STEP 6: Convert the mask codes into confidence values.
// Higher values mean higher confidence that the pixel is part of the fire.
var confidence_values = [1.0, 1.0, 0.9, 0.9, 0.8, 0.8, 0.5, 0.5, 0.3, 0.3, 0.1, 0.1];

// STEP 7: Use zero for anything that does not match the fire mask list.
var default_confidence_value = 0;

// STEP 8: Write a function that remaps the fire mask for one image.
// `clip()` limits the image to the study area so we only process the fire region.
// `remap()` replaces the original code values with our confidence values.
var map_from_mask_codes_to_confidence_values = function(image) {
  // Work on one image at a time, then return the remapped result.
  return image
    .clip(area_of_interest)
    .remap(fire_mask_codes, confidence_values, default_confidence_value);
};

// STEP 9: Keep only the Mask band and map the conversion function over time.
// `select(['Mask'])` keeps only the fire mask band.
var goes_16_confidence = goes_16_data
  .select(['Mask'])
  .map(map_from_mask_codes_to_confidence_values);

// Do the same conversion for GOES 17.
var goes_17_confidence = goes_17_data
  .select(['Mask'])
  .map(map_from_mask_codes_to_confidence_values);
```

> **Concept Note:**
> `remap()` is a very handy way to translate coded values into a new scale. In this case, we are converting fire mask codes into confidence values that are easier to visualize and combine.

## Step 3: Summarize the Time Series With a Maximum

As the wildfire evolves, pixels can switch from one fire category to another. We want one summary image that captures the strongest fire signal observed during the event.

```javascript
// STEP 10: Reduce each satellite time series to one maximum-confidence image.
// `reduce(ee.Reducer.max())` keeps the highest fire confidence seen for each pixel.
var goes_16_max_confidence = goes_16_confidence.reduce(ee.Reducer.max());
var goes_17_max_confidence = goes_17_confidence.reduce(ee.Reducer.max());

// STEP 11: Choose a color palette for the fire confidence visualization.
var affected_area_palette = ['white', 'yellow', 'orange', 'red', 'purple'];

// STEP 12: Add the individual satellite summaries to the map.
Map.addLayer(
  goes_16_max_confidence,
  {opacity: 0.3, min: 0, max: 1, palette: affected_area_palette},
  'GOES 16 maximum confidence'
);

Map.addLayer(
  goes_17_max_confidence,
  {opacity: 0.3, min: 0, max: 1, palette: affected_area_palette},
  'GOES 17 maximum confidence'
);
```

> **Concept Note:**
> A `max` reducer is a simple way to capture the strongest evidence of fire over the whole event window. Other reducers would answer different questions.

## Step 4: Combine GOES 16 and GOES 17

GOES 16 and GOES 17 see the same region, but not with exactly the same pixel grid.

We combine them to get one stronger confidence surface.

```javascript
// STEP 13: Combine the two maximum-confidence images.
// `reduce(ee.Reducer.min())` keeps the lower confidence when the two sensors disagree.
// That makes the combined result more conservative.
var combined_confidence = ee.ImageCollection([
  goes_16_max_confidence,
  goes_17_max_confidence
]).reduce(ee.Reducer.min());

// STEP 14: Add the combined confidence layer to the map.
Map.addLayer(
  combined_confidence,
  {opacity: 0.3, min: 0, max: 1, palette: affected_area_palette},
  'Combined confidence'
);
```

> **Concept Note:**
> Combining two sensors can improve your confidence in the final result. Here we use a conservative rule so the combined image only keeps strong evidence from both satellites.

## Step 5: Smooth the Pixel Edges

The raw confidence image still looks blocky because satellite pixels are rectangular.

We smooth it to make the boundary easier to interpret.

```javascript
// STEP 15: Create a square kernel to look at nearby pixels.
// The kernel size controls how much smoothing happens.
var kernel = ee.Kernel.square(2000, 'meters', true);

// STEP 16: Smooth the image by averaging nearby pixels.
// `reduceNeighborhood()` looks around each pixel and summarizes its neighbors.
var smoothed_confidence = combined_confidence.reduceNeighborhood({
  reducer: ee.Reducer.mean(),
  kernel: kernel,
  optimization: 'boxcar'
});

// STEP 17: Add the smoothed layer to the map.
Map.addLayer(
  smoothed_confidence,
  {opacity: 0.3, min: 0, max: 1, palette: affected_area_palette},
  'Smoothed confidence'
);
```

> **Concept Note:**
> Smoothing does not create new fire evidence. It just makes the boundary less jagged and easier to map.

## Step 6: Threshold the Result

Now we convert the smoothed confidence image into a binary fire mask.

```javascript
// STEP 18: Keep only pixels above the confidence threshold.
// Pixels above 0.6 are treated as part of the wildfire boundary.
var high_confidence = smoothed_confidence.gt(0.6);

// STEP 19: Display the binary mask on the map.
Map.addLayer(
  high_confidence,
  {opacity: 0.3, min: 0, max: 1, palette: affected_area_palette},
  'High confidence'
);
```

> **Concept Note:**
> Thresholding is a decision step. You are choosing the confidence level that counts as “fire” for this map.

## Step 7: Convert the Mask to Polygons

Earth Engine can turn the binary mask into vector features.

```javascript
// STEP 20: Convert the binary image to vector polygons.
// `reduceToVectors()` traces connected pixels where the image equals 1.
var affected_areas = high_confidence.reduceToVectors({
  scale: 200,
  maxPixels: 1e10,
  geometry: area_of_interest
}).filter(ee.Filter.eq('label', 1));

// STEP 21: Start with an empty image, then paint the polygon outlines onto it.
// This lets us display the vectors like a map layer.
var affected_areas_outline = ee.Image().byte().paint({
  featureCollection: affected_areas,
  width: 2
});

Map.addLayer(affected_areas_outline, {palette: 'purple'}, 'Affected areas', true, 0.3);
```

![Placeholder: vector outline of the affected wildfire area traced from the thresholded fire mask.](images/wildfire_outline_placeholder.png)

> **Concept Note:**
> `reduceToVectors()` is useful when you want a raster result to become a map feature that you can outline, label, or export.

## Step 8: Smooth the Outline

The vector boundary can still be a little jagged, so we simplify it.

```javascript
// STEP 22: Define a simplification function.
// The larger the tolerance, the smoother the polygon becomes.
var smooth = function(feature) {
  // Keep the shape general, but drop tiny wiggles that are hard to see at map scale.
  var max_error_meters = 500;
  return ee.Feature(feature).simplify(max_error_meters);
};

// STEP 23: Apply the simplification function to every feature.
// `.map()` runs the function once for each polygon in the collection.
var affected_areas_smoothed = ee.FeatureCollection(affected_areas).map(smooth);

// STEP 24: Draw the smoothed outline on the map.
// Paint the simplified polygons so the boundary is easier to read.
var affected_areas_smoothed_outline = ee.Image().byte().paint({
  featureCollection: affected_areas_smoothed,
  width: 2
});

Map.addLayer(
  affected_areas_smoothed_outline,
  {palette: 'purple'},
  'Smoothed affected areas',
  true,
  0.3
);
```

> **Concept Note:**
> Simplification removes small jagged details from the polygon boundary. That makes the outline easier to read, but it also changes the geometry slightly.

## Step 9: Evaluate the Result

Every fire boundary workflow has choices:

1. The date range.
2. The confidence mapping.
3. The smoothing kernel.
4. The threshold value.
5. The vector simplification tolerance.

Those choices affect the final boundary. A strong GIS workflow includes checking whether the result makes sense and comparing it to outside reference data when possible.

```javascript
// STEP 25: Optional note for future improvement.
// In a real workflow, compare the output to an official fire perimeter dataset
// from a trusted source to see whether the threshold and smoothing choices are reasonable.
//
// Example reference source:
// http://data-nifc.opendata.arcgis.com/
```

## What This Teaches

This lab teaches a general remote-sensing workflow:

1. Filter an image collection by time and place.
2. Convert coded pixels into a simplified score.
3. Reduce a time series into one summary image.
4. Smooth and threshold the result.
5. Vectorize the boundary for mapping.
