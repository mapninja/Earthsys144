# Lab 02: Area Statistics and Spatial Autocorrelation

## Spatial Question

Do neighboring counties in Texas tend to have similar health outcome scores, or are high and low values scattered without a strong spatial pattern?

This lab introduces spatial statistics for areal data. Areal data are values attached to polygons, such as counties, census tracts, watersheds, or school districts.

## Suggested Dataset

Use `data/TexasHealthByCounty.csv`.

This table includes:

- `FIPS`: county identifier.
- `State`: state name.
- `County`: county name.
- `OUTZScore`: health outcome z-score.
- `OUTRank`: health outcome rank.
- `FACTZScore`: health factor z-score.
- `FACTRank`: health factor rank.

Students will need a Texas county boundary layer. Recommended options:

- Use a Census TIGER/Line county boundary layer downloaded before class.
- Use a pre-prepared county shapefile added to `data/` if the instructor wants a fully offline lab.
- Use a `geodatasets` or `cenpy` workflow only if internet access is available and reliable.

Dataset origin: The CSV appears to be a prepared county-level health table for Texas. The boundary layer should come from the U.S. Census Bureau TIGER/Line counties dataset.

## Concepts from the Readings

- Unwin's "Areas on Maps": polygon values are not the same as point events; boundaries and aggregation shape the pattern we see.
- Ebdon's spatial statistics chapter: spatial autocorrelation for areal data asks whether nearby areas have similar or dissimilar values.

## Tools

Recommended Python packages:

- `pandas` for the health table.
- `geopandas` for county polygons.
- `matplotlib` for mapping.
- `libpysal` for spatial weights.
- `esda` for Moran's I and local indicators of spatial association.
- `mapclassify` for choropleth classification.

## Workflow

### 1. Load and Join Data

Load the health CSV and county polygons.

Join them using county FIPS codes.

Important teaching points:

- A table join connects attributes to geometry through a shared key.
- FIPS codes should be treated as text, not ordinary numbers, because leading zeroes matter in many states.
- Always check for unmatched records after a join.

### 2. Create a Choropleth Map

Map `OUTZScore`.

Try at least two classification methods:

- Quantiles.
- Natural breaks or equal interval.

Why this matters:

- Choropleth maps can make the same data look more or less clustered depending on classification.
- A map is a visual model, not a neutral mirror.

Suggested visual placeholder:

![Placeholder: Side-by-side choropleth maps of Texas county health outcome z-scores using quantile and natural breaks classification, with the same color ramp and legends.](images/placeholder_texas_choropleth_classification_comparison.png)

### 3. Calculate Descriptive Statistics

Calculate:

- Mean.
- Median.
- Standard deviation.
- Minimum and maximum.
- Top 10 and bottom 10 counties by `OUTZScore`.

Why this matters:

- Descriptive statistics summarize the values but ignore where counties are.
- Spatial statistics add neighborhood structure to the same attribute values.

### 4. Build Spatial Weights

Create a queen contiguity weights matrix for counties.

Plain-language explanation:

- A spatial weights matrix is a formal definition of "nearby."
- Queen contiguity treats counties as neighbors if they touch at an edge or corner.
- Rook contiguity is stricter and only counts shared edges.

Student output:

- Report the number of counties with no neighbors, if any.
- Report the average number of neighbors per county.
- Map one selected county and its neighbors.

### 5. Calculate Global Moran's I

Calculate global Moran's I for `OUTZScore`.

Interpretation guide:

- Positive Moran's I: similar values tend to be near each other.
- Negative Moran's I: high values tend to be near low values.
- Near zero: no strong spatial autocorrelation under this weights definition.

Student output:

- Moran's I value.
- P-value or permutation result.
- A plain-language conclusion.

### 6. Calculate Local Clusters

Calculate local Moran statistics.

Map cluster types:

- High-high: high value county surrounded by high values.
- Low-low: low value county surrounded by low values.
- High-low: high value county surrounded by low values.
- Low-high: low value county surrounded by high values.
- Not significant.

Why this matters:

- Global Moran's I gives one summary for the whole map.
- Local clusters help identify where the pattern is strongest.

### 7. Compare Health Outcomes and Health Factors

Repeat the choropleth and global Moran's I for `FACTZScore`.

Student interpretation prompt:

- Are health outcomes and health factors spatially patterned in similar ways?
- What would you need to know before making a causal claim?

## Deliverables

Submit:

- A choropleth map of `OUTZScore`.
- A local cluster map.
- A short table with descriptive statistics and global Moran's I.
- A 250 to 400 word interpretation.

## Reflection Questions

- How did the definition of neighbor affect the result?
- Why are rates or z-scores usually better than raw counts for choropleth maps?
- What is one possible modifiable areal unit problem in this lab?
- What does spatial autocorrelation tell us that a histogram does not?
