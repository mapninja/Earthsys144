# OPTIONAL - Making and Serving Map Tiles with QGIS

## Overview

In this exercise, you will create your own **XYZ tile service** using QGIS. You will begin with a georeferenced raster image, style it for web display, export it into a folder of map tiles, and optionally publish those tiles with GitHub Pages.

> **Concept note:** A web map rarely loads one giant image all at once. Instead, it usually loads many small image tiles. Each tile covers a small part of the map at a particular zoom level. This makes web maps faster because the browser only requests the pieces needed for the current view.

## What You Should Understand After This Lab

By the end of this exercise, you should be able to explain:

- why web maps use tiled images instead of a single large raster
- why web map tiles usually use the Web Mercator coordinate reference system, `EPSG:3857`
- how QGIS can generate an XYZ tile folder and preview HTML page
- why a local `file:///` tile path must be changed before a web-hosted map can work
- how GitHub Pages can serve simple static web map files

## Getting Ready

### Data

We'll be using an image created, and georeferenced, by David Rumsey, and made available through [The David Rumsey Map Center](http://drmc.stanford.edu):

`"San Francisco Scale Model, Scale 1 inch 100 ft. Constructed by Federal Works Agency, Work Projects Administration. Sponsored by City Planning Commission. 1940 (Raster Image)"` https://searchworks.stanford.edu/view/dv566pd4199

1. **Download** the data from: https://searchworks.stanford.edu/view/dv566pd4199, using the **Download** `data_EPSG_4326.zip` option, from the **download widget**.


![](images/GitHub_XYZ_Tile_Service-520d4b81.png)

2. Create a Project folder to **Save** and **unzip** the `data_EPSG_4326.zip` file to.

### GitHub Account (optional)

For the optional portion of the lab, you will need both a GitHub.com account and GitHub Desktop for your operating system.

If you do not already have a GitHub account, go to https://github.com/signup and create a free one.

To download and install GitHub Desktop, see: https://desktop.github.com/

## Preparing the Imagery Layer

Here, you will set the project CRS to one appropriate for XYZ tile services, `EPSG:3857`. You will also adjust rendering and resampling options in the Layer Styling panel to increase the legibility of the image.

> **Concept note:** A coordinate reference system, or CRS, tells GIS software how coordinates relate to locations on Earth. Most slippy web maps use Web Mercator, `EPSG:3857`, because it supports the global tile grid used by common web mapping libraries.

### Add Layers

1. Create a new QGIS Project, and save it to the same folder you unzipped the `data_EPSG_4326.zip` image to.
2. Add the `data_EPSG_4326` image from the **Project Home** folder in the **Browser** panel.

![](images/GitHub_XYZ_Tile_Service-65f6c51c.png)

### Adjust the Project CRS

1. Use the **Quick Map Services plugin** to add a basemap to the project.
2. Right-click on the **Basemap Layer** you added and go to **>Layer CRS>Set Project CRS from Layer**
3. Save your changes.

![](images/GitHub_XYZ_Tile_Service-5e9ddd5d.png)

### Adjust the Layer Styling
#### Rendering

1. Select the `data_EPSG_4326` layer and open the **Layer Styling** panel
2. Zoom in to a detail area at a scale of about 1:2500 and observe the "before" rendering detail and color.

_The image below, show a detail area, where Golden Gate Park meets the Panhandle Park._

![](images/GitHub_XYZ_Tile_Service-9482a3a8.png)

3. Under **Layer Rendering**, adjust the **Saturation** to `25` and the **Contrast** to `25`

![](images/GitHub_XYZ_Tile_Service-e87b7c8c.png)

#### Resampling Method

4. Under **Resampling**, set:
   - **Zoomed in**: `Cubic`
   - **Zoomed out**: `Cubic`
   - **Oversampling**: `3.00`

![](images/GitHub_XYZ_Tile_Service-3eb81103.png)

5. Note the results, and that the **street labels** should now be a bit more legible.

![](images/GitHub_XYZ_Tile_Service-b4f88a2d.png)

6. Remove the **Basemap Layer**
7. Right-click on the `data_EPSG_4326` layer and **Zoom to layer(s)**

![](images/GitHub_XYZ_Tile_Service-d5ce5a4c.png)

