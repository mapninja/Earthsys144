# OPTIONAL_ Finding the Largest Active Fire Today in Google Earth Engine

> **Notebook location:** The runnable Colab notebook for this lab lives in [`data/largest_fire_today_workflow.ipynb`](../data/largest_fire_today_workflow.ipynb).
>
> **Source note:** This lab uses the workflow from the Google Earth Engine notebook *Finding the Largest Active Fire Today (GEE + FIRMS)* and adapts it for Week 08 as an optional fire-analysis exercise.

## What You Should Understand

This notebook shows how to turn a daily fire-detection dataset into a simple workflow for finding the most active fire cluster in a study area.

The main ideas are:

1. How to load the NASA FIRMS active-fire dataset in Google Earth Engine.
2. How to limit the search with a GeoJSON area of interest.
3. How to choose the latest available day, or a day before that.
4. How to group fire pixels into clusters and identify the largest one.
5. How to export the result as GeoJSON so it can be reused later.

> **Concept Note:**
> This workflow is about active fire detections, not a burn-severity map. It helps students see how a daily fire product can be filtered, grouped, and summarized into a usable boundary.

## Before You Start

Open the notebook in **Google Colab** so you can run the Python code interactively.

You will need:

1. A Google account and access to Colab.
2. A Google Earth Engine account.
3. The notebook file [`data/largest_fire_today_workflow.ipynb`](../data/largest_fire_today_workflow.ipynb).
4. An optional GeoJSON file if you want to analyze a smaller area than the notebook default.

The notebook is designed to teach the workflow in a beginner-friendly way, so it includes setup cells that install the packages it needs and explain why each package is being used.

## Datasets and Tools

The notebook uses:

1. NASA FIRMS daily active-fire detections from Earth Engine.
2. `geemap` for inline map display in the notebook.
3. GeoJSON AOI input, either pasted inline or read from a local file.

The AOI matters because fire-detection products can cover very large regions. Limiting the search area keeps the analysis focused and makes the map easier to interpret.

## Notebook Workflow

### 1. Load the fire data

The notebook starts by loading the FIRMS image collection for the relevant day or days. This is the part that connects the abstract idea of “today’s fire detections” to real Earth Engine data.

### 2. Set the area of interest

The AOI can come from inline GeoJSON or from a file path.

- If `AOI_INLINE_GEOJSON` is set, the notebook uses that geometry directly.
- If it is `None`, the notebook falls back to `AOI_GEOJSON_PATH`.

That pattern makes the notebook flexible for both quick demos and student-specific study areas.

### 3. Choose the date

The notebook uses `NUMBER_OF_DAYS_PRIOR` to choose which FIRMS day to inspect.

- `0` means the latest available day.
- `1` means the day before that.
- `2` means two days before that.

This is useful because FIRMS data are updated over time, and the exact most recent day can shift depending on when the notebook is run.

### 4. Group fire pixels

The notebook clusters nearby fire detections so the map can show larger active-fire patches instead of only individual pixels.

This step is important because a cluster is easier to interpret than a cloud of separate detections. It helps students see where the fire is most concentrated.

### 5. Find the largest cluster

Once the clusters are built, the notebook identifies the largest active fire feature in the selected area.

In simple terms, the workflow is asking: which cluster has the most fire pixels, and where is it located?

### 6. Export the result

The notebook exports the selected fire feature as GeoJSON for later use in other maps, analysis steps, or class projects.

> **Concept Note:**
> Exporting GeoJSON turns the result into a reusable spatial file. That means students can move the fire outline into another notebook, map, or GIS tool without rebuilding the workflow from scratch.

## Why This Workflow Matters

This notebook helps students practice a few core spatial-thinking habits:

1. Start with a date-sensitive dataset.
2. Limit the analysis with a spatial boundary.
3. Turn many pixels into a smaller number of meaningful features.
4. Save the output in a simple, reusable format.

Those same habits show up again and again in real remote-sensing and GIS work.

## What To Turn In

If this notebook is assigned for submission, students should include:

1. The notebook title.
2. The AOI they used.
3. The `NUMBER_OF_DAYS_PRIOR` setting they chose.
4. A screenshot of the largest active fire cluster on the map.
5. A short note explaining why they chose that date and area.

## Related Materials

- [Week 08 notebook file](../data/largest_fire_today_workflow.ipynb)
