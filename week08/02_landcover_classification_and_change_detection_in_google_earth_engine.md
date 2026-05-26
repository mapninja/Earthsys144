# Landcover Classification & Change Detection in Google Earth Engine

> **Draft status:** This lab is currently being revised. We are actively updating it to use the newer classifier workflow in place of the older version, so a few sections may still reflect the transition.
>
> If you want the newer AlphaEarth-based version of this workflow, see [`02b_landcover_classification_with_alphaearth_embeddings_in_google_earth_engine.md`](02b_landcover_classification_with_alphaearth_embeddings_in_google_earth_engine.md).

## What You Should Understand

By the end of this workshop, you should understand how supervised landcover classification works in Google Earth Engine and how to compare two classified maps to see where landcover changed.

The main ideas are:

1. Build a composite image from Sentinel-2 imagery.
2. Use labeled training points to teach a classifier what each landcover class looks like.
3. Apply the same classifier to two different dates.
4. Compare the two classified maps to detect change.

> **Concept Note:**
> A classifier does not “know” landcover on its own. It learns patterns from example data you give it, then applies those learned patterns to every pixel in the image.

> **Concept Note:**
> Change detection is often easiest when you classify both dates the same way first. Then you compare the class maps instead of comparing raw spectral values.

## Getting Ready

The script uses these pieces of data:

1. `COPERNICUS/S2_SR` Sentinel-2 surface reflectance imagery.
2. A custom `aoi` polygon that defines the study area.
3. Four training feature collections:
   - `Water`
   - `Vegetation`
   - `Urban`
   - `Bare`

The training points in the shared script are already labeled with numeric class values:

- `0` = Bare
- `1` = Water
- `2` = Vegetation
- `3` = Urban

> **Concept Note:**
> Earth Engine classification expects numeric class labels. Starting at `0` is the safest choice because that is the convention Earth Engine documents and examples use.

## Why We Are Updating the Classifier

The original script used a CART classifier. CART can work, but for a multiband landcover workflow like this, a newer classifier choice is often a better teaching fit because it usually handles noisy training points and mixed spectral signatures more robustly.

For that reason, this course version is being updated to use:

```javascript
ee.Classifier.smileRandomForest(100)
```

That means we are training a Random Forest with 100 trees.

> **Concept Note:**
> A Random Forest is really many decision trees working together. That usually gives more stable results than a single decision tree.

## Workflow Overview

We will build the workflow in these steps:

1. Load the Sentinel-2 collection and the study area.
2. Build two monthly composites, one for `before` and one for `after`.
3. Review the training points and merge them into one training dataset.
4. Split the sample into training and validation data.
5. Train a Random Forest classifier.
6. Classify the `before` and `after` composites.
7. Compare the two classified maps to detect change.
8. Summarize class area with charts.
9. Optionally export the classified result.

## Step 1: Set Up the Script

Start with the data and the study area.

```javascript
// Landcover Classification & Change Detection in Google Earth Engine
// This script uses Sentinel-2 imagery, labeled training points,
// and a Random Forest classifier to map landcover for two dates.

// STEP 1: Load the Sentinel-2 image collection.
// `COPERNICUS/S2_SR` contains Sentinel-2 surface reflectance imagery.
var sentinel = ee.ImageCollection('COPERNICUS/S2_SR');

// STEP 2: Open the shared script and keep the full training feature
// collections and geometry objects exactly as provided there:
// - Water
// - Vegetation
// - Urban
// - Bare
// - aoi
// - exportaoi
//
// The complete versions of those objects are already present in the
// linked Earth Engine script, so you do not need to redraw them.
```

## Step 2: Build Before and After Composites

We will compare two monthly composites:

- `before`: June 2019
- `after`: June 2020

