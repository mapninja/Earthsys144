# Lab 01: Point Pattern Description and Clustering

## Spatial Question

Are cholera deaths in the John Snow dataset clustered around particular water pumps, or are they spread evenly across the study area?

This lab introduces the point-pattern side of spatial statistics. A point pattern is a collection of mapped events: trees, stores, crimes, disease cases, sensors, or sampling sites. We will treat each point as an event location and ask how the locations are arranged.

## Suggested Dataset

Use `data/Being_John_Snow.zip`.

Relevant contents:

- `deathAddresses.csv`: cholera death locations or address-derived death records.
- `Water_Pumps.geojson`: mapped water pump locations.
- `Study_Area.shp`: boundary for the local study area.
- `John_Snow_Map.tif`: historical map image for context.

Dataset origin: This is a teaching dataset based on John Snow's 1854 Soho cholera investigation. It is useful because the story is historically familiar and the spatial question is intuitive: are deaths spatially related to water access?

## Concepts from the Readings

- Unwin's "Points on Maps": point maps can be described by their center, spread, density, and pattern.
- Ebdon's spatial statistics chapter: mean center, standard distance, standard deviational ellipse, and nearest neighbor analysis summarize different properties of a point pattern.

## Tools

Recommended Python packages:

- `pandas` for reading tabular data.
- `geopandas` for spatial vector data.
- `matplotlib` for plotting maps.
- `shapely` for geometric operations.
- `pointpats` or `scipy.spatial` for nearest-neighbor distances.
- `contextily` only if students use a modern basemap after projecting to Web Mercator.

## Workflow

### 1. Prepare the Workspace

Students unzip the dataset into a working folder, then load the study area, deaths, and pumps.

Important teaching points:

- A CSV is only a table until it has coordinates or can be joined to geometry.
- A coordinate reference system tells the software what the coordinate numbers mean.
- Distance calculations should be done in a projected coordinate system with linear units, such as meters or feet.

### 2. Map the Raw Points

Create a map with:

- Study area boundary.
- Death locations.
- Water pump locations.
- Historical map image as optional context.

Student interpretation prompt:

- Before calculating anything, where do deaths appear most concentrated?
- What might your eye be overemphasizing?

Suggested visual placeholder:

![Placeholder: Map of John Snow cholera deaths and water pumps over the Soho study area, with deaths as small dark points and pumps as larger labeled symbols.](images/placeholder_john_snow_points_and_pumps.png)

### 3. Calculate Mean Center

Calculate the average x coordinate and average y coordinate for death locations.

Why this matters:

- The mean center gives a single summary location for the point pattern.
- It is not the "cause" of the pattern. It is a descriptive center, similar to an average value in ordinary statistics.

Student output:

- A map showing deaths, pumps, and the mean center.
- A sentence explaining whether the mean center falls near a pump, street, or empty part of the map.

### 4. Calculate Standard Distance

Calculate the average spread of points around the mean center.

Why this matters:

- Standard distance is the spatial version of standard deviation.
- It helps students describe whether a point pattern is compact or spread out.

Student output:

- A circle centered on the mean center with radius equal to the standard distance.
- A caption explaining what the circle does and does not mean.

### 5. Calculate Standard Deviational Ellipse

Calculate an ellipse that summarizes directional spread.

Why this matters:

- A circle assumes spread is equal in all directions.
- An ellipse shows whether the pattern stretches along a street, valley, coastline, or other directional structure.

Student output:

- A map with deaths, mean center, and standard deviational ellipse.
- A note on whether the ellipse direction appears meaningful in the local street pattern.

### 6. Nearest Neighbor Distances

Calculate the distance from each death point to its nearest death point.

Then calculate the distance from each death point to its nearest pump.

Why this matters:

- Nearest-neighbor statistics ask whether events are unusually close to each other.
- Comparing death-to-death distances and death-to-pump distances helps connect pattern description to a geographic hypothesis.

Student output:

- A histogram of death-to-nearest-death distances.
- A histogram of death-to-nearest-pump distances.
- A short interpretation of whether deaths appear spatially concentrated near one pump.

### 7. Optional Density Surface

Create a kernel density estimate of death locations.

Why this matters:

- A density surface turns points into a continuous field.
- It is easier to see hot spots, but the result depends heavily on bandwidth.

Student output:

- Two density maps with different bandwidths.
- A comparison paragraph explaining how the bandwidth changed the story.

## Deliverables

Submit:

- One map showing mean center and standard distance.
- One map showing standard deviational ellipse.
- One nearest-neighbor histogram or table.
- A 250 to 400 word interpretation answering the spatial question.

## Reflection Questions

- What statistic best summarized the cholera death pattern?
- What statistic was easiest to misinterpret?
- How would the analysis change if deaths were weighted by number of deaths at the same address?
- What assumptions are involved when we infer a disease process from mapped death locations?
