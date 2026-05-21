
# TURN IN BONUS LAB - Tree Labeling in QGIS

> **Bonus turn-in:** This lab is a required turn-in for students who choose to complete the bonus labeling opportunity. It is not an optional workshop. Students will randomly select 20 candidate grid cells and complete tree labels in the first 5 suitable cells for up to 10 extra points added to their quarter total.

> **Note:** To make sure you are viewing the most recent version of this lab guide, hold **Shift** and click the browser refresh button.

> **Turn-in for grading:** Submit this lab on Canvas when you complete the bonus labeling work.

## Introduction

Now that you have QGIS installed and configured, it's time to put it to work! This lab introduces you to the QGIS interface through a hands-on tree crown annotation project. You'll learn essential QGIS skills while creating valuable training data by digitizing individual tree crowns from high-resolution aerial imagery.

**What you'll be doing:**
You'll work with a QGIS project that contains high-resolution NAIP (National Agriculture Imagery Program) imagery from before and after five major 2020 California fires. Your task is to randomly select 20 candidate grid cells, inspect them in the imagery, and label trees in both postfire and prefire imagery for the first 5 cells that contain forest cover without structures, roads, or other human-built infrastructure.

**Why this matters:**
The data you create will be used to train machine learning models for automated tree detection and counting. Accurate tree crown delineation is fundamental to forest inventory, wildfire risk assessment, and ecosystem monitoring. This workflow teaches you core GIS skills while contributing to real research applications.

## Learning Objectives

By the end of this lab, you will be able to:

- Navigate the QGIS interface and use essential navigation tools
- Work with layers, including reordering, toggling visibility, and exploring metadata
- Query attribute tables and select features based on attributes and location
- Use geoprocessing tools to create a random sample of candidate grid cells
- Create and edit shapefile layers for new spatial labels
- Use a docked attribute table to move systematically through sampled grid cells
- Digitize rectangular tree labels from aerial imagery
- Export spatial data in GeoJSON format with proper naming conventions

![](images/20260412_165514_image.png)

---

## Getting Started

### Download and Extract the Project Package

Download the `mortalitree.zip` file from the course repository data folder:

[Download mortalitree.zip](../data/mortalitree.zip)

This package contains everything you need to get started, with **best-practice folder structure and naming conventions already set up for you**.

**What's included in the .zip file:**

- Pre-configured QGIS project file: `mortalitree.qgs`
- Raw data layers and imagery references, including:
  - `castle_2020` (Castle Fire perimeter)
  - `creek_2020` (Creek Fire perimeter)
  - `czu_aug_lightning_2020` (CZU August Lightning Complex perimeter)
  - `north_complex_2020` (North Complex perimeter)
  - `scu_2020` (SCU Lightning Complex perimeter)
  - `Z17_MORTALITREE_FIRE_PERIMETERS_2020_tile_boundary_grid` (XYZ tile grid)
  - `PREFIRE`
    - `ALL_MORTALITREE_FIRE_PERIMETERS_2020_naip_rgb`
    - `ALL_MORTALITREE_FIRE_PERIMETERS_2020_naip_cir`
  - `POSTFIRE`
    - `ALL_MORTALITREE_FIRE_PERIMETERS_2022_naip_rgb`
    - `ALL_MORTALITREE_FIRE_PERIMETERS_2022_naip_cir`
  - `MORTALITREE_FIRE_PERIMETERS_2020`
  - `Google Hybrid basemap`
  - `Google Terrain basemap`
- Pre-built folder structure following GIS best practices
- A ready-to-open QGIS project with layer groups already organized

**Extract the .zip file:**

1. Download `mortalitree.zip`
2. Extract it to your Documents folder (or another location you can easily access)

### Allow QGIS to Read NAIP COGs from AWS S3

The NAIP imagery in this lab is stored as **Cloud Optimized GeoTIFFs**, or **COGs**, in public AWS S3 buckets. A COG is a GeoTIFF designed so GIS software can read only the small pieces of imagery needed for the current map view instead of downloading a whole image file.

