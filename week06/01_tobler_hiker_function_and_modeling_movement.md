# Tobler's Hiker Function: Modeling Movement and Terrain-Based Distance

> **Turn-in for grading:** This lab includes material that must be turned in for grading. Complete the required deliverables and submit them as instructed by the course.

## Overview

In this lab, you will use **Tobler's Hiker Function** to model how terrain constrains geographic space. Instead of measuring distance in kilometers, you will measure distance in **hours of travel time**—capturing how terrain affects human movement.

You will work in Google Earth Engine to:

1. understand how slope affects walking speed using Tobler's empirical function
2. create a cost surface showing travel time from a starting point
3. model reachable areas for 1-, 2-, and 3-day journeys
4. compare terrain-based vs. flat-ground movement
5. explore how origin point and daily walking hours change reachability

> **Concept note:** Tobler's Hiker Function introduces **friction** into geographic space. A steep mountain valley might be 10 km away as the crow flies but 8+ hours to traverse. Travel time is a more realistic distance metric than straight-line distance.

## Background

### The Formula

Tobler (1993) found that hiking speed depends on slope:

```
Speed (km/h) = 6 × exp(-3.5 × |tan(slope_radians) + 0.05|)
```

What this means:
- **Flat ground (0°)**: 6 km/hr (base speed)
- **Gentle uphill (10°)**: ~3 km/hr (slowed by half)
- **Steep (30°+)**: ~0.5 km/hr or slower (nearly impassable)

> **Concept note:** The exponential function means slopes matter most in the 10–30° range. Gentle slopes slow you somewhat; steep slopes become barriers.

## Getting Ready

