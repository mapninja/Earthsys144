# Lab 04: Spatial Relationships and Residual Mapping

## Spatial Question

Where do simple statistical relationships explain a mapped outcome well, and where do they leave spatially organized errors?

This lab introduces spatial relationship modeling for beginners. Students fit a simple relationship, map the residuals, and ask whether the model missed something geographic.

## Suggested Dataset

Primary option: `data/TexasHealthByCounty.csv` joined to Texas county boundaries.

Use:

- `OUTZScore` as the outcome variable.
- `FACTZScore` as the explanatory variable.

Alternative option:

- Use `data/Santa_Clara_Pop_2025.zip` with a local attribute suitable for rates or density, if the instructor wants a Bay Area example.

Dataset origin: The Texas health CSV is a prepared county-level table. County geometries should come from U.S. Census TIGER/Line county boundaries.

## Concepts from the Readings

- Ebdon's "Relationships" and "Trends": correlation and regression describe associations and prediction, but rely on assumptions.
- Ebdon's discussion of residuals: residuals show what a model did not explain.
- Unwin's "Map Comparison": comparing maps numerically and visually can reveal where patterns agree and disagree.

## Tools

Recommended Python packages:

- `pandas` for tables.
- `geopandas` for polygons.
- `matplotlib` for maps and scatterplots.
- `scikit-learn` or `statsmodels` for simple regression.
- `libpysal` and `esda` for spatial autocorrelation of residuals.

## Workflow

### 1. Load and Join Data

Load the health table and county boundary layer.

Join by FIPS code.

Check:

- Number of counties before and after join.
- Missing values in `OUTZScore` and `FACTZScore`.
- Coordinate reference system.

### 2. Compare Two Maps

Create two choropleth maps:

- Health outcomes: `OUTZScore`.
- Health factors: `FACTZScore`.

Why this matters:

- Visual comparison is the first step.
- Students should notice that two maps can look related without being identical.

Suggested visual placeholder:

![Placeholder: Two aligned Texas county choropleth maps, one for health outcomes and one for health factors, using comparable diverging color ramps.](images/placeholder_texas_two_map_comparison.png)

### 3. Create a Scatterplot

Plot `FACTZScore` on the x-axis and `OUTZScore` on the y-axis.

Add a fitted regression line.

Plain-language interpretation:

- Each dot is a county.
- The line summarizes the average relationship.
- Dots far from the line are counties where the relationship does not predict well.

### 4. Fit a Simple Regression

Fit a model:

`OUTZScore = intercept + slope * FACTZScore`

Student output:

- Intercept.
- Slope.
- R-squared.
- Plain-language explanation of the slope.

Important caution:

- Regression describes association. It does not prove that one variable causes the other.
- County-level relationships do not automatically describe individual people.

### 5. Calculate Residuals

Calculate:

`residual = observed OUTZScore - predicted OUTZScore`

Interpretation:

- Positive residual: outcome score is higher than predicted.
- Negative residual: outcome score is lower than predicted.
- Near-zero residual: model prediction is close to observed value.

### 6. Map Residuals

Create a residual choropleth map.

Why this matters:

- Residual maps show geography left unexplained by the model.
- Spatially clustered residuals suggest the model may be missing regional processes, omitted variables, or spatial dependence.

### 7. Test Residual Spatial Autocorrelation

Build a spatial weights matrix and calculate Moran's I for the residuals.

Student interpretation guide:

- If residuals are spatially autocorrelated, the model errors are geographically patterned.
- If residuals are not spatially autocorrelated, the model may have captured much of the broad spatial structure, though it can still be incomplete.

### 8. Identify Follow-Up Variables

Students propose two additional variables that might help explain residual patterns.

Examples:

- Rurality or urbanization.
- Income.
- Age structure.
- Access to clinics.
- Environmental exposure.
- Insurance coverage.

## Deliverables

Submit:

- Two comparison choropleth maps.
- One scatterplot with regression line.
- One residual map.
- A short table with slope, R-squared, and Moran's I of residuals.
- A 250 to 400 word interpretation.

## Reflection Questions

- What did the regression explain well?
- Where did the residual map show possible missing geography?
- Why is residual spatial autocorrelation a warning sign?
- What would you need before making a policy recommendation from this model?