QGIS uses a library called **GDAL** to read these cloud-hosted files. The NAIP bucket used by this project is **Requester Pays** on AWS. That means the data are public, but AWS still requires an authenticated requester to accept responsibility for the access request. Before you open the project, add a few GDAL/AWS environment variables so QGIS knows which AWS profile to use, which AWS region to contact, and that the requester-pays access flag should be sent with each imagery request.

1. Open QGIS.
2. Go to **QGIS > Settings** on Mac, or **Settings** on Windows.
3. Choose **Options**.
4. Go to the **System** panel.
5. Scroll to **Environment**.
6. Check **Use custom variables**.
7. Add these variables:

   | Variable | Value |
   | --- | --- |
   | `AWS_REQUEST_PAYER` | `requester` |
   | `AWS_REGION` | `us-west-2` |
   | `AWS_PROFILE` | `default` |

8. Click **OK**.
9. Quit QGIS completely and reopen it before opening the project.

> **Why do this?** The project's VRT files point to imagery paths that begin with `/vsis3/`. That prefix tells GDAL to stream files directly from AWS S3. Because these NAIP files are in a Requester Pays bucket, QGIS must send `AWS_REQUEST_PAYER=requester` along with a valid AWS profile. Without these settings, AWS will reject the imagery request and QGIS will show `AccessDenied` or HTTP `403` warnings.

### What's in the Data Folder

Inside the extracted `mortalitree/data/` folder you'll find:

- **Tile boundary grid:** `Z17_MORTALITREE_FIRE_PERIMETERS_2020_tile_boundary_grid`
- **Fire perimeter layers:** `castle_2020`, `creek_2020`, `czu_aug_lightning_2020`, `north_complex_2020`, and `scu_2020`
- **Pre-fire imagery VRTs:** `ALL_MORTALITREE_FIRE_PERIMETERS_2020_naip_rgb.vrt` and `ALL_MORTALITREE_FIRE_PERIMETERS_2020_naip_cir.vrt`
- **Post-fire imagery VRTs:** `ALL_MORTALITREE_FIRE_PERIMETERS_2022_naip_rgb.vrt` and `ALL_MORTALITREE_FIRE_PERIMETERS_2022_naip_cir.vrt`
- **Fire perimeter layer:** `MORTALITREE_FIRE_PERIMETERS_2020`
- **Basemaps:** `Google Hybrid` and `Google Terrain`

**Important:** Never modify or delete the original files in the extracted `data/` folder. These are your source data. Save your new working layers and final outputs in clearly named files so they are easy to find later.

---

## Part 1: Open and Explore the Project

### Step 1: Open the Project File

Now that you've extracted the project package, let's open the pre-configured QGIS project:

1. Launch QGIS
2. Go to **Project > Open** (or press `Ctrl+O` / `Cmd+O`)
3. Navigate to your extracted `mortalitree` folder
4. Select the QGIS project file `mortalitree.qgs`
   - Example path: `~/Documents/mortalitree/mortalitree.qgs`
5. Click **Open**

The project should load with the tile boundary grid, the five fire perimeter layers, prefire and postfire imagery groups, and the Google Hybrid and Google Terrain basemaps visible in the Layers Panel. Everything is pre-configured and ready to use once the COG environment variables are set.

**Try this:**

- Use your mouse wheel to zoom in and out
- Use **Zoom to Layer** on the grid layer or one fire perimeter layer to see the project extent again
- Hold spacebar and drag to pan around the imagery
- Notice how the NAIP imagery refreshes as you navigate and change scales.

### Step 2: Explore the Layers Panel

The Layers Panel (usually on the left side) shows all layers in your project. Let's explore how it works:

**Layer Management:**

1. **To Reorder Layers:** Click and drag layers up or down

   - Layers higher in the list appear on top in the map
   - Try moving the grid layer above and below the imagery layer
   - See how this affects visibility
2. **To Toggle Layer Visibility:** Click the checkbox next to each layer name

   - Turn the grid layer off and on
   - Notice how you can see the imagery without the grid overlay
3. **Layer Properties:** Right-click any layer and select **Properties**

   - Explore the different tabs (Source, Symbology, etc.)
   - Don't make changes yet—just observe what's available

