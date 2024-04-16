# Week 01 Lab 01a - Doing a Clean QGIS Installation (on Mac & Windows)

Here, I describe the installation of QGIS on a Mac, in particular, because of some of the security settings obstacles that the MacOS presents. The QGIS installer for Windows is straightforward, and fairly self-explanatory.

## For Windows Users

Here is the main download link for QGIS, where you can find the Mac, Windows and Linux versions, in one place:  
<https://www.qgis.org/en/site/forusers/download.html>

Here's a recent walkthrough of the Windows installation process:  
<https://www.geeksforgeeks.org/how-to-install-qgis-on-windows/>

Note that once you have QGIS installed, adding the plugins, etc... will progress in nearly identical steps.

This workflow will guide you through:

* Installing QGIS PR (Pre-release) on a Mac
* Installing SAGANP to improve SAGA tools integration with the latest Pre-Release version of QGIS
* Installing WhiteboxTools Plugin, to support WhiteboxTools for raster, through the QGIS interface.
* Install QuickMapServices and Import basemap Services.

# Installing QGIS for Mac  
## Cleaning Up (if you already have a previous version of QGIS)

We will be using the latest Pre-Release version of QGIS, which should have all the latest tools and functionality we want. If you have previously installed QGIS PR, you will need to delete the QGIS.app from your Applications Folder, before installing with the directions, below.

`Note: QGIS PR and QGIS LTR (Long-Term Release) are released with different *.app names, so that you can run the LTR and PR versions of the software on the same machine. If the *.app in your Applications Folder is named QGIS-LTR.app, you will not need to delete it, since the PR version installs as QGIS.app`

1. Browse to your Application folder, in Finder
2. Right-click on the QGIS.app app, and 'Move to Trash'

![](images/CleanQGISInstallationforMac-4d0f9f91_reduce-drop-shadow_reduce-drop-shadow.png)

## Install QGIS PR

1. **Download** the latest **PR** from: <https://www.qgis.org/en/site/forusers/download.html>
2. **Right-click** the **DMG** File and select **Open**
3. It will take a few minutes to decompress and validate the DMG file.
4. Once the Installation Package opens, **Drag-and-drop the QGIS app icon, into the Applications Folder icon**, to install the app.
![](images/CleanQGISInstallationforMac-71de0185_reduce-drop-shadow.png)


## Launching QGIS, the 1st Time

QGIS is not yet notarized as required by macOS Catalina+ (10.15) security rules.

1. On first launch, please **right-click on the QGIS app icon, hold down the Option key, then choose Open**. This should result in a warning pop-up:

![](images/Screenshot 2024-03-04 at 1.11.56 PM.png)


2.**Click Cancel**, to dismiss the error.  
3. Open your **Mac System Preferences**, and go to the **Security & Privacy settings**.  
4. Click on the **General tab** at the top, and you should see something like this:

![](images/Screenshot 2024-03-04 at 1.12.50 PM.png)

5. Click **Open Anyway**, then click **Open** at the next warning:

![](images/CleanQGISInstallationforMac-e1f199b4_reduce-drop-shadow.png)

6. QGIS should launch, at this point, but if not, return to your Applications folder and try opening QGIS.app, again. This time, it should work.

![](images/Screenshot 2024-03-04 at 1.32.51 PM.png)

## Getting QGIS ready to use

### Create a New User Profile

This step will create a new User Profile, which is  useful when troubleshooting weird errors, or after an upgrade. This process will create a new, clean User Profile, and reset to the installation default settings for QGIS. Plugins and customizations will need to be reinstalled. It will not delete your old profile, and you can move back and forth between profiles, from the **Settings>User Profiles>** menu.

1. In the QGIS App, go to **Settings>User Profiles>New Profile**...
2. Name the profile something like `Earthsys144 - Labs` to identify it,  and **click OK**.

![](images/CleanQGISInstallationforMac-7d8fffc6_reduce-drop-shadow.png)

![](images/Screenshot 2024-03-04 at 1.35.14 PM.png)

