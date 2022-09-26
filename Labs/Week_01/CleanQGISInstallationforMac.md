# Week 01 Lab 01a - Doing a Clean QGIS Installation (on Mac)

Here, I describe the installation of QGIS on a Mac, in particular, because of some of the security settings obstacles that the MacOS present. The QGIS installer for WIndows is straightforward, and fairly self-explanatory.

Here is the main download link for QGIS, where you can find the Mac, Windows and Linux versions, in one place:

https://www.qgis.org/en/site/forusers/download.html




Note that once you have QGIS installed, adding the plugins, etc... will progress in nearly identical steps.

This workflow will guide you through:

* Installing QGIS PR (Pre-release) on a Mac
* Installing SAGANP to improve SAGA tools integration with the latest Pre-Release version of QGIS
* Installing WhiteboxTools Plugin, to support WhiteboxTools for raster, through the QGIS interface.
* Install QuickMapServices and Import basemap Services.

## Cleaning Up (if you already have a previous version of QGIS)

We will be using the latest Pre-Release version of QGIS, which should have all the latest tools and functionality we want. If you have previously installed QGIS PR, you will need to delete the QGIS.app from your Applications Folder, before installing with the directions, below.

`Note: QGIS PR and QGIS LTR (Long-Term Release) are released with different *.app names, so that you can run the LTR and PR versions of the software on the same machine. If the *.app in your Applications Folder is named QGIS-LTR.app, you will not need to delete it, since the PR version installs as QGIS.app`


1. Browse to your Application folder, in Finder
2. Right-click on the QGIS.app app, and 'Move to Trash'

![](images/CleanQGISInstallationforMac-4d0f9f91.png)


## Install QGIS PR

1. Download the latest PR from: https://qgis.org/downloads/macos/qgis-macos-pr.dmg
2. Right-click the DMG File and select Open
3. It will take a few minutes to decompress and validate the DMG file.
4. Once the Installation Package opens, Drag-and-drop the QGIS app icon, into the Applications Folder icon, to install the app.
![](images/CleanQGISInstallationforMac-71de0185.png)
5.

## Launching QGIS, the 1st Time.

QGIS is not yet notarized as required by macOS Catalina+ (10.15) security rules.
1. On first launch, please right-click on the QGIS app icon, hold down the Option key, then choose Open. This should result in a warning pop-up:

![](images/CleanQGISInstallationforMac-9939f1f0.png)

2. Click OK, to dismiss the error.
3. Open your Mac System Preferences, and go to the Security & Privacy settings.
4. Click on the General tab at the top, and you should see something like this:

![](images/CleanQGISInstallationforMac-d49a655c.png)

5. Click Open Anyway, then click Open at the next warning:

![](images/CleanQGISInstallationforMac-e1f199b4.png)

6. QGIS should launch, at this point, but if not, return to your Applications folder and try opening QGIS.app, again. This time, it should work.

![](images/CleanQGISInstallationforMac-ed229237.png)

## Getting QGIS ready to use

### Create a New User Profile

This step will create a new User Profile, which is  useful when troubleshooting weird errors, or after an upgrade. This process will create a new, clean User Profile, and reset to the installation default settings for QGIS. Plugins and customizations will need to be reinstalled. It will not delete your old profile, and you can move back and forth between profiles, from the Settings>User Profiles> menu.

1. In the QGIS App, go to Settings>User Profiles>New Profile...
2. Name the profile something to identify it,  and click OK.

![](images/CleanQGISInstallationforMac-7d8fffc6.png)

## Install Plugins

Skip this section. [I've left it here, in hopes that eventually, Alex Buy's excellent plugins site will return.](https://plugins.bruy.me/)
```
1. Open your new installation of **QGIS** and go to **Plugins>Manage and Install**
2. Go to **Settings** and check the option to **Show also Experimental plugins**
3. **Scroll down** and click on the **Add...** button and add "**Alex's QGIS Python Plugins**" using the URL: https://plugins.bruy.me/plugins/plugins.xml
```

### QuickMapServices

QuickMapServices Plugin provides a convenient catalog of tiled map services for use as basemaps and reference layers, in QGIS.

1. go to **Plugins>Manage and Install** and search for **QuickMapServices** and install the plugin.
2. **Close** the **Plugin Manager** and go to **Web>QuickMapServices>Settings**
3. **Click** on the **More Services** tab, then **Get Contributed Pack**


![](images/CleanQGISInstallationforMac-c46e4e28.png)

4. Close the Settings Dialog after the new services are loaded and return to **Web>QuickMapServices** to see all the new services available.

### SAGANP plugin


![](images/CleanQGISInstallationforMac-f09e68a8.png)

Saga tools are useful, but as a project separate from QGIS they often introduce breaking changes to the GUI in QGIS by changing the names of tool parameters, etc... SAGANP is an experimental plugin, which attempts to keep up with these changes, outside the less regular releases of QGIS, and will reduce the number of issues you have using the SAGA tools.

1. Return to the **All** tab in the Plugins Dialog and search for **SAGA** to find the "Processing SAGA NextGen Provider" plugin, and install it.
2. This should add a new SAGA Next Gen toolset, which duplicates the SAGA provider. When using any tools from the SAGA toolkit, you should always prefer the SAGANP version of the tool.
![](./images/CleanQGISInstallationforMac-3bc5b422.png)

### WhiteboxTools plugin (If you are feeling adventurous!)

**Whiteboxtools** is an excellent, performant and stable set of tools, particularly useful for hydrological modeling, terrain analysis, and map algebra. You can integrate the WBT tools in QGIS through the use of another plugin.
This assumes you have downloaded **Whiteboxtools** from https://jblindsay.github.io/ghrg/WhiteboxTools/index.html and have upzipped the resulting archive to somewhere stable on your hard drive (I put mine at `/Users/maples/WBT`).

1. **Return** to the **Plugins Manager** and search for "`whitebox`" to find the "WhiteboxTools for Processing" plugin, and install it.
2. **Return** to the **Processing Toolbox Settings** and expand  Providers>WhiteboxTools, then double-click in the box next to WhiteboxTools executable to use the ... button to browse to the folder where your WhiteboxTools executable is, as shown below:  

![](images/CleanQGISInstallationforMac-7ec82a0a.png)

![](images/CleanQGISInstallationforMac-80320468.png)

You'll get another warning about unsigned software, as wehn you first install QGIS. The Procedure is essentially the same:

1. Go to **Mac>System Preferences>Security & Privacy>General**, and click on **Open Anyway**.

![](images/CleanQGISInstallationforMac-e958c013.png)

Note that WhiteboxTools has some plugins that you can find under the `WBT/plugins/` directory, wherever you saved it. These programs will likely not work properly, until you use the above method on each individual plugin executable, which are the files with the blackbox icons, in the image, below. We will be making use of these tools, later in the quarter, so it is good to know how to troubleshoot them, if they don't initially work properly.

![](images/CleanQGISInstallationforMac-9ea369b3.png)

# To Turn In

4. Return to **Web>QuickMapServices** to see all the new services available.
5. Select the Google>Hybrid basemap
6. Create a Screenshot image of your desktop, showing QGIS, with the Google Hybrid basemap loaded, and upload it to Canvas.