### Step 3: Explore Layer Metadata

Metadata tells you important information about your spatial data:

1. Right-click the **grid layer** and select **Properties**
2. Navigate to the **Information** tab
3. Review the metadata including:

   - **CRS (Coordinate Reference System):** The vector grid and fire perimeter layers should be WGS 84 (EPSG:4326)
   - **Extent:** The bounding box coordinates
   - **Feature count:** How many grid cells exist
   - **Geometry type:** Should be "Polygon"
4. Repeat for the NAIP imagery layer

   - Note that the source points to a `.vrt` file in the project data folder
   - The `.vrt` file points to many `/vsis3/` COG paths in AWS S3
   - Check the CRS. The NAIP COGs in this project are stored in a NAD83 UTM coordinate system.

**Why this matters:** Understanding your data's coordinate system, extent, and properties is essential before any spatial analysis. Mismatched coordinate systems are one of the most common GIS errors.

---

## Part 2: Working with Attributes and Selections

### Step 4: Open and Explore the Attribute Table

Every vector layer has an attribute table containing information about each feature:

1. Right-click `Z17_MORTALITREE_FIRE_PERIMETERS_2020_tile_boundary_grid` in the Layers Panel
2. Select **Open Attribute Table**
3. Examine the table structure:
   - Each row represents one grid cell
   - Columns contain attributes like tile coordinates (X, Y, Z)

![](images/20260412_181047_image.png)

**Understanding the Grid:**

- **Z:** Zoom level (should be 18)
- **X:** Tile column number
- **Y:** Tile row number
- These Z/X/Y values follow the Web Mercator tiling scheme used by web maps

## Part 3: Geoprocessing and Random Selection

### Step 5: Randomly Select 20 Candidate Grid Cells

Now you will randomly select 20 candidate grid cells from the full MORTALITREE tile grid. You will not label all 20 cells. You will inspect them in order and label the first 5 cells that meet the suitability rules.

1. Go to **Processing > Toolbox**.
2. In the Processing Toolbox search bar, type `random selection`.
3. Open **Random selection**.
4. Configure the tool:
   - **Input layer:** `Z17_MORTALITREE_FIRE_PERIMETERS_2020_tile_boundary_grid`
   - **Method:** `Number of selected features`
   - **Number of selected features:** `20`
5. Click **Run**.

You should now see 20 selected grid cells. They may fall in any of the five fire areas. That is expected.

> **Why do this?** Random selection spreads the work across the larger project area. You are selecting more candidate cells than you will label because some random cells may contain roads, buildings, water, bare ground, or other features that are not useful for this tree-labeling task.

### Step 6: Export the Selected Grid Cells to a New Layer

Now export those 20 selected grid cells to a new working layer.

1. Right-click `Z17_MORTALITREE_FIRE_PERIMETERS_2020_tile_boundary_grid`.
2. Choose **Export > Save Selected Features As...**
3. Make sure the **Save only selected features** option is enabled.
4. Save the layer in your extracted project folder as:

   ```
   sunetid_mortalitree_sample_grid.shp
   ```
5. Leave the default CRS unless QGIS prompts you to choose otherwise.
6. Click **OK**.

   ![](images/20260412_184036_image.png)

**Tip & Trick:** Copy the style from the original grid layer and paste it to the new one, then turn off the old grid layer.

1. Right-click the original grid layer and choose **Styles > Copy Style**.

   ![](images/20260412_184119_image.png)
2. Right-click `sunetid_mortalitree_sample_grid` and choose **Styles > Paste Style**.

   ![](images/20260412_184153_image.png)
3. Turn off the original grid layer.

### Step 7: Dock the Attribute Table Below the Map and Use It to Navigate

You will use the exported sample grid as your working unit layer.

1. Open the attribute table for `sunetid_mortalitree_sample_grid`.
2. If it opens in a separate window, dock it below the map panel by dragging it by the title bar until it snaps into the interface.

   ![](images/20260412_184334_image.png)
3. Use the attribute table tools to:
   - select a feature
   - zoom to the selected feature
   - move to the next feature