## Install Plugins

### QuickMapServices

QuickMapServices Plugin provides a convenient catalog of tiled map services for use as basemaps and reference layers, in QGIS.

1. go to **Plugins>Manage and Install** and search for **QuickMapServices** and install the plugin.

![](images/Screenshot 2024-03-04 at 1.37.18 PM.png)

2. **Close** the **Plugin Manager** and go to **Web>QuickMapServices>Settings**
3. **Click** on the **More Services** tab, then **Get Contributed Pack**

![](images/CleanQGISInstallationforMac-c46e4e28_reduce-drop-shadow.png)

4. Close the Settings Dialog after the new services are loaded and return to **Web>QuickMapServices** to see all the new services available.

### SAGANP plugin

![](images/CleanQGISInstallationforMac-f09e68a8_reduce-drop-shadow.png)

Saga tools are useful, but as a project separate from QGIS they often introduce breaking changes to the GUI in QGIS by changing the names of tool parameters, etc... SAGANP is an experimental plugin, which attempts to keep up with these changes, outside the less regular releases of QGIS, and will reduce the number of issues you have using the SAGA tools.

1. Return to the **All** tab in the **Plugins Dialog** and search for **SAGA** to find the "**Processing SAGA NextGen Provider**" plugin, and **install** it.
2. This should add a new **SAGA Next Gen toolset**, which duplicates the SAGA provider. When using any tools from the SAGA toolkit, you should always prefer the SAGANG version of the tool.
![](./images/CleanQGISInstallationforMac-3bc5b422_reduce-drop-shadow.png)

### WhiteboxTools plugin (If you are feeling adventurous!)

