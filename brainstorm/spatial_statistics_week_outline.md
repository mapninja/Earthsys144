# Brainstorm: One Week Spatial Statistics Module

## Purpose

This week introduces spatial statistics as a way to move from "what does the map look like?" to "what evidence do we have for a spatial pattern, relationship, or process?"

The suggested framing comes from two texts in `docs/ignore/`:

- David Unwin, *Introductory Spatial Analysis*. Unwin organizes spatial analysis around the kinds of things maps represent: points, lines, areas, surfaces, and map comparisons. That structure is helpful for beginning GIS students because it connects statistical ideas to visible map objects.
- David Ebdon, *Statistics in Geography*. Ebdon provides a gentle statistical sequence: description, samples and sampling, comparisons, relationships, trends, and spatial statistics. His spatial statistics chapter includes point pattern centers and dispersion, standard deviational ellipses, nearest neighbor analysis, join counts, and spatial autocorrelation.

The week should make one repeated point: spatial statistics are not magic map buttons. They are structured ways of asking whether a mapped pattern is more clustered, dispersed, related, or unequal than we would expect under a reasonable comparison model.

## Student Audience

Assume students have used QGIS, Google Earth Engine, and introductory Python notebooks, but are still beginners in programming, spatial reasoning, and statistical inference.

The week should therefore:

- Begin every method with a plain-language question.
- Use visual maps before formulas.
- Treat uncertainty and assumptions as part of the workflow, not as an afterthought.
- Emphasize interpretation in geographic language.
- Avoid requiring students to derive equations by hand.

## Suggested Learning Outcomes

By the end of the week, students should be able to:

- Distinguish spatial description from spatial inference.
- Explain why location changes the interpretation of ordinary statistics.
- Calculate and interpret mean center, standard distance, standard deviational ellipse, nearest neighbor distance, and basic kernel density for point data.
- Explain why area-based statistics can change when boundaries or aggregation units change.
- Build and interpret a simple spatial weights matrix for neighboring polygons.
- Calculate and map a spatial autocorrelation statistic, such as Moran's I or local clusters.
- Compare sampled and interpolated surfaces and explain why interpolation requires assumptions about spatial continuity.
- Write a short interpretation that connects statistical output to mapped evidence and methodological limits.

## Conceptual Arc

### Day 1: From Maps to Spatial Questions

Core question: When we see a mapped pattern, what are we actually claiming?

Topics:

- Maps as models, following Unwin's emphasis that maps simplify geographic reality.
- Types of mapped objects: points, lines, areas, surfaces.
- Statistical concepts from Ebdon: description, sample, population, probability, significance, and null hypothesis.
- Why "nearby things" can make ordinary statistics misleading.

Suggested in-class demonstration:

- Show one point map, one choropleth map, and one raster surface.
- Ask students to write one descriptive statement and one inferential question for each.
- Translate those questions into possible spatial statistics.

Suggested visual placeholder:

![Placeholder: A four-panel teaching graphic comparing a point map, line network, choropleth area map, and raster surface, with one plain-language statistical question attached to each panel.](images/placeholder_spatial_statistics_map_types.png)

### Day 2: Point Patterns

Core question: Are events clustered, dispersed, or randomly arranged?

Topics:

- Point locations as spatial events.
- Mean center, weighted mean center, standard distance, and standard deviational ellipse.
- Quadrats and density surfaces.
- Nearest neighbor analysis and the idea of complete spatial randomness.
- Difference between a mapped cluster and a statistically meaningful cluster.

Associated lab:

- [Lab 01: Point Pattern Description and Clustering](lab_01_point_pattern_description_and_clustering.md)

### Day 3: Areas, Rates, and Spatial Autocorrelation

Core question: Do neighboring places tend to have similar values?

Topics:

- Area data and the modifiable areal unit problem.
- Counts versus rates.
- Choropleth classification and visual inference.
- Spatial weights: adjacency, distance, and why the definition of "neighbor" matters.
- Global and local spatial autocorrelation.

Associated lab:

- [Lab 02: Area Statistics and Spatial Autocorrelation](lab_02_area_statistics_and_spatial_autocorrelation.md)

### Day 4: Surfaces, Samples, and Interpolation

Core question: How do we estimate values between measured locations?

Topics:

- Surfaces on maps, following Unwin's distinction between discrete objects and continuous fields.
- Sampling design: systematic, random, and stratified samples.
- Interpolation as a model of spatial continuity.
- IDW, nearest neighbor, and spline as different assumptions about distance and smoothness.
- Error surfaces and validation points.

Associated lab:

- [Lab 03: Sampling, Interpolation, and Error](lab_03_sampling_interpolation_and_error.md)

### Day 5: Spatial Relationships and Model Interpretation

Core question: How do we test relationships when location is part of the relationship?

Topics:

- Correlation and regression from Ebdon: useful but assumption-bound.
- Residuals as evidence of what a model did not explain.
- Spatial autocorrelation in residuals.
- Difference maps and map comparison from Unwin.
- Ethical interpretation: statistical association is not causation.

Associated lab:

- [Lab 04: Spatial Relationships and Residual Mapping](lab_04_spatial_relationships_and_residual_mapping.md)

## Suggested Assignment Structure

Students complete one lab during class and choose two of the remaining three to turn in. The fourth can be used as an optional extension or project seed.

Each submitted lab should include:

- A map or screenshot of the main spatial output.
- A short table of calculated statistics.
- A written interpretation of 250 to 400 words.
- A brief note on assumptions and limitations.

## Possible Reading Pairings

Use short excerpts rather than assigning whole chapters.

- For Day 1: Unwin, "Maps and Models" and "A Typology of Maps"; Ebdon, "Statistical Concepts".
- For Day 2: Unwin, "Points on Maps"; Ebdon, "Spatial Statistics", especially mean center, standard distance, standard deviational ellipse, and nearest neighbor analysis.
- For Day 3: Unwin, "Areas on Maps" and "Map Comparison"; Ebdon, "Spatial Statistics", especially join counts and spatial autocorrelation for areal data.
- For Day 4: Unwin, "Surfaces on Maps"; Ebdon, "Samples and Sampling" and regression/residual discussion as background for model validation.
- For Day 5: Ebdon, "Relationships" and "Trends"; Unwin, "Map Comparison".

## Assessment Ideas

Use a simple rubric:

- Method choice: Student selected a statistic that matches the spatial question.
- Workflow: Student used appropriate data preparation, projection, and units.
- Interpretation: Student explained the output in geographic terms.
- Uncertainty: Student identified assumptions, edge effects, aggregation issues, or sampling limitations.
- Communication: Student included clear maps, labels, and concise captions.

## Notes for Future Notebook Conversion

If these brainstorm labs are converted to `.ipynb` notebooks, begin each notebook with:

- Installation cells for `geopandas`, `pandas`, `matplotlib`, `contextily`, `libpysal`, `esda`, `pointpats`, `scipy`, and `scikit-learn` as needed.
- A short explanation of what each package contributes.
- A dataset description cell explaining source, geometry type, attributes, coordinate reference system, and known limitations.
- Inline code comments that explain every major beginner-facing statement.
- Markdown placeholders for screenshots and conceptual diagrams.