![](images/20260412_184518_image.png)

![](images/20260412_184439_image.png)

This lets you work through the sampled grid cells systematically instead of hunting around visually.

---

## Part 4: Create and Edit the Label Layers

### Step 8: Create the Postfire Label Layer

Create a new empty shapefile for your first set of labels.

1. Go to **Layer > Create Layer > New Shapefile Layer**.
2. Configure the layer:
   - **File name:** `sunetid_mortalitree_postfire_labels.shp`
   - **Geometry type:** Polygon
   - **CRS:** `WGS 84 (EPSG:4326)`
3. Click **OK**.

![](images/20260412_184834_image.png)

### Step 9: Get Ready to Edit

Before you start drawing labels, adjust the digitizing settings so QGIS uses the rectangle tool you need for this exercise.

1. Go to **QGIS > Settings** on Mac, or **Settings** on Windows.
2. Open **Options**.
3. In the Options dialog, go to **Map Tools > Digitizing**.
4. Enable **Suppress attribute form pop-up after feature creation**.
5. Click **Advanced** at the bottom of the Options panel.
6. Click **I will be careful**.
7. Expand `digitizing > shape-map-tools > current`.
8. Copy this text:

   ```
   rectangle-from-center-and-a-point
   ```

9. Paste that text into the **Value** box for the `current` setting.

![](images/20260412_191109_image.png)

10. Click **OK** to save the setting.

> **Why do this?** This tells QGIS to use a rectangle-based polygon drawing workflow, which makes your tree labels faster and more consistent.

### Step 10: Start Editing the Postfire Label Layer

1. Make sure the **POSTFIRE** imagery group is visible.
2. Toggle between the RGB and CIR versions of the postfire imagery to decide which one is easier to interpret. You can switch between them while labeling if that helps.
3. Select `sunetid_mortalitree_postfire_labels` in the Layers Panel.
4. Open the layer's styling and set:
   - **Fill:** Transparent
   - **Stroke:** a color that contrasts clearly with the imagery you are using
5. Click **Toggle Editing**.

### Step 11: Label Trees in the Postfire Imagery

Now begin the main labeling task.

1. In the docked attribute table for `sunetid_mortalitree_sample_grid`, select the first sampled grid cell and zoom to it.
2. Inspect that cell in the **postfire** imagery.
3. Only choose grid cells that meet all of the following conditions:
   - It should have trees in it.
   - It should have no buildings, houses, or other structures.
   - It should have no roads, parking lots, cleared pads, or other obvious human-built infrastructure.
   - It should have NAIP imagery available in both the prefire and postfire layers.
4. If the cell meets those conditions, label the trees by drawing rectangles around them using **Add Polygon Feature**.
5. If the cell does not meet those conditions, skip it and move to the next sampled grid cell.
6. Save your edits periodically.
7. Continue through the random sample in order until you have labeled trees in the first **5 suitable grid cells**.

**Labeling guidance:**

- Keep the rectangles simple and consistent.
- Work one tree at a time.
- If a sampled cell has no trees or contains roads, buildings, or other human-built infrastructure, move on to the next sampled cell.
- Save often.

> **Important concept:** In this exercise, your rectangles are labels for tree locations, not precise canopy outlines.

### Step 12: Save Your Work Frequently

While digitizing:

1. Click **Save Layer Edits** regularly.
2. Do not wait until the end of the session to save.

### Step 13: Create the Prefire Label Layer by Copying the Postfire Layer

Once you have finished labeling the first 5 suitable grid cells in the postfire imagery:

1. Right-click `sunetid_mortalitree_postfire_labels`.
2. Choose **Save Features As...**
3. Save a copy as:

   ```
   sunetid_mortalitree_prefire_labels.shp
   ```
4. Add the new layer to the project if QGIS does not do this automatically.

This copied layer gives you a starting point for the prefire labels, since trees visible after the fire were also present before the fire.

### Step 14: Finish the Prefire Tree Labels

Now switch to the prefire imagery and finish the second label layer.

