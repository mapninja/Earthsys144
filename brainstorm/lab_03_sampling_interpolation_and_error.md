# Lab 03: Sampling, Interpolation, and Error

## Spatial Question

How well can we recreate a continuous elevation surface from a limited set of sample points?

This lab connects spatial sampling to surface interpolation. Students begin with a raster surface, sample it as if only some field measurements were available, interpolate from those samples, and compare the estimated surface to the original.

## Suggested Dataset

Use `data/L12.zip`, which is already referenced by the existing Week 6 sampling and interpolation lab.

Expected contents include a digital elevation model used for terrain sampling and interpolation exercises.

Dataset origin: This is a prepared course dataset for sampling and interpolation. The main surface is a digital elevation model, which represents elevation as raster cells.

## Concepts from the Readings

- Unwin's "Surfaces on Maps": surfaces represent values that vary continuously over space.
- Ebdon's "Samples and Sampling": sampling design affects what can be inferred from measured data.
- Ebdon's regression and residual discussion: model results should be checked against error, not just accepted because they look smooth.

## Tools

Recommended options:

- QGIS for a lower-code lab using existing processing tools.
- Python with `rasterio`, `geopandas`, `numpy`, `scipy`, and `matplotlib` for a notebook version.

## Workflow

### 1. Load the Elevation Raster

Open the DEM and inspect:

- Coordinate reference system.
- Cell size.
- Elevation units.
- Minimum and maximum elevation.
- Visual hillshade or terrain color ramp.

Important teaching points:

- A raster is a grid of cells.
- Each cell stores a value for a small area.
- A DEM is already an interpolated model of terrain, but we will treat it as the reference surface for learning.

Suggested visual placeholder:

![Placeholder: DEM map with terrain color ramp and semi-transparent hillshade, labeled with raster cell size and elevation range.](images/placeholder_dem_hillshade_surface.png)

### 2. Create Sample Points

Create three sample designs:

- Systematic grid sample.
- Random sample.
- Stratified sample with more points in high-relief terrain.

Why this matters:

- Sampling controls what parts of the surface the model can learn from.
- Random sampling helps avoid some forms of bias.
- Systematic sampling is easy to plan but can miss patterns that align with the grid.
- Stratified sampling intentionally gives more attention to important zones.

### 3. Extract Elevation Values

Extract raster values at each sample point.

Student checks:

- How many sample points were created?
- How many have valid elevation values?
- Do sampled values cover the full elevation range?

### 4. Interpolate Surfaces

Create interpolated elevation surfaces from the sample points.

Suggested methods:

- Inverse Distance Weighted interpolation.
- Nearest neighbor interpolation.
- Spline or radial basis function interpolation.

Plain-language comparison:

- Nearest neighbor assumes the closest sample controls each location.
- IDW assumes closer samples matter more, but several nearby samples can contribute.
- Spline assumes the surface changes smoothly.

### 5. Create Error Surfaces

Subtract the interpolated surface from the original DEM.

Interpretation:

- Positive error means the model estimated too low if using `original - interpolated`.
- Negative error means the model estimated too high.
- Large absolute errors show locations where the interpolation struggled.

Student output:

- Error map for each method.
- Mean error.
- Mean absolute error.
- Root mean square error.

### 6. Validate with Holdout Points

Create a separate set of random validation points.

Extract:

- Original DEM elevation.
- Interpolated elevation from each method.
- Difference between original and interpolated values.

Why this matters:

- Validation checks model performance at locations not used to build the model.
- A model can look good at sample points and still perform poorly between them.

### 7. Interpret Method Differences

Student interpretation prompt:

- Which method performed best by RMSE?
- Which method looked most realistic visually?
- Did the visual result and error statistics agree?
- Where did the interpolation fail, and why might terrain shape matter?

## Deliverables

Submit:

- One map showing the sample design.
- One interpolated surface map.
- One error map.
- A table comparing error metrics for at least two methods.
- A 250 to 400 word interpretation.

## Reflection Questions

- How did sampling design affect the interpolation?
- Why is interpolation more uncertain far from sample points?
- Why might a smooth-looking surface still be wrong?
- What real-world field sampling problem does this lab resemble?