For a video demonstrating how to setup the plugin, please see [https://www.youtube.com/watch?v=xJXDBsNbcTg&t=3s](https://www.youtube.com/watch?v=xJXDBsNbcTg&t=3s)

**Whiteboxtools** is an excellent, performant and stable set of tools, particularly useful for hydrological modeling, terrain analysis, and map algebra. You can integrate the WBT tools in QGIS through the use of another plugin.

1. First, **download** the appropriate version of **Whiteboxtools** for your operating system from <https://www.whiteboxgeo.com/download-redirect/> and  

2. **upzip** the resulting archive to somewhere stable on your hard drive (I put mine at `/Users/maples/WBT`).  

    If you are a **Windows User**, I would consider putting it in a folder somewhere lik![](data:image/jpeg;base64,IyBDb29yZGluYXRlIFN5c3RlbXMsIFByb2plY3Rpb25zICYgR2VvZGVzeQoKIyMgUHJvamVjdGlvbnMgJiBNZWFzdXJlbWVudCBFcnJvcgoKSW4gdGhpcyBMYWIgQXNzaWdubWVudCwgd2Ugd2lsbCBiZSBleHBsb3JpbmcgUHJvamVjdGlvbnMgJiBHZW9ncmFwaGljIENvb3JkaW5hdGUgU3lzdGVtcyBhbmQgdGhlIGVmZmVjdCB0aGV5IGhhdmUgdXBvbiBzcGF0aWFsIG1lYXN1cmVtZW50cy4KCiMjIyBEYXRhCgpUaGUgZGF0YXNldHMgZm9yIHRoaXMgZXhlcmNpcUgaW5jbHVkZSB0aGUgQ291bnR5IEJvdW5kYXJpZXMgYXMgcG9seWdvbnMgYW5kIGEgMTAtZGVncmVlICJHcmF0aWN1bGUiIGFzIGxpbmVzLiBUaGVzZSBkYXRhc2V0cyB3aWxsIGJlIGRvd25sb2FkZWQgZnJvbSBTdGFuZm9yZCdzIGh0dHBzOi8vZWFydGh3b3Jrcy5zdGFuZm9yZC5lZHUgc3BhdGlhbCBkYXRhIGNhdGFsb2cuIEluIG9yZGVyIHRvIGV4cGxvcmUgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBiYXNpYyBkYXRhIGZvcm1hdHMsIHdlIHdpbGwgZG93bmxvYWQgb25lIGxheWVyIGluIHNoYXBlZmlsZSBmb3JtYXQgYW5kIG9uZSBsYXllciBpbiBHZW9KU09OLgoKMS4gKipDcmVhdGUgYSBQcm9qZWN0IEZvbGRlcioqIChzb21ldGhpbmcgbGlrZSBfL1dlZWswMkxhYnNfKSwgb24geW91ciBoYXJkIGRyaXZlLCB0byBzYXZlIHRoZSBkYXRhIGFuZCBRR0lTIFByb2plY3QgZmlsZXMsIHdpdGhpbiwgYW5kIGtlZXAgYWxsIG9mIHRoZSBjb250ZW50IGZyb20gdGhlIHByb2plY3QgaW4gb25lIHBsYWNlIGZvciBwb3J0YWJpbGl0eSAod2UnbGwgZGlzY3VzcyB0aGlzIGlkZWEsIG1vcmUsIGxhdGVyKS4KCiMjIyMgRG93bmxvYWQgdGhlIGRhdGEgZnJvbToKCjIuIERvd25sb2FkIHRoZSBmb2xsb3dpbmcgZGF0YXNldHMgZnJvbSBFYXJ0aHdvcmtzLCBpbnRvIHlvdXIgKipQcm9qZWN0IEZvbGRlcioqLgoKICAqIFBsZWFzZSAqKkRvd25sb2FkKiogdGhlICoqb3JpZ2luYWwgc2hhcGVmaWxlKiosIHVzaW5nIHRoZSAqKk9yaWdpbmFsIFNoYXBlZmlsZSoqIGJ1dHRvbiwgZm9yIHRoZSBfMToxLDAwMCwwMDAtU2NhbGUgQ291bnR5IEJvdW5kYXJpZXMgb2YgdGhlIFVuaXRlZCBTdGF0ZXMsIDIwMTRfIC0gaHR0cHM6Ly9lYXJ0aHdvcmtzLnN0YW5mb3JkLmVkdS9jYXRhbG9nL3N0YW5mb3JkLXdnMDEwbWY3NjkyCiAgKiBQbGVhc2UgKipEb3dubG9hZCoqIHRoZSAqKkdlb0pTT04qKiB2ZXJzaW9uLCB1c2luZyB0aGUgKipFeHBvcnQgRm9ybWF0cz5HZW9KU09OKiogYnV0dG9uIGZvciB0aGUgXzEwLURlZ3JlZSBHcmF0aWN1bGUgR3JpZCwgV29ybGQsIDE6MTAgbWlsbGlvbiwgMjAxMl8gLSBodHRwczovL2VhcnRod29ya3Muc3RhbmZvcmQuZWR1L2NhdGFsb2cvc3RhbmZvcmQtZnIxMjJ0cTg5MTAKCiFbXShpbWFnZXMvQ29vcmRpbmF0ZV9TeXN0ZW1zX0dlb2Rlc3ktODViYmMyY2MucG5nKQoKMy4gKipCcm93c2UqKiB0byB3aGVyZSB5b3Ugc2F2ZWQgdGhlc2UgKipmaWxlcyoqLCBhbmQgKip1bnppcCB0aGVtKiosIGlmIG5lY2Vzc2FyeS4KCiMjIyBDcmVhdGUgYSBOZXcgUHJvamVjdAoKTm93LCB3ZSB3aWxsIGNyZWF0ZSBhIG5ldyBwcm9qZWN0IGZpbGUgdG8gYWRkIG91ciBkYXRhIGFuZCBtYWtlIG91ciBjYWxjdWxhdGlvbnMsIHdpdGhpbi4KCiMjIyMgQSB3b3JkIGFib3V0IHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiB5b3VyIGRhdGEgYW5kIHlvdXIgcHJvamVjdCBmaWxlcy4KCl9CZSBhd2FyZSB0aGF0IGEgUHJvamVjdCBGaWxlIERPRVMgTk9UIENPTlRBSU4gVEhFIERBVEEgVEhBVCBZT1UgQUREIFRPIElULCBCVVQgT05MWSBMSU5LUyBUTyBUSEUgREFUQVNFVFMhIFRoaXMgaWRpb3N5bmNyYXN5IG9mIEdJUyBQcm9qZWN0cywgaW4gZ2VuZXJhbCwgbWVhbnMgdGhhdCBpZiB5b3Ugd2FudCB0byBtb3ZlIHlvdXIgcHJvamVjdCwgYmVzdCBwcmFjdGljZSBpcyB0byBwdXQgeW91ciBkYXRhc2V0cyBhbmQgcHJvamVjdCBmaWxlcyBpbnRvIHRoZSBzYW1lIGZvbGRlci4gSXQncyBmaW5lIHRvIHB1dCBkYXRhIGludG8gYV8gYC9kYXRhL2AgX2ZvbGRlciwgaWYgeW91IGxpa2UgdG8gYmUgdGlkeSwgYnV0IHRoYXRfIGAvZGF0YS9gIF9mb2xkZXIgc2hvdWxkIGJlIG5lc3RlZCB1bmRlciBhIHByb2plY3QgZm9sZGVyLCB0aGF0IGFsc28gY29udGFpbnMgeW91ciBwcm9qZWN0IGZpbGUuIElmIHlvdSB3YW50IHRvIG1vdmUgdGhlIHByb2plY3QsIG9yIHNoYXJlIGl0IHdpdGggb3RoZXJzLCB5b3Ugd2FudCB0byBtb3ZlLCBvciAuemlwIGNvbXByZXNzLCB0aGUgd2hvbGUgcHJvamVjdCBmb2xkZXIsIHdpdGggZXZlcnl0aGluZyB1bmRlcm5lYXRoIGl0Ll8KCjEuICoqT3BlbiBRR0lTKiosIGlmIG5vdCBhbHJlYWR5IG9wZW4uCjIuICoqQ2xpY2sqKiBvbiB0aGUgKipOZXcgUHJvamVjdCoqIGJ1dHRvbiAhW10oaW1hZ2VzL0Nvb3JkaW5hdGVfU3lzdGVtc19HZW9kZXN5LWUxZmQ4ZWI4LnBuZykKMi4gKipDbGljayoqIG9uIHRoZSAqKlNhdmUqKiBidXR0b24gIVtdKGltYWdlcy9Db29yZGluYXRlX1N5c3RlbXNfR2VvZGVzeS1jMTg0N2FhMy5wbmcpCjMuICoqQnJvd3NlKiogdG8geW91ciAqKlByb2plY3QgRm9sZGVyKiogYW5kIG5hbWUgdGhlIHByb2plY3QgIHNvbWV0aGluZyBsaWtlIGB3ZWVrXzAyX3Byb2plY3Rpb25zLnFnemAgIGFuZCAqKmNsaWNrIFNhdmUqKi4KCiFbXShpbWFnZXMvQ29vcmRpbmF0ZV9TeXN0ZW1zX0dlb2Rlc3ktZTk4ZjU0NjMucG5nKQoKIyMjIEFkZCB0aGUgRGF0YQoKV2UnbGwgZXhwbG9yZSBhZGRpbmcgZGF0YSB0byB0aGlzIG5ldyBwcm9qZWN0IHVzaW5nIHR3byBjb21tb24gbWV0aG9kcy4KCiMjIyMgRHJhZyAmIERyb3AgTWV0aG9kCgoxLiBJbiB0aGUgKipCcm93c2VyIFdpbmRvdyoqLCB3aGljaCBzaG91bGQgYmUgb24gdGhlIHJpZ2h0IHNpZGUgb2YgdGhlIFFHSVMgd2luZG93IGFib3ZlIHRoZSBMYXllcnMgcGFuZWwsICoqYnJvd3NlIHRvIHRoZSBQcm9qZWN0IEZvbGRlcioqIHlvdSBjcmVhdGVkIGFuZCBzYXZlZCB5b3VyIGRhdGEgYW5kIHByb2plY3QgZmlsZSB0byBhbmQgZXhwYW5kIHRoZSBmb2xkZXIgdGhhdCB5b3VyIGRhdGEgaXMgc2F2ZWQgaW4uCgpfSElOVDogSWYgeW91IHNhdmVkIHlvdXIgUHJvamVjdCBGaWxlIHRvIHRoZSBzYW1lIGZvbGRlciBhcyB5b3UgYC9kYXRhL2AgZm9sZGVyLCBvciB5b3UgZGF0YSwgeW91IHNob3VsZCBiZSBhYmxlIHRvIHNpbXBseSBFeHBhbmQgdGhlIEhvbWUgZm9sZGVyIHRoYXQgc2hvd3MgdXAgbmVhciB0aGUgdG9wIG9mIHRoZSBCcm93c2VyIHBhbmVsLiBUaGUgSG9tZSBmb2xkZXIgaXMgYWx3YXlzIHRoZSBmb2xkZXIgdGhhdCB0aGUgY3VycmVudGx5IG9wZW4gcHJvamVjdCBmaWxlIGlzIGluLl8KCiFbXShpbWFnZXMvQ29vcmRpbmF0ZV9TeXN0ZW1zX0dlb2Rlc3ktNGVkOGFlYWIucG5nKQoKMi4gKipTZWxlY3QqKiwgKipEcmFnLWFuZC1Ecm9wKiogdGhlIGBjb3VudHlwMDEwZy5zaHBgIGZpbGUsIGludG8gdGhlIE1hcCBGcmFtZSB0byBhZGQgaXQgdG8gdGhlIHByb2plY3QuCgohW10oaW1hZ2VzL0Nvb3JkaW5hdGVfU3lzdGVtc19HZW9kZXN5LTA4MDRkZjFiLnBuZykKCjMuIENsaWNrIHRoZSBTYXZlIEJ1dHRvbiB0byBzYXZlIHRoZSBjaGFuZ2UgeW91IGhhdmUgbWFkZSB0byB0aGUgUHJvamVjdC4KCiMjIyMgQWRkIERhdGEgRGlhbG9nIE1ldGhvZAoKCiFbXShpbWFnZXMvQ29vcmRpbmF0ZV9TeXN0ZW1zX0dlb2Rlc3ktZTA2OGI5OTQucG5nKQoKIyMjIEV4cGxvcmUgdGhlIERhdGEKIyMjIyBPcGVuIHRoZSBBdHRyaWJ1dGUgVGFibGUKIyMjIyBTeW1ib2xpemUgdGhlIERhdGEKKiBVc2UgRXhwcmVzc2lvbiAgYCJQT1AiICAvICAiU1FfTUlMRVMiYAoKIyMjIENSUwoKIyMjIyBDaGVjayBQcm9qZWN0IFByb3BlcnRpZXMKCiMjIyMgU2V0IEVsbGlwc2UgJiBMaW5lYXIgVW5pdAoKIyMjIFByb2plY3QgQ1JTCgoqIEV4YW1pbmUgUHJvamVjdCBDUlMKKiBTZXQgUHJvamVjdCBDUlMgZnJvbSBMYXllcgoKIVtdKGh0dHBzOi8vZ2VvZGVzeS5ub2FhLmdvdi9TUENTL2ltYWdlcy9zcGNzODNfY29udXNfZmluYWwucG5nKQoKKiBDaGFuZ2UgUHJvamVjdCBDUlMgdG8gYEVTUkk6MTAyOTk5IFtOQURfMTk4M18yMDExX1N0YXRlUGxhbmVfQ2FsaWZvcm5pYV9JSUlfRklQU18wNDAzXWAKCiMjIyMgUXVlc3Rpb25zCldoYXQgaGFwcGVuZWQgdG8gdGhlIGRhdGE/CgpXaGF0IGNsYXNzIG9mIHByb2plY3Rpb24gKGRldmVsb3BhYmxlIHN1cmZhY2UpIGRvIHlvdSB0aGluayB5b3UgYXJlIHVzaW5nLCBub3c/CgojIyMgQXR0cmlidXRlIFRhYmxlCiMjIyMgQ2FsY3VsYXRlIGAkQVJFQWAKClN0YXRpYyBWYXJpYWJsZQoKT1JJR19TUUtNID0gYCRBUkVBLzEwMDAwMDBgCgojIyMjIENoYW5nZSBDUlMgb2YgYSBMYXllcgoKRXhwb3J0IHVzaW5nIENSUzogYEVTUkk6MTAyOTk5IFtOQURfMTk4M18yMDExX1N0YXRlUGxhbmVfQ2FsaWZvcm5pYV9JSUlfRklQU18wNDAzXWAKCiMjIyBBdHRyaWJ1dGUgVGFibGUKIyMjIyBDYWxjdWxhdGUgYEFyZWFgCgpQcm9qZWN0ZWQgQXJlYSA9IGBhcmVhKCAkZ2VvbWV0cnkgKS8xMDAwMDAwYAoKIyMjIyBDYWxjdWxhdGUgYCRBUkVBYAoKU3RhdGljIFZhcmlhYmxlCgpFTExJUF9BUkVBID0gYCRBUkVBLzEwMDAwMDBgCgojIyMgQ2FsY3VsYXRlIEVycm9yCgpBUkVBX0VSUk9SID0gIGAiRUxMSVBfQVJFQSIgIC0gICJQUk9KX0FSRUEiIGAKCkVSUk9fUENUID0gQVJFQV9FUlJPUi9FTExJUF9BUkVBCgojIEFsdGVyaW5nIGEgQ1JTIGZvciBhIFNwZWNpZmljIFJlZ2lvbgoKQ2hhbmdlIENSUyBhbmQgbWFwIHdpdGggdHdvIGxheW91dHMKCiMjIEVsbGlwc29pZCB2cyBPcnRob21ldHJpYyBIZWlnaHQKCiMjIyBTYW1wbGUgU2NyaXB0cwoqIGh0dHBzOi8vY29kZS5lYXJ0aGVuZ2luZS5nb29nbGUuY29tLz9hY2NlcHRfcmVwbz11c2Vycy9zdGFjZW1hcGxlcy9FYXJ0aHN5czE0NAoqCg==)e `C:/WBT`

3. **Return** to the **Plugins Manager** and search for "`whitebox`" to find the "WhiteboxTools for Processing" plugin, and install it.
4. **Return** to the **Processing Toolbox Settings** and expand  Providers>WhiteboxTools, then double-click in the box next to **WhiteboxTools** executable to use the ... button to browse to the folder where your `whitebox_tools` executable is, as shown below:  

![](images/CleanQGISInstallationforMac-7ec82a0a_reduce-drop-shadow.png)

![](images/CleanQGISInstallationforMac-80320468_reduce-drop-shadow.png)

You'll get another warning about unsigned software, as when you first install QGIS. The Procedure is essentially the same:

1. Go to **Mac>System Preferences>Security & Privacy>General**, and click on **Open Anyway**.

![](images/CleanQGISInstallationforMac-e958c013_reduce-drop-shadow.png)

Note that **WhiteboxTools** has some plugins that you can find under the `WBT/plugins/` directory, wherever you saved it. **These programs will likely not work properly, until you use the above method on each individual plugin executable**, which are the files with the blackbox icons, in the image, below. We will be making use of these tools, later in the quarter, so it is good to know how to troubleshoot them, if they don't initially work properly.

![](images/CleanQGISInstallationforMac-9ea369b3_reduce-drop-shadow.png)

# To Turn In

4. Return to **Web>QuickMapServices** to see all the new services available.
5. Select the **Google>Hybrid** basemap
6. **Create a Screenshot** image of your desktop, showing QGIS, with the Google Hybrid basemap loaded, and upload it to Canvas.
