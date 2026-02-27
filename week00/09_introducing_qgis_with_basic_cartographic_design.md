# Labelling Tree Data with QGIS

## Introduction

Now that you have QGIS installed and configured, it's time to put it to work! This lab introduces you to the QGIS interface through a hands-on tree crown annotation project. You'll learn essential QGIS skills while creating valuable training data by digitizing individual tree crowns from high-resolution aerial imagery.

**What you'll be doing:**
You'll work with a QGIS project that contains high-resolution NAIP (National Agriculture Imagery Program) imagery taken before or after a wildfire event. Your task is to randomly select an image tile, digitize tree crown boundaries as accurately as possible, and create a professional map documenting your work.

**Why this matters:**
The data you create will be used to train machine learning models for automated tree detection and counting. Accurate tree crown delineation is fundamental to forest inventory, wildfire risk assessment, and ecosystem monitoring. This workflow teaches you core GIS skills while contributing to real research applications.

## Learning Objectives

By the end of this lab, you will be able to:

- Navigate the QGIS interface and use essential navigation tools
- Work with layers, including reordering, toggling visibility, and exploring metadata
- Query attribute tables and select features based on attributes and location
- Use geoprocessing tools to create random points within features
- Create and edit scratch layers for digitizing new spatial data
- Digitize accurate polygon features (tree crowns) from aerial imagery
- Export spatial data in GeoJSON format with proper naming conventions
- Create and populate a professional map layout for documentation
- Submit completed spatial data and map products

---

## Getting Started

### Download and Extract the Project Package

Download the `Tree_Labelling.zip` file from Canvas or the course repository. This package contains everything you need to get started, with **best-practice folder structure and naming conventions already set up for you**.

**What's included in the .zip file:**
- Pre-configured QGIS project file (`.qgz`)
- Raw data files (NAIP imagery connection, grid layer)
- Pre-built folder structure following GIS best practices
- Empty directories ready for your work
- Map layout template

**Extract the .zip file:**

1. Download `Tree_Labelling.zip` 
2. Extract it to your Documents folder (or another location you can easily access)
3. After extraction, you should have this structure:

```
Tree_Labelling/
├── data/
│   ├── raw/          (contains project file and base data)
│   ├── processed/    (empty - for your selected grid cell)
│   └── outputs/      (empty - for your digitized tree crowns)
├── maps/             (empty - for your PDF map layout)
└── documentation/    (empty - for notes about your work)
```

