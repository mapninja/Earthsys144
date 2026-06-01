# Installing QGIS and Plugins

![](images/20260224_105258_image.png)

## Test Data

Download the test data for this lab: [stanford_art_data.zip](https://raw.githubusercontent.com/mapninja/Earthsys144/refs/heads/master/data/stanford_art_data.zip)

This zip file contains the following layers:

- `stanford_public_art.geojson` — Point locations of public art installations on Stanford campus
- `stanford_campus_irg.tif` — Infrared raster image of the Stanford campus
- `stanford_campus.geojson` — Stanford campus boundary polygon

## Introduction

QGIS (Quantum Geographic Information System) is a free, open-source desktop GIS application that will serve as our primary tool for spatial data analysis and cartography. This lab will guide you through the installation process and setup of essential plugins that extend QGIS's functionality for terrain analysis, geoprocessing, and basemap integration.

## Learning Objectives

By the end of this lab, you will be able to:

- Install QGIS on macOS, Windows, or Linux
- Create a new user profile for course work
- Install and configure essential QGIS plugins
- Install Whitebox Tools for advanced terrain analysis
- Access basemap services through QuickMapServices

## Installing QGIS

### macOS Installation

![](images/20260224_105333_image.png)

> ***NOTE: Avoid*** the use of the new "VERY EARLY RELEASE" version 4.0.0. Most of the plugins that we will need to use have not been updated for this version. At some point, soon, I expect that to change, but until then, **please use the Long-term Release (LTR) Version 3.44

1. **Download** the latest **Regular** release from: [qgis.org/en/site/forusers/download.html](https://qgis.org/en/site/forusers/download.html)**
2. **Download** the **DMG** file for macOS
3. **Double-click** the downloaded DMG file to open it
4. It will take a few minutes to decompress and validate the DMG file
5. Once the installation window opens, **drag and drop the QGIS app icon into the Applications folder icon**
6. **Launch QGIS** from your Applications folder

**Note:** As of 2024, QGIS is now properly registered with Apple, so you should not encounter security warnings during installation or first launch.

### Windows Installation

1. Visit [qgis.org/en/site/forusers/download.html](https://qgis.org/en/site/forusers/download.html)
2. Download the **QGIS Standalone Installer** (Regular release)
3. Run the installer with administrator privileges
4. Accept the default installation options
5. Launch QGIS from the Start menu

For a detailed walkthrough, see: [How to Install QGIS on Windows](https://www.geeksforgeeks.org/how-to-install-qgis-on-windows/)

### Linux Installation

1. Use your distribution's package manager
2. Add the official QGIS repository for the latest versions
3. Install using `apt`, `yum`, or equivalent package manager

For distribution-specific instructions, visit: [QGIS Installers](https://www.qgis.org/en/site/forusers/alldownloads.html)

## Setting Up Your QGIS Profile

Creating a new user profile provides a clean workspace for the course and makes troubleshooting easier if issues arise.

### Create a New User Profile

1. Launch QGIS
2. Go to **Settings > User Profiles > New Profile**

   ![](images/20260224_105708_image.png)
3. Name the profile something like `EarthSys144` or `EarthSys144-Labs` to identify it
4. Click **OK**

QGIS will restart with your new profile. This creates a fresh configuration with default settings. Your old profile (if you had one) remains available and you can switch between profiles from **Settings > User Profiles**.

## Installing Essential Plugins

### QuickMapServices Plugin

QuickMapServices provides convenient access to basemap layers from various providers (Google, Esri, OpenStreetMap, and more).

**Install the Plugin:**

1. Go to **Plugins > Manage and Install Plugins**
2. In the search box, type **QuickMapServices**
3. Select the plugin from the list and click **Install Plugin**
4. Close the Plugin Manager

![](images/20260224_105811_image.png)

**Test the Installation:**

1. Go to **Web > QuickMapServices**
2. You should see many service providers listed (Google, Esri, NASA, etc.)
3. Select **Google > Google Hybrid** to load a basemap

![](images/20260224_110022_image.png)

### SAGA

SAGA is used as a standalone application for this course. We will not install or connect a SAGA plugin inside QGIS in this guide, as QGIS integrations with SAGA have been discontiniued.

When a later lab asks you to use SAGA, launch the SAGA application directly and follow that lab's standalone instructions.

### Whitebox Tools

For this course, use the standalone Whitebox Tools setup described in [Installing Whitebox Tools](11_installing_whitebox_tools.md).

That guide shows you how to:

1. choose the correct Mac or Windows binary
2. check your Mac chip type with **About This Mac**
3. install the **WhiteboxTools for QGIS** plugin
4. point QGIS at the `whitebox_tools` executable
5. verify that the toolset is ready for later raster labs

## Troubleshooting Common Issues

### QGIS Won't Launch

- **Windows**: Try running as administrator
- **macOS**: Check that the app is in your Applications folder
- **All platforms**: Check system requirements at [qgis.org](https://qgis.org)
- Clear QGIS settings by renaming the QGIS profile folder and creating a new profile

### Plugins Not Working

- Verify QGIS version compatibility in the plugin description
- Check your internet connection (required for plugin installation)
- Try **Plugins > Manage and Install Plugins > Reinstall Plugin**
- Clear the plugin cache and restart QGIS

### Whitebox Tools Not Showing Up

- Make sure you followed [Installing Whitebox Tools](11_installing_whitebox_tools.md) and pointed QGIS at the correct executable
- If you chose the wrong Mac binary, download the one that matches your chip type
- Restart QGIS and check **Processing > Toolbox** again
- If the plugin still does not appear, reinstall **WhiteboxTools for QGIS** from **Plugins > Manage and Install Plugins**

### QuickMapServices Shows No Basemaps

- Make sure you clicked **Get Contributed Pack** in the settings
- Check your internet connection
- Try **Web > QuickMapServices > Settings > More Services > Reload** to refresh the list

## Submission

To verify your installation:

1. Create a new QGIS project
2. Load the **Google Hybrid** basemap from **Web > QuickMapServices > Google > Google Hybrid**
3. Open the **Processing Toolbox** and expand it to show the **WhiteboxTools** provider.
4. **Create a screenshot** showing:
   - QGIS interface with the Google Hybrid basemap loaded
   - Processing Toolbox panel visible with WhiteboxTools expanded
5. **Upload the screenshot** to Canvas

## Next Steps

With QGIS and essential plugins installed, you're ready to:

- Create your first maps with professional basemaps
- Perform terrain analysis using Whitebox Tools
- Begin exploring spatial data visualization and analysis

These tools will form the foundation of all the desktop GIS work we'll do throughout the course.
