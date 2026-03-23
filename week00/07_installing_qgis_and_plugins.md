# Installing QGIS and Plugins

![](images/20260224_105258_image.png)

## Introduction

QGIS (Quantum Geographic Information System) is a free, open-source desktop GIS application that will serve as our primary tool for spatial data analysis and cartography. This lab will guide you through the installation process and setup of essential plugins that extend QGIS's functionality for terrain analysis, geoprocessing, and basemap integration.

## Learning Objectives

By the end of this lab, you will be able to:

- Install QGIS on macOS, Windows, or Linux
- Create a new user profile for course work
- Install and configure essential QGIS plugins
- Set up WhiteboxTools for advanced terrain analysis
- Access basemap services through QuickMapServices

## Installing QGIS

### macOS Installation

![](images/20260224_105333_image.png)

1. **Download** the latest **Regular** (AKA: PR or Preview Release) release from: [qgis.org/en/site/forusers/download.html](https://qgis.org/en/site/forusers/download.html)
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
3. Name the profile something like `Earthsys144` or `Earthsys144-Labs` to identify it
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

**Load Additional Basemap Services:**

1. Go to **Web > QuickMapServices > Settings**
2. Click on the **More Services** tab
3. Click **Get Contributed Pack**
4. Close the Settings dialog

![](images/20260224_105839_image.png)

![](images/20260224_105937_image.png)

**Test the Installation:**

1. Go to **Web > QuickMapServices**
2. You should see many service providers listed (Google, Esri, NASA, etc.)
3. Select **Google > Google Hybrid** to load a basemap

![](images/20260224_110022_image.png)

### SAGA NextGen Plugin

SAGA (System for Automated Geoscientific Analyses) provides powerful geoprocessing tools. The SAGA NextGen plugin keeps up with the latest SAGA updates and ensures compatibility with current QGIS versions.

**Install the Plugin:**

1. Open **Plugins > Manage and Install Plugins**
2. In the **All** tab, search for **SAGA**
3. Find **Processing SAGA NextGen Provider** and click **Install Plugin**
4. Close the Plugin Manager

![](images/20260224_110102_image.png)

**Verify Installation:**

1. Go to **Processing > Toolbox** to open the Processing Toolbox panel
2. You should now see **SAGA Next Gen** as a provider alongside the original **SAGA** provider
3. When using SAGA tools, always prefer the **SAGA Next Gen** version for better compatibility

![](images/20260224_110200_image.png)

The SAGA Next Gen toolset duplicates the original SAGA provider but with improved integration for the latest QGIS versions.

### WhiteboxTools Plugin

WhiteboxTools is an excellent, high-performance toolkit particularly useful for hydrological modeling, terrain analysis, and raster processing. Installing WhiteboxTools is a two-step process: downloading the executables and then installing the QGIS plugin.

#### Step 1: Download WhiteboxTools Executables

1. **Download** the appropriate version for your operating system from: [whiteboxgeo.com/download-redirect/](https://www.whiteboxgeo.com/download-redirect/)
2. **Unzip** the downloaded archive to a stable location on your hard drive:
   - **macOS**: Consider `/Users/[username]/WBT` or `~/Applications/WBT`
   - **Windows**: Consider `C:\WBT` or `C:\Program Files\WBT`
   - **Linux**: Consider `~/WBT` or `/opt/WBT`
3. **Remember this location** - you'll need to point the QGIS plugin to it

For a video demonstration, see: [WhiteboxTools Setup Video](https://www.youtube.com/watch?v=xJXDBsNbcTg&t=3s)

#### Step 2: Install the WhiteboxTools QGIS Plugin

1. Return to **Plugins > Manage and Install Plugins**
2. Search for **WhiteboxTools**
3. Find **WhiteboxTools for QGIS** and click **Install Plugin**
4. Close the Plugin Manager

#### Step 3: Configure WhiteboxTools in QGIS

1. Go to **Processing > Toolbox** to open the Processing Toolbox
2. Click the **wrench icon** at the top to open Processing Settings
3. In the left panel, expand **Providers > WhiteboxTools**
4. **Double-click** in the box next to **WhiteboxTools executable**
5. Click the **...** button to browse to the folder where you unzipped WhiteboxTools

![](images/20260224_110439_image.png)

1. Navigate to the **WhiteboxTools executable** inside the WBT folder:

   - **macOS/Linux**: Select the `whitebox_tools` file (no extension)
   - **Windows**: Select `whitebox_tools.exe`

     ![](images/20260224_110633_image.png)

     ![](images/20260224_110722_image.png)
2. Click **Open**, then **OK** to save the settings

**Verify Installation:**

1. In the Processing Toolbox, expand the **WhiteboxTools** provider
2. You should see hundreds of tools organized by category
3. Try running a simple tool like **RandomSample** to verify functionality

**Note on WhiteboxTools Plugins:** WhiteboxTools includes additional plugin executables in the `WBT/plugins/` directory. These specialized tools extend WhiteboxTools functionality and will be used later in the course.

## Troubleshooting WhiteBox Tools

### macOS Security Configuration for WhiteboxTools

**Important for macOS users:** WhiteboxTools executables are not registered with Apple, which triggers macOS security warnings. You'll need to explicitly allow the executable to run.

If you see an error like:

```
WhiteboxTools output:
Process "whitebox_tools" failed to start. Either "whitebox_tools" is missing, 
or you may have insufficient permissions to run the program.
Execution failed after 0.04 seconds
```

![](images/20260224_111154_image.png)

Follow these steps:

1. **Navigate to your WhiteboxTools installation folder** (e.g., `/Users/[username]/WBT`)
2. **Right-click** (or Control-click) on the `whitebox_tools` executable

   ![](images/20260224_111855_image.png)
3. Select **Open** from the context menu
4. A security warning will appear - **DO NOT click "Move to Trash"**
5. **Dismiss the warning dialog**
6. Go to **System Settings > Privacy & Security**
7. Scroll down to the Security section
8. Click **Open Anyway** next to the message about `whitebox_tools`
   ![](images/20260224_111449_image.png)
9. **Confirm** through any additional security prompts
   ![](images/20260224_111523_image.png)
10. The executable will launch in Terminal - you can close the Terminal window once it opens
11. **Return to QGIS** and retest the **RandomSample** tool

This process only needs to be done once. After approval, WhiteboxTools will run normally from QGIS.

### Configure Processing Toolbox Display

1. Go to **Processing > Toolbox**
2. Right-click in the toolbox panel
3. Select **Reorganize by Type** to group similar tools together

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

### WhiteboxTools Executable Not Found

- Verify you've downloaded and unzipped the WhiteboxTools executables
- Double-check the path in **Processing > Options > Providers > WhiteboxTools**
- Make sure you're pointing to the executable file, not just the folder
- **macOS/Linux**: Ensure the executable has execute permissions (`chmod +x whitebox_tools`)

### SAGA Tools Missing or Broken

- Make sure you installed **Processing SAGA NextGen Provider**, not just the base SAGA
- Try using tools from **SAGA Next Gen** instead of the original **SAGA** provider
- Some tools may require specific data types or CRS - check tool documentation

### QuickMapServices Shows No Basemaps

- Make sure you clicked **Get Contributed Pack** in the settings
- Check your internet connection
- Try **Web > QuickMapServices > Settings > More Services > Reload** to refresh the list

## Submission

To verify your installation:

1. Create a new QGIS project
2. Load the **Google Hybrid** basemap from **Web > QuickMapServices > Google > Google Hybrid**
3. Open the **Processing Toolbox** and expand it to show **SAGA Next Gen** and **WhiteboxTools** providers
4. **Create a screenshot** showing:
   - QGIS interface with the Google Hybrid basemap loaded
   - Processing Toolbox panel visible with SAGA Next Gen and WhiteboxTools expanded
5. **Upload the screenshot** to Canvas

## Next Steps

With QGIS and essential plugins installed, you're ready to:

- Create your first maps with professional basemaps
- Perform terrain analysis using WhiteboxTools
- Apply geoprocessing algorithms from SAGA Next Gen
- Begin exploring spatial data visualization and analysis

These tools will form the foundation of all the desktop GIS work we'll do throughout the course.