1. Turn on the **prefire** imagery.
2. Start editing `sunetid_mortalitree_prefire_labels`.
3. Return to the same 5 sampled grid cells you already worked on.
4. Keep the copied tree labels that already match visible trees.
5. Add rectangles for any additional trees visible in the prefire imagery.
6. Save edits regularly.
7. When finished, stop editing and save the layer.

### Step 15: Export Both Label Layers to GeoJSON

When both shapefiles are complete, export each one to GeoJSON.

1. Right-click `sunetid_mortalitree_postfire_labels`.
2. Choose **Export > Save Features As...**
3. Set:

   - **Format:** `GeoJSON`
   - **File name:** `sunetid_mortalitree_postfire_labels.geojson`
   - **CRS:** `EPSG:4326`
4. Save it in an `outputs` folder inside your extracted `mortalitree` project folder. If there is not already an `outputs` folder, create one.
5. Repeat the same process for `sunetid_mortalitree_prefire_labels`, exporting it as:

   ```
   sunetid_mortalitree_prefire_labels.geojson
   ```

---

## Part 5: Final Submission

### What to Submit

When you are done:

1. Confirm that both files exist in your `outputs` folder:
   - `sunetid_mortalitree_postfire_labels.geojson`
   - `sunetid_mortalitree_prefire_labels.geojson`
2. Compress those two GeoJSON files into a single `.zip` file.
3. Upload that `.zip` file to the assignment on Canvas.

### Final Checklist

- [ ] You randomly selected 20 candidate grid cells from `Z17_MORTALITREE_FIRE_PERIMETERS_2020_tile_boundary_grid`
- [ ] You exported the selected grid cells to `sunetid_mortalitree_sample_grid.shp`
- [ ] You used the docked attribute table to move through the grid cells
- [ ] You created `sunetid_mortalitree_postfire_labels.shp` in `EPSG:4326`
- [ ] You inspected the random sample in order and labeled the first 5 suitable grid cells
- [ ] You skipped sampled cells with structures, roads, or other human-built infrastructure
- [ ] You copied that work to `sunetid_mortalitree_prefire_labels.shp`
- [ ] You finished the prefire labels using the prefire imagery
- [ ] You exported both final layers to GeoJSON
- [ ] You zipped the two GeoJSON files and uploaded them to Canvas

### Validation Notes

Your labels will be reviewed as part of a machine learning validation workflow. The goal is consistency and completeness within the 5 suitable grid cells you worked on.

---

## Conclusion

Through this lab, you used QGIS 3.44.7 to:

- randomly select candidate grid cells
- export a working subset of grid cells
- navigate spatial work systematically with the attribute table
- create and edit shapefile-based label layers
- label trees in both postfire and prefire imagery
- export final training labels to GeoJSON for submission

These are foundational GIS data creation skills and an important introduction to how image interpretation becomes structured training data.

### Next Steps

- Keep your QGIS project file and working layers
- Review any feedback on label consistency when the assignment is graded
- Practice this workflow, since we will keep building on spatial data creation skills

### Troubleshooting Common Issues

**Selection tools not working:**

- Make sure you selected the grid layer before running the random selection tool
- Confirm that the grid layer has selected features before exporting the sample grid

**Can't edit/digitize:**

- Make sure **Toggle Editing** is on
- Confirm you are editing the label layer, not the sample grid layer

**Need to delete a rectangle:**

- Select the feature
- Press `Delete`
- Save your edits

**Unsure which imagery to use:**

- Use the **postfire** imagery for `sunetid_mortalitree_postfire_labels`
- Use the **prefire** imagery for `sunetid_mortalitree_prefire_labels`

---

## Additional Resources

- QGIS Documentation: [docs.qgis.org](https://docs.qgis.org)
- NAIP Imagery Information: [USDA NAIP Program](https://www.fsa.usda.gov/programs-and-services/aerial-photography/imagery-programs/naip-imagery/)
- GeoJSON Specification: [geojson.org](https://geojson.org)
- Web Mercator Tile Scheme: [Slippy Map Tilenames](https://wiki.openstreetmap.org/wiki/Slippy_map_tilenames)

If you encounter issues not covered in the troubleshooting section, consult the course forum or office hours!