```javascript
// STEP 3: Filter the Sentinel-2 collection by date and area.
// We keep the AOI in the filter so Earth Engine only works with the relevant area.
// A cloud threshold helps reduce cloudy scenes before we make a median composite.
var before = sentinel
  .filterBounds(aoi)
  .filterDate('2019-06-01', '2019-06-30')
  .filter(ee.Filter.lte('CLOUDY_PIXEL_PERCENTAGE', 20));

var after = sentinel
  .filterBounds(aoi)
  .filterDate('2020-06-01', '2020-06-30')
  .filter(ee.Filter.lte('CLOUDY_PIXEL_PERCENTAGE', 20));

// STEP 4: Make median composites.
// `median()` reduces the influence of odd pixels from clouds or haze.
var beforeImage = before.median();
var afterImage = after.median();

// STEP 5: Choose the bands we want to use.
// These bands give us visible, red-edge, and near-infrared information.
var bands = ['B2', 'B3', 'B4', 'B5', 'B6', 'B7', 'B8'];

// STEP 6: Define a false-color visualization.
// This shows vegetation well because near-infrared is highlighted.
var falseColorVis = {
  min: 0,
  max: 6000,
  bands: ['B8', 'B4', 'B3']
};

// STEP 7: Add the composites to the map so we can inspect them.
Map.centerObject(aoi, 10);
Map.addLayer(beforeImage, falseColorVis, 'Before (2019) false color', false);
Map.addLayer(afterImage, falseColorVis, 'After (2020) false color', true);
Map.addLayer(aoi, {color: 'FF0000'}, 'AOI', false);
```

> **Concept Note:**
> A median composite is a simple way to reduce noise from clouds, shadows, and random scene differences. It gives us a more stable image for classification.

## Step 3: Merge the Training Points

Earth Engine can train on one `FeatureCollection`, so we merge all four class groups into one training layer.

```javascript
// STEP 8: Merge the labeled training points into one collection.
// The `class` property tells Earth Engine which landcover category each point represents.
var trainingFeatures = Bare.merge(Water).merge(Vegetation).merge(Urban);

// STEP 9: Sample the after composite at the training points.
// `sampleRegions()` reads the pixel values at each point and builds a table.
var samples = afterImage.select(bands).sampleRegions({
  collection: trainingFeatures,
  properties: ['class'],
  scale: 10
});

print('Training samples', samples);
```

> **Concept Note:**
> `sampleRegions()` is the bridge between a raster image and a training table. It copies pixel values into a `FeatureCollection` that a classifier can learn from.

## Step 4: Split Training and Validation Data

It is good practice to test the classifier on data it did not see during training.

```javascript
// STEP 10: Add a random column so we can split the samples.
// This gives each row a random value between 0 and 1.
var samplesWithRandom = samples.randomColumn('random');

// STEP 11: Split the sample into training and validation subsets.
// About 70% of the points go to training, and 30% go to validation.
var trainSet = samplesWithRandom.filter(ee.Filter.lt('random', 0.7));
var validationSet = samplesWithRandom.filter(ee.Filter.gte('random', 0.7));

print('Training set', trainSet);
print('Validation set', validationSet);
```

## Step 5: Train a Random Forest Classifier

The original script used CART. This course version switches to Random Forest.

```javascript
// STEP 12: Train a Random Forest classifier.
// Random Forest is usually a strong choice for landcover classification
// because it combines many decision trees instead of relying on just one.
var classifier = ee.Classifier.smileRandomForest(100).train({
  features: trainSet,
  classProperty: 'class',
  inputProperties: bands
});

// STEP 13: Print a short explanation of the trained classifier.
print('Random Forest classifier explanation', classifier.explain());

// STEP 14: Evaluate the classifier on the training set.
var trainConfusion = trainSet.classify(classifier).errorMatrix('class', 'classification');
print('Training confusion matrix', trainConfusion);
print('Training overall accuracy', trainConfusion.accuracy());

// STEP 15: Evaluate the classifier on the validation set.
var validationConfusion = validationSet.classify(classifier).errorMatrix('class', 'classification');
print('Validation confusion matrix', validationConfusion);
print('Validation overall accuracy', validationConfusion.accuracy());
```

> **Concept Note:**
> Random Forest is often preferred over CART for beginner landcover classification projects because it usually gives more stable results when the training data are a little noisy.

## Step 6: Classify the Before and After Images

Now we can classify both dates with the same trained model.