**Recommended locations:**
- **Windows:** `C:\Users\YourName\Documents\Tree_Labelling\`
- **Mac:** `~/Documents/Tree_Labelling/`

**Why this structure is already set up for you:**
- Keeps original data separate from modified data
- Makes it easy to find files for submission
- Follows industry-standard GIS project organization
- Prevents accidentally overwriting original data
- Empty folders are ready for you to save your work in the right places

### Understanding the Pre-configured Naming Structure

The project folder follows **Esri raster naming rules** as the universal standard because they're the most restrictive and ensure compatibility across all GIS software. Throughout this lab, you'll save files using these same conventions.

**Key naming rules you'll follow:**
1. **Use underscores (_) instead of spaces or hyphens**
2. **Always start with a letter, never a number**
3. **Avoid special characters** (no &, -, @, #, etc.)
4. **Keep names short but descriptive**
5. **Use consistent patterns** for related files

**Examples of good GIS file naming:**
- `grid_cell_18_42342_101234.geojson` ✓
- `jsmith_18_42342_101234_20200815_RGB.geojson` ✓
- `Tree_Crowns_Final.geojson` ✓

**Examples of bad naming (will cause errors):**
- `grid-cell-18.geojson` ✗ (hyphens cause problems)
- `18_42342_101234.geojson` ✗ (starts with number)
- `my tree data.geojson` ✗ (contains spaces)
- `grid&cell.geojson` ✗ (special character)

For more details on GIS naming conventions, review [01 - Things You Need to Know About GIS Data on Your Computer](01_things_you_need_to_know_about_gis_data_on_your_computer.md).

### What's in the Raw Data Folder

Inside `data/raw/` you'll find:
- **QGIS Project File:** The main `.qgz` file you'll open (named following GIS conventions)
- **Grid Layer:** Pre-loaded Web Mercator tile boundaries at zoom level 18
- **NAIP Imagery Connection:** XYZ tile service configuration for aerial imagery

**Important:** Never modify or delete files in the `raw/` folder. These are your originals. All your work will be saved to the `processed/` and `outputs/` folders.

---

## Part 1: Open and Explore the Project

### Step 1: Open the Project File

Now that you've extracted the project package, let's open the pre-configured QGIS project:

1. Launch QGIS
2. Go to **Project > Open** (or press `Ctrl+O` / `Cmd+O`)
3. Navigate to your extracted `Tree_Labelling` folder, then to `data/raw/`
4. Select the QGIS project file (`.qgz`)
   - Example path: `~/Documents/Tree_Labelling/data/raw/Tree_Labelling_Project.qgz`
5. Click **Open**

The project should load with the NAIP imagery layer and grid layer visible. Everything is pre-configured and ready to use!

### Step 2: Explore Navigation Tools

QGIS provides several tools for navigating your map canvas. Let's get familiar with them:

**Basic Navigation:**

1. **Pan Tool** (hand icon) - Click and drag to move around the map
   - Shortcut: Hold `Spacebar` and drag
2. **Zoom In/Out** - Use the magnifying glass icons or mouse wheel
3. **Zoom Full** - Click the globe icon to see all layers
4. **Zoom to Layer** - Right-click the grid layer in the Layers Panel and select **Zoom to Layer**
   - This is particularly useful for understanding the full extent of a layer

**Try this:**

- Use **Zoom to Layer** on the grid layer to see all tile boundaries
- Use your mouse wheel to zoom in and out
- Hold spacebar and drag to pan around the imagery
- Notice how the NAIP imagery loads different tiles as you navigate

### Step 3: Explore the Layers Panel

The Layers Panel (usually on the left side) shows all layers in your project. Let's explore how it works:

**Layer Management:**

1. **Reorder Layers:** Click and drag layers up or down

   - Layers higher in the list appear on top in the map
   - Try moving the grid layer above and below the imagery layer
   - See how this affects visibility
2. **Toggle Layer Visibility:** Click the checkbox next to each layer name

   - Turn the grid layer off and on
   - Notice how you can see the imagery without the grid overlay
3. **Layer Properties:** Right-click any layer and select **Properties**

   - Explore the different tabs (Source, Symbology, etc.)
   - Don't make changes yet—just observe what's available

### Step 4: Explore Layer Metadata

Metadata tells you important information about your spatial data:

1. Right-click the **grid layer** and select **Properties**
2. Navigate to the **Information** tab
3. Review the metadata including:

   - **CRS (Coordinate Reference System):** Should be Web Mercator (EPSG:3857)
   - **Extent:** The bounding box coordinates
   - **Feature count:** How many grid cells exist
   - **Geometry type:** Should be "Polygon"
4. Repeat for the NAIP imagery layer

   - Note the source URL for the XYZ tiles
   - Check the CRS (should also be EPSG:3857)

**Why this matters:** Understanding your data's coordinate system, extent, and properties is essential before any spatial analysis. Mismatched coordinate systems are one of the most common GIS errors.

---

## Part 2: Working with Attributes and Selections

### Step 5: Open and Explore the Attribute Table

Every vector layer has an attribute table containing information about each feature:

1. Right-click the **grid layer** in the Layers Panel
2. Select **Open Attribute Table**
3. Examine the table structure:
   - Each row represents one grid cell
   - Columns contain attributes like tile coordinates (X, Y, Z)
   - Note the field names—you'll need these for creating file names later

**Understanding the Grid:**

- **Z:** Zoom level (should be 18)
- **X:** Tile column number
- **Y:** Tile row number
- These Z/X/Y values follow the Web Mercator tiling scheme used by web maps

### Step 6: Select Features by Attributes

Now let's practice selecting specific features based on their attributes:

1. In the attribute table, click the **Select features using an expression** button (looks like ε with a yellow highlight)
2. The expression builder opens—this is where you can write queries
3. Try a simple selection:

   - In the expression field, type: `"X" = 100` (replace 100 with an actual X value from your table)
   - Click **Select Features**
   - Notice the selected rows turn blue in the attribute table and yellow on the map
4. To clear the selection: Click the **Deselect all features** button in the attribute table toolbar

**Practice:** Try selecting grid cells that meet certain criteria (explore the AND/OR operators in expressions if you want to get fancy).

---

## Part 3: Geoprocessing and Random Selection

### Step 7: Create a Random Point

Now we'll use geoprocessing tools to randomly select a grid cell for your tree annotation work:

1. Go to **Processing > Toolbox** (or press `Ctrl+Alt+T` / `Cmd+Option+T`)
2. The Processing Toolbox panel opens—this contains hundreds of analysis tools
3. In the search bar, type: `random points inside polygons`
4. Double-click **Random points inside polygons (fixed)** to open the tool
5. Configure the tool:
   - **Input layer:** Select your grid layer
   - **Number of points:** Set to `1`
   - **Minimum distance between points:** Leave at 0
   - **Random points:** Click `...` and select **Create Temporary Layer** (or save to disk if you prefer)
6. Click **Run**

A new temporary layer called "Random points" should appear with a single point somewhere within the grid.

**Troubleshooting:** If you don't see the point, right-click the new layer and select **Zoom to Layer**.

### Step 8: Select Grid Cell by Location

Now use the random point to select the grid cell it falls within:

1. Make sure the **grid layer** is selected in the Layers Panel (click on it once)
2. Go to **Vector > Research Tools > Select by Location**
3. Configure the selection:
   - **Select features from:** Choose your grid layer
   - **Where the features:** Select "intersect"
   - **By comparing to features from:** Select the random points layer
4. Click **Run**

One grid cell should now be selected (highlighted in yellow on the map). This is your work area!

**Check your selection:**

- Open the grid layer's attribute table
- You should see exactly 1 feature selected
- Note the Z, X, and Y values—you'll need these for naming your files

### Step 9: Save the Selected Grid Cell

Let's save this selected grid cell as a new file so you can easily work with it:

1. Right-click the **grid layer** in the Layers Panel
2. Select **Export > Save Selected Features As...**
3. Configure the export:
   - **Format:** GeoJSON
   - **File name:** Click `...` and navigate to your `Tree_Labelling` folder, then to the `data/processed/` folder (this empty folder was already created for you in the project package). Name the file:
     ```
     grid_cell_Z_X_Y.geojson
     ```
     Replace Z, X, Y with the actual tile coordinates from your selected cell.
     
     **Example:** `grid_cell_18_42342_101234.geojson`
     
     **Full path example (Mac):** `~/Documents/Tree_Labelling/data/processed/grid_cell_18_42342_101234.geojson`
     
     **Full path example (Windows):** `C:\Users\YourName\Documents\Tree_Labelling\data\processed\grid_cell_18_42342_101234.geojson`
   
   - **CRS:** Leave as-is (should be EPSG:3857)
4. Click **OK**

**Note on naming:** We use `grid_cell_` as a prefix (starts with a letter), underscores to separate parts (no hyphens or spaces), and embed the tile coordinates for easy identification. This follows the GIS naming best practices from Week 00.

The new layer should automatically be added to your map.

5. Right-click the new grid cell layer and select **Zoom to Layer**
6. Zoom in closer to see the NAIP imagery clearly within your grid cell

**Important:** If your selected grid cell has no trees, is completely obscured by clouds, or is otherwise "unlabellable," simply repeat Steps 7-9 to generate a new random point and select a different grid cell.

---

## Part 4: Digitizing Tree Crowns

### Step 10: Create a Scratch Layer for Digitizing

Now we'll create a new layer where you'll digitize tree crown polygons:

1. Go to **Layer > Create Layer > New Temporary Scratch Layer**
2. Configure the layer:
   - **Layer name:** Enter a descriptive name using this convention:
     ```
     SUNETID_Z_X_Y_NAIPDATE_RGBorIR
     ```
     For example: `jsmith_18_42342_101234_20200815_RGB`
     
     **Naming convention breakdown:**
     - `SUNETID`: Your Stanford SUNetID (starts with letter ✓)
     - `Z_X_Y`: The tile coordinates from your selected grid cell
     - `NAIPDATE`: The date of the NAIP imagery in YYYYMMDD format (check layer properties or project documentation)
     - `RGBorIR`: Either `RGB` for true color or `IR` for infrared imagery
     - **Use underscores (_) to separate each part** (no hyphens or spaces)
     
     **Why this naming pattern:**
     - Starts with your SUNetID (a letter) to meet Esri naming requirements
     - Uses underscores for readability and GIS compatibility
     - Embeds all key metadata in the filename
     - Makes the file self-documenting and easy to identify
   
   - **Geometry type:** Polygon
   - **CRS:** EPSG:3857 (same as your other layers)
3. Click **OK**

The new empty layer appears in your Layers Panel.

### Step 11: Start an Editing Session

Before you can digitize features, you need to enable editing:

1. Select your new scratch layer in the Layers Panel
2. Click the **Toggle Editing** button (pencil icon) in the toolbar
   - Or right-click the layer and select **Toggle Editing**
3. The layer name should now have a small pencil icon next to it, indicating it's editable

### Step 12: Digitize Tree Crowns

Now for the main task—digitizing individual tree crowns as polygons:

**Digitizing Guidelines:**

- **One polygon per tree:** Each visible tree crown should be its own polygon
- **Accuracy matters:** Trace the crown boundary as accurately as possible
- **Crown boundary:** Follow the outer edge of the visible canopy
- **Overlapping crowns:** If trees overlap, estimate the boundary between them
- **Include all visible trees:** Within your grid cell, label every tree you can identify
- **Dead trees count:** If you can see a tree crown structure, include it

**Digitizing Process:**

1. Click the **Add Polygon Feature** button (looks like a polygon shape) in the toolbar
2. Click around the boundary of a tree crown to create vertices

   - Left-click to place each vertex
   - Right-click when you're done with the polygon to finish it
3. When you right-click to finish, an attribute form may appear

   - You can leave attributes empty or add notes if desired
   - Click **OK** to complete the feature
4. Repeat for each tree crown in your grid cell
5. **Zoom in closely** for accuracy—use your mouse wheel frequently
6. **Pan often** to see different parts of your grid cell

**Pro Tips:**

- Use the **Vertex Tool** to adjust polygon shapes after creation
- Press `Ctrl+Z` (Cmd+Z on Mac) to undo mistakes
- Take breaks! Digitizing requires focus and can cause eye strain
- If a tree is partially outside your grid cell, still include it if most of the crown is inside

### Step 13: Save Your Edits

As you work, save your edits periodically:

1. Click the **Save Layer Edits** button (floppy disk icon) in the toolbar
   - This saves your edits to the temporary scratch layer
2. Continue digitizing until you've labeled all visible trees in your grid cell
3. When completely finished, click **Toggle Editing** again to stop the editing session
4. If prompted, click **Save** to confirm saving your edits

### Step 14: Export as GeoJSON

Now export your digitized tree crowns as a GeoJSON file:

1. Right-click your scratch layer in the Layers Panel
2. Select **Export > Save Features As...**
3. Configure the export:
   - **Format:** GeoJSON
   - **File name:** Navigate to your `Tree_Labelling` folder, then to the `data/outputs/` folder (this empty folder was already created for you in the project package). Use the same naming convention as your layer:
     ```
     SUNETID_Z_X_Y_NAIPDATE_RGBorIR.geojson
     ```
     
     **Example:** `jsmith_18_42342_101234_20200815_RGB.geojson`
     
     **Full path example (Mac):** `~/Documents/Tree_Labelling/data/outputs/jsmith_18_42342_101234_20200815_RGB.geojson`
     
     **Full path example (Windows):** `C:\Users\YourName\Documents\Tree_Labelling\data\outputs\jsmith_18_42342_101234_20200815_RGB.geojson`
   
   - **CRS:** EPSG:4326 (WGS84 - this is standard for GeoJSON)
   - Leave other options as default
4. Click **OK**

**Important:** This file goes in your `outputs/` folder because it's your final analysis result. Keeping outputs separate from raw and processed data helps you stay organized and makes submission easier!

---

## Part 5: Create a Map Layout

### Step 15: Open the Map Layout Template

The project includes a pre-configured map layout template:

1. Go to **Project > Layouts > [Template Name]**
   - The template name will be provided in your project file
2. The Print Layout window opens

You should see a layout with placeholders for:

- Map frame
- Title
- Legend
- Scale bar
- North arrow
- Text boxes for metadata

### Step 16: Update the Map Frame

First, make sure the map shows your work area:

1. In the main QGIS window (not the layout), zoom to your selected grid cell with your digitized trees visible
2. Return to the Print Layout window
3. Select the map frame (click on it)
4. In the **Item Properties** panel (right side):
   - Click **Set Map Extent to Match Main Canvas**
   - Your work area should now appear in the map frame

### Step 17: Add Required Information

Update the text elements in the layout:

**Title:**

1. Click on the title text box
2. In the **Item Properties** panel, update the text to something descriptive:
   ```
   Tree Crown Digitization - Grid Cell [Z/X/Y]
   ```

**Metadata Box:**
Add the following information (there should be a text box for this):

- **Your Name:** [Your full name]
- **Date:** [Today's date]
- **SUNetID:** [Your SUNetID]
- **Grid Cell:** Z/X/Y coordinates
- **NAIP Date:** [Date of imagery]
- **Imagery Type:** RGB or IR
- **Projection:** EPSG:3857 (Web Mercator)
- **Tree Count:** [Number of trees you digitized]

**Notes Section:**
Add a notes text box or update an existing one with:

- Your experience with the labeling process (easy, challenging, observations)
- Any challenges (unclear boundaries, overlapping crowns, image quality issues)
- Confidence level in your digitization
- Any patterns you noticed (tree sizes, distribution, species if identifiable)

**Example:**

```
Notes: Digitizing this 256x256m grid cell took approximately 45 minutes. 
Most tree crowns were clearly distinguishable, though several oaks had 
overlapping canopies requiring estimation. Image quality was excellent. 
Counted 37 individual trees ranging from approximately 5-15m crown diameter. 
High confidence in accuracy of delineations.
```

### Step 18: Verify All Elements

Check that your layout includes:

- [ ] Map showing your grid cell with digitized tree crowns
- [ ] Legend showing the layers
- [ ] Scale bar with appropriate units
- [ ] North arrow
- [ ] Title with grid cell coordinates
- [ ] Your name and date
- [ ] Projection information
- [ ] Notes about your labeling experience
- [ ] Tree count

### Step 19: Export the Map Layout

Export your finished map as a PDF:

1. In the Print Layout window, go to **Layout > Export as PDF**
2. Navigate to your `Tree_Labelling` folder, then to the `maps/` folder (this empty folder was already created for you in the project package). Save the file using this naming convention:
   ```
   SUNETID_Z_X_Y_map.pdf
   ```
   
   **Example:** `jsmith_18_42342_101234_map.pdf`
   
   **Full path example (Mac):** `~/Documents/Tree_Labelling/maps/jsmith_18_42342_101234_map.pdf`
   
   **Full path example (Windows):** `C:\Users\YourName\Documents\Tree_Labelling\maps\jsmith_18_42342_101234_map.pdf`

3. Click **Save**

Open the PDF to verify it looks correct before submitting.

---

## Part 6: Submission and Validation

### What to Submit

You should submit **three files** from your organized folder structure:

1. **Selected grid cell GeoJSON:** From `data/processed/` folder
   - Example: `grid_cell_18_42342_101234.geojson`

2. **Digitized tree crowns GeoJSON:** From `data/outputs/` folder
   - Example: `jsmith_18_42342_101234_20200815_RGB.geojson`

3. **Map layout PDF:** From `maps/` folder
   - Example: `jsmith_18_42342_101234_map.pdf`

**Submission checklist:**
- [ ] All three files use proper GIS naming conventions (underscores, no spaces, start with letter)
- [ ] All three files are saved in the correct folders of the pre-configured project structure
- [ ] File names match the required patterns
- [ ] You can easily locate all files for upload

**Benefits of the pre-configured folder structure:**
The `Tree_Labelling.zip` package you downloaded already had all the folders set up correctly, making it easy to:
- Keep your work organized from the start
- Know exactly where to save each type of file
- Find your files quickly for submission
- Follow GIS industry best practices without extra setup

### Understanding the Validation Process

**Important:** This assignment uses a validation workflow common in crowdsourced mapping and machine learning training data creation:

1. **Your submission serves as training data** for automated tree detection algorithms
2. **Grading is a validation step:** Your instructor or a TA will review your digitization for:

   - Accuracy of crown boundaries
   - Completeness (did you label all visible trees?)
   - Consistency with labeling guidelines
   - Quality of metadata and documentation
3. **Validation outcomes:**

   - **Valid:** Your work meets quality standards - full marks!
   - **Invalid:** Issues identified - you'll receive feedback and can relabel the same grid cell for full marks
4. **Common validation issues:**

   - Missed trees
   - Inaccurate boundaries
   - Including non-tree objects
   - Inconsistent methodology
   - Missing or incorrect metadata

**The goal isn't perfection on the first try**—it's to learn the process of creating quality geospatial data and understanding how validation improves dataset quality.

### If Your Grid Cell is Unlabellable

Some grid cells may be impossible or impractical to label due to:

- Heavy cloud cover
- Poor image quality
- No trees present
- Complete obscuration by smoke

**If this happens:**

1. Document the issue in your map notes
2. Return to Part 3, Step 7
3. Generate a new random point and select a different grid cell
4. Note in your submission that you had to select a new cell and why

---

## Conclusion

Congratulations! You've completed your first QGIS project and created valuable training data for tree detection research. Through this lab, you've learned:

- How to navigate the QGIS interface efficiently
- Layer management and metadata exploration
- Attribute and spatial selections
- Geoprocessing with random point generation
- Creating and editing vector data through digitizing
- Exporting data in standard formats (GeoJSON)
- Professional map layout design and documentation

**These skills are foundational** for everything we'll do in this course. You now understand the complete GIS workflow: opening data, analyzing it, creating new data, and communicating results through maps.

### Next Steps

- Keep your QGIS project file—we may build on it in future labs
- Review the validation feedback when your assignment is graded
- If you need to relabel, use the feedback to improve your digitization
- Practice these skills—they'll be essential for upcoming assignments

### Troubleshooting Common Issues

**Can't see the imagery:**

- Check that the XYZ tile layer is above the grid in the Layers Panel
- Verify you have an internet connection (XYZ tiles load from the web)
- Try refreshing: right-click the layer and select Reload

**Selection tools not working:**

- Make sure you've selected the correct layer first
- Check that features actually exist in your selected area
- Verify coordinate systems match (should all be EPSG:3857)

**Can't edit/digitize:**

- Ensure Toggle Editing is enabled (pencil icon showing)
- Verify you've selected the correct scratch layer
- Check that the layer is editable (scratch/temporary layers are always editable)

**Need to delete a polygon:**

- Click the **Select Features** tool
- Click on the polygon you want to delete
- Press the `Delete` key
- Remember to save your edits

**Map layout looks wrong:**

- Return to the main QGIS window and adjust your map view
- Back in the layout, select the map frame and click "Set Map Extent to Match Main Canvas"

---

## Additional Resources

- QGIS Documentation: [docs.qgis.org](https://docs.qgis.org)
- NAIP Imagery Information: [USDA NAIP Program](https://www.fsa.usda.gov/programs-and-services/aerial-photography/imagery-programs/naip-imagery/)
- GeoJSON Specification: [geojson.org](https://geojson.org)
- Web Mercator Tile Scheme: [Slippy Map Tilenames](https://wiki.openstreetmap.org/wiki/Slippy_map_tilenames)

If you encounter issues not covered in the troubleshooting section, consult the course forum or office hours!