8. Save your project.

### Create the Directory of Tiles

1. Search the Processing Toolbox for "**XYZ**" and open the **Generate XYZ tiles (Directory) tool**.
2. Set the **Extent** as **Use Current Map **
3. Change the following options:
   - **Minimum zoom**: `7`
   - **Maximum zoom**: `15`
   - **Output Directory**: Make a new directory in your **project folder** called `SF_Model_Tiles`
   - **Output html (Leaflet)**: Save to the `Output directory` you created, above, as `index.html`

![](images/GitHub_XYZ_Tile_Service-a28d1678.png)

4. Click **Run** to create the XYZ tiles, directories and `index.html`.

![](images/GitHub_XYZ_Tile_Service-eee667ba.png)

5. Close the **Generate XYZ Tiles (Directory)** tool.
6. Click on the **File path:** URL in the **Results Viewer** window that appears when the **Generate XYZ Tiles (Directory)** tool has finished, to open the Leaflet map and verify that the tiles have been created.

![](images/GitHub_XYZ_Tile_Service-dc50a05c.png)

![](images/GitHub_XYZ_Tile_Service-fec4cfc1.png)

7. Save your **QGIS Project** and **Close QGIS**

> **Concept note:** The output tile folder is organized by zoom level, column, and row. That is why the tile path uses the template `{z}/{x}/{y}.png`: `{z}` is the zoom level, `{x}` is the tile column, and `{y}` is the tile row.


## Deliverable (Optional)

If you choose to complete this optional workshop, submit one of the following:

- Two screenshots of the working Leaflet map (one zoomed out showing the full layer, one zoomed in showing detail), uploaded to Canvas.
- OR a live GitHub Pages (or Stanford AFS) URL to your hosted Leaflet map, plus a short README describing where you put the tile folder and how to update the `index.html` if needed.

## Upload the tiles to GitHub (Optional)

### Upload to GitHub and Edit the index.html

1. Using your Text Editor, Browse to `index.html` and open it.

```html

<!DOCTYPE html>
<html>
<head>
  <title>Leaflet Preview</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
  <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
  <style type="text/css">
    body {
       margin: 0;
       padding: 0;
    }
    html, body, #map{
       width: 100%;
       height: 100%;
    }
  </style>
</head>
<body>
  <div id="map"></div>
  <script>
      var map = L.map('map').setView([37.752990353923, -122.43432528011124], 11.0);
      L.tileLayer('file:////Users/maples/Scratch/144%20Labs/Week%2007/data_EPSG_4326/SF_Model_Tiles/{z}/{x}/{y}.png', {
        minZoom: 7,
        maxZoom: 15,
        tms: false,
        attribution: 'Generated by TilesXYZ'
      }).addTo(map);
  </script>
</body>
</html>
```

Find the `L.tileLayer()` function in the code, above, and note that it is calling the `{z}/{x}/{y}.png` tiles using a `file:////` path on your local hard drive.

In order for this function to find the tiles once we have them on GitHub, the path value in this function will need to be updated to the path on GitHub.  We'll do that, after we upload the tiles, so we can copy the tiles URL directly from GitHub.

For this (optional) part of the exercise, you need to install the **GitHub Desktop application**, from https://desktop.github.com/

1. Start the GitHub Desktop application
2. Login to your **GitHub Account** as directed
2. Go to **File>Add Local Repository...**

![](images/GitHub_XYZ_Tile_Service-0fa2c0ac.png)

3. Click the link to "create a repository here, instead"

![](images/GitHub_XYZ_Tile_Service-8e2b2bd8.png)

4. Check the **Initialize this repository with a README** option...

![](images/GitHub_XYZ_Tile_Service-d5b48231.png)

5. **Uncheck** the option to **Keep this code private**, then Click **Create Repository**

6. In the **Main GitHub Desktop Window**, click **Publish repository**, then click it, again, to _**publish the repo to GitHub.com**_.

![](images/GitHub_XYZ_Tile_Service-2fce7425.png)

7. Wait for the upload of the file in the folder (there are MANY!).

8. Click on the **View on GitHub** Button to open the Repository in your browser.

![](images/GitHub_XYZ_Tile_Service-88e72fc6.png)