```javascript
// STEP 16: Classify the after composite.
var afterClassified = afterImage.select(bands).classify(classifier);

// STEP 17: Classify the before composite.
var beforeClassified = beforeImage.select(bands).classify(classifier);

// STEP 18: Define a color palette for the class map.
// The class order is:
// 0 = Bare
// 1 = Water
// 2 = Vegetation
// 3 = Urban
var classVis = {
  min: 0,
  max: 3,
  palette: ['ffd629', '008fff', '118b05', 'ff0c06']
};

Map.addLayer(beforeClassified, classVis, 'Before classified', false);
Map.addLayer(afterClassified, classVis, 'After classified', true);
```

![Placeholder: screenshot of the before and after classified maps in the Earth Engine Code Editor, with the class palette visible in the Layers panel.](images/landcover_classified_placeholder.png)

## Step 7: Detect Change

The simplest change map shows whether a pixel changed class between the two dates.

```javascript
// STEP 19: Compare the classified maps.
// `neq()` means "not equal to", so this keeps pixels that changed class.
var changeMask = beforeClassified.neq(afterClassified);

// STEP 20: Make changed pixels visible.
// `selfMask()` hides the pixels where the comparison is false.
var changedPixels = changeMask.selfMask();

// STEP 21: Add the change layer to the map.
Map.addLayer(changedPixels, {palette: ['ffff00']}, 'Changed pixels', false);
```

If you want a more detailed transition map, you can also encode before/after class pairs into a single number. That is useful for more advanced analysis, but the binary change mask is easier to read at first.

> **Concept Note:**
> Change detection can be as simple as asking, “Did the class stay the same?” If it did not, that pixel is a change pixel.

## Step 8: Summarize Area by Class

Now we can measure how much area each class covers.

```javascript
// STEP 22: Define chart styling.
var options = {
  lineWidth: 1,
  pointSize: 2,
  hAxis: {title: 'Classes'},
  vAxis: {title: 'Area m^2'},
  title: 'Area by class',
  series: {
    0: {color: 'ffd629'}, // Bare
    1: {color: '008fff'}, // Water
    2: {color: '118b05'}, // Vegetation
    3: {color: 'ff0c06'}  // Urban
  }
};

// STEP 23: Chart the classified area for the after date.
var areaChartAfter = ui.Chart.image.byClass({
  image: ee.Image.pixelArea().addBands(afterClassified),
  classBand: 'classification',
  region: aoi,
  scale: 30,
  reducer: ee.Reducer.sum()
}).setOptions(options)
  .setSeriesNames(['bare', 'water', 'vegetation', 'urban']);

print('Area by class after', areaChartAfter);

// STEP 24: Chart the classified area for the before date.
var areaChartBefore = ui.Chart.image.byClass({
  image: ee.Image.pixelArea().addBands(beforeClassified),
  classBand: 'classification',
  region: aoi,
  scale: 30,
  reducer: ee.Reducer.sum()
}).setOptions(options)
  .setSeriesNames(['bare', 'water', 'vegetation', 'urban']);

print('Area by class before', areaChartBefore);
```

> **Concept Note:**
> The chart does not just make a nice graphic. It gives you a quick quantitative check that the map is behaving in a way that makes sense.

## Step 9: Export the Result if Needed

If you want to save the classified map, you can export the result to Google Drive.

```javascript
// STEP 25: Export the after classification to Google Drive.
// The export AOI is larger than the study area, so feel free to shrink it if needed.
Export.image.toDrive({
  image: afterClassified,
  description: 'landcover_after_classified',
  fileNamePrefix: 'landcover_after_classified',
  region: exportaoi,
  fileFormat: 'GeoTIFF',
  formatOptions: {
    cloudOptimized: true
  },
  scale: 30,
  maxPixels: 1e9
});
```

## What You Should Submit

If this optional workshop is assigned for your section, submit:

1. A screenshot or PDF showing the before and after classified layers.
2. The validation or accuracy output from the classifier.
3. A brief note describing where you see change and what it seems to represent.

## What This Teaches

This lab shows a realistic Earth Engine workflow:

1. Build a clean composite from satellite imagery.
2. Use training points to teach a classifier.
3. Evaluate the classifier with validation data.
4. Apply the classifier to multiple dates.
5. Compare the results to detect change.
