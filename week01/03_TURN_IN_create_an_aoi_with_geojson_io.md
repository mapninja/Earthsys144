# Lab 03: Create an Area of Interest with GeoJSON.io

> **Turn-in for grading:** This lab includes material that must be turned in for grading. Export your AOI file using the naming convention below and submit it to Canvas.

## Introduction

Almost every spatial analysis project starts with defining a study area — an **Area of Interest (AOI)**. An AOI sets the geographic scope of your work: it tells your tools where to load data, where to clip rasters, and where to run calculations.

In this lab you will use **[geojson.io](https://geojson.io)**, a lightweight browser-based tool for creating and editing vector features without any software installation. You will draw a rectangular AOI that is at least as large as the Stanford campus, then relocate it to a place that is personally meaningful to you — a research site, hometown, field area, or any other location you want to study this quarter.

The result is a single GeoJSON file that you will use again in later labs as your personal study area.

### Why GeoJSON?

GeoJSON is a plain-text, open standard for encoding geographic features using JSON.

- A single self-contained file (no sidecar files, unlike shapefiles).
- Human-readable — you can open it in any text editor and read the coordinates.
- Natively understood by QGIS, Google Earth Engine, Leaflet, Mapbox, GitHub, and most other modern GIS tools.
- Coordinates are always in **WGS 84 (EPSG:4326)** — the same geographic CRS you encountered in the projection error lab.

---

## Part 1: Get Oriented with geojson.io

1. Open **[https://geojson.io](https://geojson.io)** in your browser. No login or installation is required.
2. You will see two main areas:
   - **Left panel** — a list of your features and panels for editing properties and raw JSON.
   - **Right panel** — an interactive map you can pan and zoom.
3. Take a moment to locate the **drawing toolbar** on the right side of the map. The tools, from top to bottom, are:
   - Select (keyboard shortcut: `1`)
   - Draw point (`2`)
   - Draw line (`3`)
   - Draw polygon (`4`)
   - **Draw rectangle (`5`)** ← this is the one you will use
4. At the top of the page, notice the **Export** button — you will use this at the end to save your work.

---

## Part 2: Draw a Rectangle Around the Stanford Campus

You will use the Stanford campus as a size reference. Your final AOI must be **at least this large**.

### Step 1: Navigate to the Stanford Campus

1. In the map search bar (top-left of the map, `⌘+K` to open), type **Stanford University, Palo Alto, CA** and press Enter, or simply pan and zoom to the campus manually.
2. Zoom to a level where you can see the full campus footprint including the Dish, the main quad, and the athletic facilities. A zoom level of 13–14 works well.

### Step 2: Draw a Rectangle

1. Press **`5`** or click the **Draw Rectangle** tool in the toolbar.
2. Click and drag across the map to draw a rectangle that covers the entire Stanford campus — from the Dish area in the southwest to the east edge of campus near El Camino Real.
3. Release the mouse button to finish the rectangle.
4. The rectangle will appear in the **feature list** in the left panel and as a polygon on the map.

> **Tip:** If the rectangle is not quite right, select it with the Select tool (`1`), then drag individual vertices to reshape it, or press `⌘+Z` to undo and redraw.

### Step 3: Check the Size

After drawing, look at the raw GeoJSON in the JSON panel on the left. You will see a `FeatureCollection` containing one `Feature` with a `Polygon` geometry. The four coordinate pairs define the corners of your rectangle in `[longitude, latitude]` order.

This is the minimum size your final AOI must be. A rectangle covering the full Stanford campus is roughly **3–4 km east-west by 5–6 km north-south**.

---

## Part 3: Move the Rectangle to Your Place of Significance

Now you will relocate the rectangle you just drew to a place that is meaningful to you. This might be:

- Your hometown, neighborhood, or campus back home.
- A research area or field site from another course or project.
- A place in the world you are studying or find interesting.

The requirement is that the relocated rectangle is **at least as large as the Stanford campus box** you just drew. You may make it larger.

### Option A: Move the Existing Rectangle (Recommended)

1. Select your rectangle with the Select tool (`1`).
2. Navigate the map to your chosen location (pan while holding `Space` and dragging, or use search).
3. Once the map is centered on your target location, hold **`Space`** and drag the selected rectangle to move it to the new location.

> **Note:** If moving the feature is awkward at your current zoom level, try using Option B instead.

### Option B: Delete and Redraw

1. Right-click the rectangle in the feature list or on the map and choose **Delete**.
2. Navigate to your chosen location using the search bar.
3. Press `5` to activate the rectangle tool and draw a new rectangle of at least the same size.

---

## Part 4: Add a Property to Your Feature

Adding descriptive properties to your features is good practice — it makes the file self-documenting and easier to use in downstream analysis.

1. Select your rectangle (click it on the map or in the feature list).
2. The **Feature Editor** panel will appear.
3. Click **Add property** and add the following:

| Property | Value (your entry) |
|---|---|
| `name` | A short descriptive name for the place (e.g., `Bogotá Study Area`) |
| `sunetid` | Your Stanford SUNet ID |
| `description` | One sentence about why you chose this location |

---

## Part 5: Export Your AOI as GeoJSON

1. Click the **Export** button at the top of the page.
2. Choose **GeoJSON** as the format.
3. Save the file. Your browser will likely save it as `map.geojson` — **rename it immediately** using the naming convention below.

### File Naming Convention

```
sunetid_week01_lab03_aoi.geojson
```

Replace `sunetid` with your actual Stanford SUNet ID. For example:

```
jsmith_week01_lab03_aoi.geojson
```

---

## Deliverable

Submit your exported GeoJSON file to the **Week 01 Lab 03** assignment on Canvas.

**Checklist before submitting:**

- [ ] The file is in GeoJSON format.
- [ ] The rectangle covers an area at least as large as the Stanford campus.
- [ ] The feature has `name`, `sunetid`, and `description` properties filled in.
- [ ] The filename follows the convention `sunetid_week01_lab03_aoi.geojson`.

---

## Reference: geojson.io Interface Summary

| Area | What it does |
|---|---|
| Feature list (left panel) | Lists all your features; double-click to zoom to one; drag to reorder |
| JSON panel (left panel) | Shows the raw GeoJSON; editable directly |
| Table panel | Browse all features and properties in a spreadsheet view |
| Drawing toolbar (right) | Tools for point, line, polygon, rectangle drawing |
| Export button (top) | Save your data as GeoJSON, KML, CSV, or Shapefile |

### Keyboard Shortcuts

| Key | Action |
|---|---|
| `1` | Select |
| `2` | Draw point |
| `3` | Draw line |
| `4` | Draw polygon |
| `5` | **Draw rectangle** |
| `Esc` | Exit drawing / clear selection |
| `⌘+Z` | Undo |
| `⌘+S` | Save (to geojson.io account if logged in) |
| `Space` + drag | Move selected feature |