- Google Earth Engine account (free at https://earthengine.google.com)
- A screenshot tool for capturing results

## Understanding the Model

### The Three Core Steps

The script performs three main calculations:

1. **Calculate slope** from elevation data
2. **Apply Tobler's formula** to convert slope into walking speed
3. **Use cumulative cost** to calculate travel time from a starting point

### Detailed Explanation of Each Calculation

#### Step 1: Understanding Slope

**What is slope?**

Slope measures how quickly elevation changes across the landscape. It's expressed in degrees:
- 0° = flat ground
- 10° = gentle uphill (you'd climb 1.76 m for every 10 m you walk forward)
- 30° = steep (you'd climb 5.77 m for every 10 m you walk forward)
- 45° = very steep (equal rise and run)
- >60° = nearly vertical cliffs

The script calculates slope automatically from the DEM using the built-in GEE function:

```javascript
var slope = ee.Terrain.slope(elevation);
```

**Why slope matters for movement:**

Slope directly affects walking speed. Flat ground is fast; steep ground is slow. The steeper the slope, the more physical effort is required. Tobler's function captures this relationship empirically.

---

#### Step 2: Tobler's Hiker Function (The Core Formula)

**The formula:**

```
Walking Speed (km/h) = 6 × exp(-3.5 × |tan(slope_radians) + 0.05|)
```

**Breaking down each component:**

**`6 km/h`** - This is the **maximum walking speed**, achieved on flat ground (0° slope). It represents a realistic walking pace accounting for environmental friction.

**`tan(slope)`** - This converts the slope angle into a **steepness measure**:
- At 0°: tan(0) = 0 (no steepness)
- At 10°: tan(10°) ≈ 0.176 (mild steepness)
- At 30°: tan(30°) ≈ 0.577 (significant steepness)
- At 45°: tan(45°) = 1.0 (maximum typical steepness)

The tangent function amplifies the effect of steeper slopes, so small angle increases at steep angles create large steepness changes.

**`+ 0.05`** - This is a **baseline resistance term**. Even on perfectly flat ground (slope = 0), there is environmental friction from vegetation, soil, surface irregularities, etc. The +0.05 ensures that even flat ground isn't infinitely fast.

**`| |` (absolute value)** - The formula treats uphill and downhill the same (symmetric). This is a simplification: in reality, going downhill can be faster but also more dangerous. For modeling purposes, this symmetric assumption is reasonable.

**`× -3.5`** - This is the **exponential coefficient**. It controls how aggressively slope slows movement:
- The negative sign creates decay (steeper slopes = slower speed)
- The value 3.5 was empirically determined by Tobler from observations of actual hikers
- Higher coefficients would make steep slopes even more penalizing; lower coefficients would be more forgiving

**`exp()`** - The **exponential function** (e^x) creates **non-linear decay**. This is crucial:
- Small increases in slope (0° → 10°) cause modest speed decreases (6 km/hr → 3 km/hr)
- Large increases in slope (30° → 45°) cause dramatic speed decreases (0.5 km/hr → 0.1 km/hr)
- This non-linearity matches real human experience: gentle slopes slow you a bit, steep slopes slow you a lot

**Putting it together - Example calculations:**

At **0° slope (flat ground)**:
- tan(0°) + 0.05 = 0 + 0.05 = 0.05
- -3.5 × 0.05 = -0.175
- exp(-0.175) ≈ 0.839
- 6 × 0.839 ≈ **5.04 km/hr**

At **10° slope (gentle uphill)**:
- tan(10°) + 0.05 ≈ 0.176 + 0.05 = 0.226
- -3.5 × 0.226 = -0.791
- exp(-0.791) ≈ 0.453
- 6 × 0.453 ≈ **2.72 km/hr** (about half the flat speed)

At **30° slope (steep)**:
- tan(30°) + 0.05 ≈ 0.577 + 0.05 = 0.627
- -3.5 × 0.627 = -2.195
- exp(-2.195) ≈ 0.111
- 6 × 0.111 ≈ **0.67 km/hr** (9× slower than flat)

**Key insight:** The function shows that terrain isn't just an obstacle—it's a **friction layer** that fundamentally changes how distance is experienced. A 1 km walk on flat ground takes ~10 minutes; the same 1 km on a 30° slope takes ~90 minutes.

---

#### Step 3: Converting Speed to Travel Time Cost

**The concept:**

Each pixel in the DEM represents an area 90 meters × 90 meters. If we know the walking speed in km/hr, we can calculate how long it takes to cross one pixel.

**The calculation:**

```javascript
var toblerTime = ee.Image.constant(0.003).divide(speedDEM);
```

**What's happening:**

- `speedDEM`: For each pixel, the walking speed in km/hr (varies by slope)
- `0.003`: A scaling constant representing the time cost per pixel
- `divide()`: Invert the relationship—faster speeds = lower cost, slower speeds = higher cost

**Why use 0.003?**

- SRTM pixels are 90 meters = 0.09 kilometers
- At a given speed, time to cross = distance / speed = 0.09 / speed
- But to keep the numbers computationally manageable, the script uses 0.003 as a scaling factor
- This effectively compresses the raster to prevent overflow while maintaining relative cost differences

**Examples:**

- On flat ground (6 km/hr): cost = 0.003 / 6 ≈ 0.0005 hours per pixel (~1.8 seconds)
- On gentle slope (3 km/hr): cost = 0.003 / 3 ≈ 0.001 hours per pixel (~3.6 seconds)
- On steep terrain (0.67 km/hr): cost = 0.003 / 0.67 ≈ 0.0045 hours per pixel (~16.2 seconds)

**Key insight:** Steep pixels cost roughly **10× more time** to traverse than flat pixels. This cost difference accumulates across the landscape, creating barriers and corridors.

---

#### Step 4: Cumulative Cost Distance (The Least-Cost Path)

**The concept:**

Starting from an origin point, calculate the **total accumulated travel time** to reach every other pixel on the landscape. This creates a continuous cost surface where each pixel shows "how many hours from the origin?"

**The calculation:**

```javascript
var hrsFrom = toblerTime.cumulativeCost(originImage, 60000);
```

**What this does:**

1. Starts at the origin (cost = 0 hours)
2. Expands outward, following the **path of least resistance** (avoiding steep slopes where possible)
3. For each pixel, accumulates the travel-time cost from the origin
4. The `60000` parameter limits search to 60,000 pixels for computational efficiency

**Why it's called "least-cost path":**

The algorithm doesn't just go in straight lines. It intelligently navigates the landscape:
- It avoids steep slopes and ridges (high cost)
- It follows valleys and gentle slopes (low cost)
- It finds the fastest route to any destination

This is fundamentally different from Euclidean distance, which ignores terrain entirely.

**Output:**

A raster where each pixel value = total hours of walking time from origin to that pixel. For example:
- Nearby flat areas might be 0.5–2 hours away
- Distant valleys might be 10–15 hours away
- Steep ridges on the other side of a mountain might be 20+ hours away even if they're only 5 km away in straight-line distance

**Key insight:** Terrain **compresses** some directions (valleys become closer) and **expands** others (ridges become farther). Geographic space is anisotropic—not the same in all directions.

---

#### Step 5: Defining Reachable Areas (Isochrones)

**The concept:**

Once we have travel time to every pixel, we can ask: "What area can be reached in 1 day? 2 days? 3 days?"

**The calculation:**

```javascript
var daysWalk = 12;  // Hours per day of walking
var onedayWalk = hrsFrom.lt(daysWalk);        // True where hours < 12
var twodayWalk = hrsFrom.lt(daysWalk * 2);    // True where hours < 24
var threedayWalk = hrsFrom.lt(daysWalk * 3);  // True where hours < 36
```

**What's happening:**

- `.lt()` = "less than" operator: returns 1 (true) or 0 (false)
- For each pixel, check if travel time is less than the threshold
- Creates binary rasters: 1 = reachable, 0 = not reachable

**The assumption:**

`daysWalk = 12` hours means a traveler walks 12 hours per day, leaving 12 hours for rest, meals, sleep, camp setup, etc. This is a reasonable assumption for sustained travel, though it can be adjusted.

**Output:**

Three maps showing **isochrones** (lines of equal travel time):
- 1-day zone: reachable within 12 hours
- 2-day zone: reachable within 24 hours
- 3-day zone: reachable within 36 hours

**Key insight:** The shape of these zones reveals terrain's asymmetric effect:
- Zones are **wider** in directions with gentler terrain (valleys)
- Zones are **narrower** in directions with steep terrain (ridges)
- Terrain stretches and compresses geographic space non-uniformly

---

### Comparing Terrain vs. Flat Ground

**Why the comparison?**

The script calculates both:

```javascript
var hrsFrom = toblerTime.cumulativeCost(originImage, 60000);   // On actual terrain
var hrsFlat = flatTime.cumulativeCost(originImage, 60000);     // On flat ground
```

**What it shows:**

- **Flat (green zone)**: How far you could go with equal time if terrain didn't matter. This is roughly circular because there's no directional advantage.
- **Terrain (red zone)**: How far you can actually go accounting for slope friction. This is irregular, following the natural corridors and barriers.

**The difference reveals:**

- **Where terrain helps**: Valleys show as **wider** on the terrain map than the flat map—the valley corridor lets you travel farther in the same time
- **Where terrain hinders**: Ridges show as **narrower** on the terrain map—the steep slopes severely limit reachable area
- **Amplification factor**: By comparing the two, you can quantify how much terrain constrains movement in each direction

---

## How the Model Works

```javascript
// ============================================================================
// SETUP: Define the data and visualization parameters
// ============================================================================

var dataset = ee.Image("CGIAR/SRTM90_V4");  // Load SRTM 90-meter global DEM
var elevation = dataset.select('elevation');  // Extract elevation band

// Define starting point (you can edit this point interactively in GEE)
var origin = ee.FeatureCollection([
  ee.Feature(
    ee.Geometry.Point([-119.58, 37.74]),  // Longitude, Latitude
    {"name": "start"}
  )
]);

// Define color schemes for visualization
var slopevis = {"min": 0, "max": 60, "palette": ["green", "yellow", "red"]};
var kmhrVisParam = {"opacity": 1, "bands": ["slope"], "min": 0.22, "max": 5.04, "palette": ["060606", "ffffff"]};
var hrppVisParam = {"opacity": 1, "bands": ["constant"], "min": 0.0006, "max": 0.0047, "palette": ["10b306", "fbff00", "ff1f08"]};

// ============================================================================
// STEP 1: Calculate slope in degrees
// ============================================================================

var slope = ee.Terrain.slope(elevation);  // Built-in GEE function: returns slope in degrees

// Create a flat slope image for comparison (all pixels = 0 degrees)
var flatSlope = ee.Image.constant(0);

// ============================================================================
// STEP 2: Implement Tobler's Hiker Function
// ============================================================================

// Define a function that takes slope (in degrees) and returns walking speed (in km/hr)
// Formula: Speed = 6 * exp(-3.5 * |tan(slope_radians) + 0.05|)
var toblerSpeed = function(slopeImage) {
  // Convert degrees to radians (JavaScript trig functions use radians)
  var radians = slopeImage.multiply(3.14159).divide(180.0);
  
  // Calculate walking speed: 6 * exp(-3.5 * |tan(slope) + 0.05|)
  var speed = radians
    .tan()                    // Convert slope angle to steepness measure (tangent)
    .add(0.05)                // Add baseline friction (even flat ground has some resistance)
    .abs()                    // Use absolute value (treat uphill and downhill the same)
    .multiply(-3.5)           // Apply the exponential coefficient (-3.5)
    .exp()                    // Apply exponential: e^(-3.5*...)
    .multiply(6.0);           // Scale to max speed of 6 km/hr on flat ground
  
  return speed;
};

// Apply Tobler's function to both terrain and flat slope
var speedDEM = toblerSpeed(slope);      // Speed for actual terrain (varies by slope)
var speedFlat = toblerSpeed(flatSlope);  // Speed for flat ground (always 6 km/hr)

// ============================================================================
// STEP 3: Convert speed to travel time cost
// ============================================================================

// Each SRTM pixel is 90m x 90m. At a given speed (km/hr), calculate hours to cross one pixel.
// Formula: time = pixel_size_km / speed_kmhr
// For 0.09 km pixels, we use 0.003 as a constant (0.09 / 30 pixel buffer = 0.003)

var toblerTime = ee.Image.constant(0.003).divide(speedDEM);  // Hours per pixel for terrain
var flatTime = ee.Image.constant(0.003).divide(speedFlat);    // Hours per pixel for flat

// ============================================================================
// STEP 4: Calculate cumulative travel time from origin
// ============================================================================

// Convert origin point to a raster image (required input for cumulativeCost)
var originImage = origin.reduceToImage({
  properties: ['name'],
  reducer: ee.Reducer.first()
});

// cumulativeCost: Starting from origin, accumulate travel time across the landscape
// The second parameter (60000) limits search to 60,000 pixels for performance
var hrsFrom = toblerTime.cumulativeCost(originImage, 60000);      // Hours from origin on terrain
var hrsFlat = flatTime.cumulativeCost(originImage, 60000);        // Hours from origin on flat

// ============================================================================
// STEP 5: Define reachable areas by walking days
// ============================================================================

// Define how many hours of walking per day (adjust as needed)
var daysWalk = 12;  // 12 hours of walking per day (leaves 12 hours for rest/sleep/meals)

// Create binary layers: 1 if reachable within N days, 0 otherwise
var onedayWalk = hrsFrom.lt(daysWalk);            // True (1) where hours < 12
var twodayWalk = hrsFrom.lt(daysWalk * 2);        // True (1) where hours < 24
var threedayWalk = hrsFrom.lt(daysWalk * 3);      // True (1) where hours < 36
var threedayFlat = hrsFlat.lt(daysWalk * 3);      // Same, but for flat terrain

// ============================================================================
// STEP 6: Visualize the results
// ============================================================================

// Add intermediate analysis layers (hidden by default, toggled in Layers panel)
Map.addLayer(slope, slopevis, 'Slope (degrees)', 0);
Map.addLayer(speedDEM, kmhrVisParam, 'Walking Speed (km/hr)', 0);
Map.addLayer(toblerTime, hrppVisParam, 'Travel Time (hours per pixel)', 0);

// Add reachable areas with transparency (order matters: drawn from back to front)
Map.addLayer(threedayFlat.updateMask(threedayFlat), 
  {min: 0, max: 1, palette: ['green']}, 
  '3 days on Flat', 1, 0.5);

Map.addLayer(threedayWalk.updateMask(threedayWalk), 
  {min: 0, max: 1, palette: ['red']}, 
  '3 days on Terrain', 1, 0.5);

Map.addLayer(twodayWalk.updateMask(twodayWalk), 
  {min: 0, max: 1, palette: ['orange']}, 
  '2 days on Terrain', 1, 0.5);

Map.addLayer(onedayWalk.updateMask(onedayWalk), 
  {min: 0, max: 1, palette: ['yellow']}, 
  '1 day on Terrain', 1, 0.5);

// ============================================================================
// STEP 7: Setup map and print bounds
// ============================================================================

Map.setOptions('TERRAIN');  // Use terrain basemap for better topographic context
Map.centerObject(origin, 9);  // Center on origin point, zoom level 9

// Print map bounds for export purposes
var mapBounds = Map.getBounds({asGeoJSON: true});
print('Map bounds:', mapBounds);

// ============================================================================
// STEP 8: Optional - Create combined dataset for export
// ============================================================================

// Combine all walking-time zones into a single raster for export
var walkingTimesDataset = ee.Image.constant(5)
  .subtract(threedayFlat.add(threedayWalk).add(twodayWalk).add(onedayWalk))
  .abs();

Map.addLayer(walkingTimesDataset, {min: 0, max: 5}, 'Export Dataset', 0);

// ============================================================================
// OPTIONAL EXPORT (uncomment to use):
// ============================================================================
/*
Export.image.toDrive({
  image: walkingTimesDataset,
  description: 'walkingTimeZones',
  fileNamePrefix: 'ToblerWalkingTimeZones',
  region: mapBounds,
  scale: 150  // 150m resolution
});
*/
```

## Part 1: Run the Model

1. Go to [Google Earth Engine Code Editor](https://code.earthengine.google.com/)
2. Paste the complete script from the section below (or copy from your instructor)
3. Click **Run**

**Expected output**: 
- Green zone = reachable in 3 days on flat ground
- Red, orange, yellow zones = reachable in 3, 2, 1 days on terrain

Notice how terrain constrains reachability. Valleys allow wider zones; ridges constrain them.

## Part 2: Modify Parameters

### Change the Origin Point

1. In the **Geometry Imports** panel (left), find `origin`
2. Click on the current point to delete it
3. Hover over `origin` until a crosshair appears
4. Click on a new location
5. Click **Exit**
6. Run the script again

**Try**:
- A mountain pass (creates a corridor)
- A ridge crest (very constrained reachability)
- A valley bottom (wide reachable area)

Take screenshots of each and note how the zones change shape.

### Change Daily Walking Hours

Find this line in the script:
```javascript
var daysWalk = 12;  // Change this number
```

Try:
- `10` hours/day (slower travel)
- `14` hours/day (faster travel)
- `16` hours/day (forced march)

Run the script and observe how the reachable zones expand or contract. Take a screenshot for at least one different value.

## Part 3: Analyze Results

Compare your maps and note:

1. **How does terrain distort geographic space?** Where are valleys (corridors) and ridges (barriers)?

2. **What's the largest difference between terrain and flat zones?** In which direction is terrain the biggest barrier?

3. **Why might this matter?** Historical trade routes, settlement locations, animal migration, etc.

## Complete Script (Ready to Paste)

Copy and paste this entire script into Google Earth Engine:

```javascript
// ============================================================================
// TOBLER'S HIKER FUNCTION: Movement Modeling in Google Earth Engine
// ============================================================================
// This script models how terrain constrains geographic space by calculating
// travel time using Tobler's empirically-derived hiking speed function.
// ============================================================================

// ============================================================================
// SETUP: Load data and define visualization parameters
// ============================================================================

var dataset = ee.Image("CGIAR/SRTM90_V4");  // Load global 90m SRTM DEM
var elevation = dataset.select('elevation');  // Extract elevation band

// Define starting point for movement model (you can edit this point in GEE UI)
var origin = ee.FeatureCollection([
  ee.Feature(
    ee.Geometry.Point([-119.58, 37.74]),  // Longitude, Latitude (Sierra Nevada example)
    {"name": "start"}
  )
]);

// Define color schemes for visualizing different layers
var slopevis = {"min": 0, "max": 60, "palette": ["green", "yellow", "red"]};
var kmhrVisParam = {"opacity": 1, "bands": ["slope"], "min": 0.22, "max": 5.04, "palette": ["060606", "ffffff"]};
var hrppVisParam = {"opacity": 1, "bands": ["constant"], "min": 0.0006, "max": 0.0047, "palette": ["10b306", "fbff00", "ff1f08"]};

// ============================================================================
// CALCULATE SLOPE
// ============================================================================

// Calculate slope in degrees at each pixel
var slope = ee.Terrain.slope(elevation);

// Create a flat slope image (all zeros) to compare against terrain
var flatSlope = ee.Image.constant(0);

// ============================================================================
// IMPLEMENT TOBLER'S HIKER FUNCTION
// ============================================================================

// Formula: Speed (km/h) = 6 * exp(-3.5 * |tan(slope_radians) + 0.05|)
// This empirical function relates slope to walking speed based on observations.

var toblerSpeed = function(slopeImage) {
  // Step 1: Convert slope from degrees to radians (required for trig functions)
  var radians = slopeImage.multiply(3.14159).divide(180.0);
  
  // Step 2: Apply Tobler's formula
  // tan(slope) = steepness measure. Higher = steeper.
  // +0.05 = baseline friction (environmental resistance)
  // abs() = treat uphill and downhill the same
  // *-3.5 and exp() = exponential decay: steep slopes dramatically slow movement
  // *6.0 = scale to 6 km/hr max speed on flat ground
  var speed = radians
    .tan()                // Steepness measure
    .add(0.05)            // Baseline friction
    .abs()                // Absolute value (uphill = downhill)
    .multiply(-3.5)       // Exponential coefficient
    .exp()                // Apply exponential function
    .multiply(6.0);       // Scale to max speed
  
  return speed;
};

// Apply Tobler's function to terrain and flat slope
var speedDEM = toblerSpeed(slope);      // Speed varies by slope
var speedFlat = toblerSpeed(flatSlope);  // Speed is constant (6 km/hr) on flat

// ============================================================================
// CONVERT SPEED TO TRAVEL TIME COST
// ============================================================================

// Each SRTM pixel is 90m x 90m. Calculate hours needed to cross each pixel.
// time = distance / speed. We use 0.003 as a scaling constant for the pixel size.
// Faster pixels cost less time; slower pixels cost more time.

var toblerTime = ee.Image.constant(0.003).divide(speedDEM);  // Hours per pixel on terrain
var flatTime = ee.Image.constant(0.003).divide(speedFlat);    // Hours per pixel on flat

// ============================================================================
// CALCULATE CUMULATIVE TRAVEL TIME FROM ORIGIN
// ============================================================================

// Convert origin point to raster (required input for cumulativeCost function)
var originImage = origin.reduceToImage({
  properties: ['name'],
  reducer: ee.Reducer.first()
});

// cumulativeCost: Starting at origin (0 hours), accumulate travel time across landscape.
// Returns a raster where each pixel shows total hours needed to reach it from origin.
// Second parameter (60000) limits search to 60,000 pixels for computational efficiency.
var hrsFrom = toblerTime.cumulativeCost(originImage, 60000);  // Hours from origin on terrain
var hrsFlat = flatTime.cumulativeCost(originImage, 60000);    // Hours from origin on flat

// ============================================================================
// DEFINE REACHABLE AREAS BY TRAVEL TIME
// ============================================================================

// Define daily walking budget (hours of walking per day)
// 12 hours = reasonable day's walk (leaves time for rest, meals, sleep)
// Adjust this value to model different travel intensities
var daysWalk = 12;

// Create binary layers showing what's reachable within each time threshold
// lt() = "less than": returns 1 if true, 0 if false
var onedayWalk = hrsFrom.lt(daysWalk);            // Reachable within 12 hours
var twodayWalk = hrsFrom.lt(daysWalk * 2);        // Reachable within 24 hours
var threedayWalk = hrsFrom.lt(daysWalk * 3);      // Reachable within 36 hours
var threedayFlat = hrsFlat.lt(daysWalk * 3);      // Same for flat terrain

// ============================================================================
// ADD LAYERS TO MAP
// ============================================================================

// Add intermediate analysis layers (hidden by default, toggled on via Layers panel)
Map.addLayer(slope, slopevis, 'Slope (degrees)', 0);
Map.addLayer(speedDEM, kmhrVisParam, 'Walking Speed (km/hr)', 0);
Map.addLayer(toblerTime, hrppVisParam, 'Travel Time (hours per pixel)', 0);

// Add main walking-time zones with transparency
// Order in code = order rendered (bottom to top)
// updateMask: shows only pixels where value = 1 (reachable)

Map.addLayer(
  threedayFlat.updateMask(threedayFlat), 
  {min: 0, max: 1, palette: ['green']}, 
  '3 days on Flat', 1, 0.5
);

Map.addLayer(
  threedayWalk.updateMask(threedayWalk), 
  {min: 0, max: 1, palette: ['red']}, 
  '3 days on Terrain', 1, 0.5
);

Map.addLayer(
  twodayWalk.updateMask(twodayWalk), 
  {min: 0, max: 1, palette: ['orange']}, 
  '2 days on Terrain', 1, 0.5
);

Map.addLayer(
  onedayWalk.updateMask(onedayWalk), 
  {min: 0, max: 1, palette: ['yellow']}, 
  '1 day on Terrain', 1, 0.5
);

// ============================================================================
// SETUP MAP VIEW
// ============================================================================

// Set basemap to TERRAIN for better topographic context
Map.setOptions('TERRAIN');

// Center map on origin point at zoom level 9
Map.centerObject(origin, 9);

// Print map bounds for reference
var mapBounds = Map.getBounds({asGeoJSON: true});
print('Map bounds for export:', mapBounds);

// ============================================================================
// OPTIONAL: EXPORT DATA TO GOOGLE DRIVE
// ============================================================================

// Uncomment the code below if you want to download the walking-time zones
// as a GeoTIFF file to use in QGIS or other software

/*
var walkingTimesDataset = ee.Image.constant(5)
  .subtract(threedayFlat.add(threedayWalk).add(twodayWalk).add(onedayWalk))
  .abs();

Export.image.toDrive({
  image: walkingTimesDataset,
  description: 'walkingTimeZones',
  fileNamePrefix: 'ToblerWalkingTimeZones',
  region: mapBounds,
  scale: 150  // 150m resolution
});
*/
```

## Deliverable

Create a PDF document with:

1. **3 screenshots** showing:
   - Full model view (terrain + flat comparison)
   - At least one zoomed view showing interesting terrain features (pass, ridge, valley)
   - At least one modified parameter run (different origin or daysWalk value)

2. **Annotations** on your screenshots identifying:
   - Valleys (corridors where movement is easy)
   - Ridges (barriers where movement is constrained)
   - How terrain distorts geographic space compared to flat-ground model

3. **1-paragraph reflection** addressing:
   - How does terrain distort geographic space from your starting point?
   - Where is movement most and least constrained?
   - Why might this matter for understanding real-world phenomena (trade, settlement, migration)?

## Reference

- Tobler, W. (1993). "Three Presentations on Geographical Analysis and Modeling."
- https://en.wikipedia.org/wiki/Tobler%27s_hiking_function