9. Examine the resulting repository to see that it looks similar to the following:

![](images/GitHub_XYZ_Tile_Service-7e78e8d1.png)

### Turn on GitHub Pages for the Repo

1. From the `SF_Model_Tiles` **Repository page**, go to the Settings>Pages section.
2. Select `Main` as the **branch** to use for GitHub Pages, and click Save.

![](images/GitHub_XYZ_Tile_Service-99573f99.png)

3. Refresh the Settings>Pages page, every few minutes, until the repository pages are published, and the URL appears at the top of the page.


![](images/GitHub_XYZ_Tile_Service-48349e25.png)

4. Click on the **Visit Site** button, to see that the **Leaflet Map** is currently disabled.

![](images/GitHub_XYZ_Tile_Service-ce32b26f.png)

This is because the path in the `L.tileLayer()` function is still pointing to the files on your local hard drive, which is not accessible to GitHub. In the next section, you will edit the `index.html` file to point to the new location of the tiles, on GitHub.


### Edit the `index.html` file to Use the GitHub Hosted Tiles

1. Return to the main `SF_Model_Tiles` repository page, on GitHub.
2. Click into one of the numbered Repository folders, such as `11`, then continue to click into folders, until you find a `*.png` file.

![](images/GitHub_XYZ_Tile_Service-ac9d67de.png)

3. Click "into" the `*.png` file, then click on the Download button
4. Select and **Copy** the URL for the `*.png` image, from the URL bar of your browser.

![](images/GitHub_XYZ_Tile_Service-710707a8.png)

4. Paste this `download URL` into a **New text document**, in your plain text editor.

Your `download URL` should be similar to the one, below, but with your username, and the subpath to the specific `*.png` image you browsed to.

`https://raw.githubusercontent.com/mapninja/SF_Model_Tiles/main/11/326/791.png`

5. Select and Delete the part of the `download URL` after `/main/`, so that you have something like the following, left:

`https://raw.githubusercontent.com/mapninja/SF_Model_Tiles/main/`

6. Now you need to paste the ``{z}/{x}/{y}.png` template for the service, to the end of the URL, like so:

`https://raw.githubusercontent.com/mapninja/SF_Model_Tiles/main/{z}/{x}/{y}.png`

7. Select and copy this **XYZ tile template URL**
8. Return to the Main Repository Page and click on the index.html file to view it.
9. Click on the Edit button ![](images/GitHub_XYZ_Tile_Service-5d4cd008.png) to open the GitHub Text editor.
10. Locate the following line in the `index.html` file (_your file:/// path will be slightly different_):

`      L.tileLayer('file:////Users/maples/Scratch/144%20Labs/Week%2007/data_EPSG_4326/SF_Model_Tiles/{z}/{x}/{y}.png', {`

11. Select the entire `file:////...` path between the **single quotes (' ')** and paste the copied path into it's place, like so:

`      L.tileLayer('https://raw.githubusercontent.com/mapninja/SF_Model_Tiles/main/{z}/{x}/{y}.png', {`

11. Create a Commit comment and click the **Commit changes** button.


![](images/GitHub_XYZ_Tile_Service-7254fef6.png)

## Test your live Leaflet Map

1. Give it a few minutes for the changes to be published to GitHub Pages, then return to **Settings>Pages**, for the repo, and click on the **Visit Site** button to open the Leaflet Map:

![](images/GitHub_XYZ_Tile_Service-c20b8697.png)

![](images/GitHub_XYZ_Tile_Service-3fd93f5f.png)

You can see the live Leaflet Map for the example, here:

[`https://mapninja.github.io/SF_Model_Tiles/`](https://mapninja.github.io/SF_Model_Tiles/)

## Using Your Service in Other Platforms

Now that you have a stable, public XYZ Tile Service, you can connect to it with any platform that supports XYZ Tiles, using your **XYZ Tile Template URL** (here's the example, URL):

`https://raw.githubusercontent.com/mapninja/SF_Model_Tiles/main/{z}/{x}/{y}.png`


Here is the XYZ Tile Service being served, as a Tile Layer, in ArcGIS Online:

https://arcg.is/1TW5580

![](images/GitHub_XYZ_Tile_Service-da026bb0.png)
