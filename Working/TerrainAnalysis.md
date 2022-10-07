# Week 7: Terrain Analysis

**What You’ll Learn:** Basic terrain analysis functions, including watershed, viewshed, and profile processing.

_You should read chapter 11 in the GIS Fundamentals textbook before performing this lab._

**<span style="text-decoration:underline;">Special for this Lab</span>**:  You will use QGIS to produce the final maps (PDFs) but will use Whitebox GAT for the analysis.   This is because Whitebox GAT is currently much better than QGIS for terrain and watershed analysis functions. There is a broader range of functions, clearer documentation, and the functions more often return the intended result. Whitebox is free and open source, and although many of the functions are available in QGIS, as we have seen in QGIS many are works in progress, and somewhat problematic in application.  


You will need to update your Java to version as required when you first attempt to install Whitbox GAT. They provide a link, or you may search for Java updates in your browser, and then pick the appropriate operating system for the latest version on the Java site, https://java.com/en/download/. Whitebox GAT software is available from:  [http://www.uoguelph.ca/~hydrogeo/Whitebox/download.shtml](http://www.uoguelph.ca/~hydrogeo/Whitebox/download.shtml)

From the unzipped folder \Whitebox_3_2_1 double click on WhiteboxGIS.jar.

**_Data_** are located in the L11.zip_,_ all in NAD83 UTM zone 15 coordinates, meters, including _Qdrift_, a GeoTiff elevation, 3m cell size, Z units in meters, and Qdrift30, a GeoTiff elevation grid, 30m cell size, Z units in meters.   There are also Whitebox GAT versions of both _Qdrif_t and _Qdrift30_ in the \L11 subdirectory.  Shape files included in the lab are _viewspot.shp, targetspot.shp and sight.shp._

**Background**

Elevation data, also known as terrain data, are important for many kinds of analysis, and are available in many forms, from many sources and resolutions.  In the U.S. there have long been available nearly nationwide data at 30 m resolution.  Since the early 2000’s these have largely been replaced by 10 m resolution DEMs, and now many parts of the country are developing higher resolution DEMs, and 1 to 3 meters, based on LiDAR data collections.

Although the most common use of DEMs is as a shaded relief background for maps, we often are interested in working with terrain data – calculating slopes, aspects, steepness or slope along profiles, viewsheds, as well as watershed and other hydrologic functions. The readings and lectures describe some of these applications, and this set of exercises introduces them.

Our first project will use the a LiDAR DEM to explore profile and viewshed tools.

Our second project focuses on watershed processing, using the Whitebox hydrology tools.

**Project 1: Raster Surfaces, Profiles, and Viewsheds**

Start **Whitebox GAT,** by clicking on WhiteboxGIS.jar, in your download/installation directory.



1. Use the Add Layer tool at the top left of the main window to add the Whitebox compatible DEM, Qdrift.dep.

![](images/TerrainAnalysis-6bfcb0ab.png)



2. Calculate the hillshade for Qdrift by Tools>Terrain Analysis>Surface Derivatives>Hillshade,

Specify 315 for the Azimuth, **25 for the Altitude**, and model shadows. Name the output file something like_ **DriftHillshade**_.  





3. Make the hillshade semi-transparent by clicking on Layers at the top of the TOC, then right clicking on the hillshade layer in the TOC, then **Layers>Layer Display Properties>Opacity**,**_ _**then**_ _**drag the alpha slider to something near 120 (figure at right, then below)**_. _**
*   _If the hillshade layer is not on top, raise it or lower the others with the raise (left) or lower layer (right) tools at the top left of the main Whitebox frame _
4. _Click on Layers at the top of the TOC, then Layer right click on the DEM, then Display Properties_>_ Properties_>_Palette, click on the button to the right of the Palette entry, and select one of the spectrum palettes, e.g., Green-Yellow-Red-White_
*   Select a palette by moving the slider on the right side of the menu up or down, clicking on a palette, then clicking on OK

You should get a display that looks approximately like the figure below.

We’ll now explore the Viewshed and Profile View options.  



*   First, add the viewspot.shp and the sight.shp shapefiles**_.  _**

This displays our view locations, a single point in the bottom left portion of the Q_drift _DEM.  This also identifies a “line of sight”, defined from the sight.shp file.  



*   Select the TOC Layers tab, right click on the sight.shp file, then click on Layer Display Properties to display a point properties menu, and alter the point size, shape, and color as you wish to make the point visible.

Now, to create a terrain profile plot:



*   Select Tools Tab in the TOC, then Terrain Analysis>Profile to set the Qdrift as the Input DEM and sight.shp as the Input Vector (see the figure below).

This gives you a Profile of the elevation change along the line of sight.

Right click in the Profile box and

Save As

_Sight_Profile.PNG_





    Create a Viewshed



*   _Close the Profile box, click on the Tools tab of the TOC, select Terrain Analysis_>_Viewshed._
*   _Specify Qdrift as the Input DEM, viewspot as the Input Viewing Station and name the output Q_View.  Set the station units to 1.8 (this is the height of the viewer in meters, about 5’10”)._

_This will display something like the figure to the right.  We want to alter this, so that the visible areas from the point (red in the image) display on top of the elevation layer, but the areas that aren’t visible from the viewing point are shown without an overly.  We need to turn the blue colored areas transparent, and perhaps change the color of the red areas to a something darker_

To highlight the viewable areas, click on the Layers button, Set the display properties for the output viewshed (see right).


    Change the colors to reversed Black/White Palette and set the Opacity near 120.


    Change the order of the display so that the viewable area is above the hillshade, in turn on top of the elevation data.

Your view should look something like that to the right, with the shaded areas the landscape that is visible from the viewer location.





    U_se the Cartographic Tool bar, found at the top center of the main Whitebox frame, to add a Title, North Arrow, Legend and Scale Bar_.   


    _Use the Insert Image to add the previously saved Profile graph.  _

To resize the Profile graph:


    _Double left click on the image, then change the Width to 300 and the Height to 150 in the Map Properties window that pops up_

Select Cartographic> Print Map and send the save as an Adobe PDF (in the Print Service Name).



<p id="gdcalert2" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image2.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert3">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image2.png "image_tooltip")


**Project 2: Watershed Functions**

Save and close your map above, if you haven’t done so already.  Then, open a new map and add the _Qdrift.dep_ DEM.

Again we’ll be using Whitebox GAT for this new project, to calculate watershed boundaries based on elevation data(See **_Video: Watershed_**).

Open **Tools**>**Hydrological Tools**>**DEM Pre-processing**. This should display the tools shown at the right. The yellow highlights at right mark the tools we will use.

We’ll be applying them in the following order:



*   Fill Depressions
*   D8 Flow Pointer
*   D8 and Rho8 Flow Accumulation (also extracts streams)
*   Snap Pour Points (on a point feature we’ll create)
*   Watershed

We use the fill command to fill and pits in the DEM, ass described in chapter 11 of GIS Fundamentals.  The simplest of watershed processing routines begins by simply filling the pits. More sophisticated ones may fill the pits, and “burn in” a stream line, along which the DEM is lowered after filling to maintain a downstream flow.



*   Apply the Fill Depressions tool from the Tools panel.  Specify the Qdrift DEM as input, and something like filled_dem for the output name.  
*   Leave the Flat Increment Value as is and click on Run.

After a minute, the filled data set should be automatically added to your view, if not, find and load it.  



*   Open the raster calculator by clicking on the Tools label <span style="text-decoration:underline;">along the top</span> <span style="text-decoration:underline;">of the main Whitebox Frame</span> (see the figure below – note this is <span style="text-decoration:underline;">NOT</span> the tools tab in the TOC).

This should open the raster calculator tool.  You build an expression by selecting and typing into the Expression window, adding layers, numbers, and operators.



*   Subtract the Qdrift DEM from your filled_dem (see figure), and



*   Display the output layer.
*   Change the palette on the output file to Black/White with Palette, setting the Nonlinearity at 20.  

Notice the location and range of the fills; it should look something like shown on the right, if not, troubleshoot and fix your work.   

Remove the difference layer to reduce clutter.



*   Apply the D8 flow Pointer, found in the TOC Tools tab, under Hydrologic Tools>Flow Pointers. Use the filled DEM as your input, and specifying a flow direction output data layer; name the output something like _f_direction_.  

As noted in the textbook, this flow direction layer will contain a set of numbers that define the cardinal and sub-cardinal direction.  

Your output from the flow direction tool should look something like the figure below, and the symbols should show 8 values from 1 to 128, corresponding to flow direction.



*   **_Now apply the D8 and Rho8 Flow Accumulation in the TOC tools_**, found in the **_Hydrological Tools_**>**_Flow Accumulation_** folder.  This finds the highest points, and accumulates the area (or number of cells) downhill, according to the flow direction.
*   **_Specify the input as f_direction, name the output raster as f_accum and select “number of upslope grid cells” as the Output Type._**

This should generate a display similar to the graphic at right. If you look closely, you will see some narrow, perhaps intermittent white lines in a dark background.

Notice the maximum and minimum value for the data layer, they will be something like 1.63 * 10^6 and 1.These numbers are the cells that drain to any given cell.  

Since these cells are 3 m by 3 m, each cell counts for 9 square meters, and there are about 111,000 cells per square kilometer.

We may use this flow accumulation grid to approximate where streams will be found on the surface, and to determine outlet points for watersheds.  

In any given small region and geology, there is usually a rough correspondence between drainage area, here measured with flow accumulation, and stream occurrence.  For example, in this region, once a drainage area of 0.45 square kilometers is reached, a stream is usually fond.  This would be 0.45 km2 * 1,000,000 m<sup>2</sup>/km<sup>2</sup> / 9 m<sup>2</sup>/cell, or about 50,000 cells.  So if we symbolize the flow accumulation layer so all cells above 50,000 are blue, and all equal or below this count are no data or no color, we will get an approximate idea of where the streams will be found (this threshold is made up for this exercise, but is probably not too far off).

You may apply the symbolization by reclassifying the flow accumulation layer into two classes, setting the middle threshold to 50,000 and the upper threshold to the maximum value.  



*   Use TOC Tools, GIS Analysis>Reclass Tools> Reclass, to reclass your flow accumulation layer into cells likely in streams, and those not.
*   Select the f_accum as the input and d_streams as the output file.
*   Enter the table values as show below

If you get “out of memory” errors, save work, reboot computer, only start Whitebox GAT and try again. If you still have problems use Tools>Stream Network Analysis>Extract Streams.  

Your d_streams should appear as shown to the right.  Dark cells have drain more than 50,000 cells, and likely show streams.

We do this reclassification to assist in locating the outlet point.  We need to ensure that the outlet point is directly on a stream cell.



We must create a pourpoint, the location on a stream at the base of a watershed.  Start by creating an empty point shapefile:



*   Use the TOC Tools tab, then File Utilities>Create New Shapefile to make a new, empty shapefile.   Name the file outlet.shp.

Arrange the _d_streams_ layer in the TOC until it is visible and just below the _outlet.shp_ layer



*   Zoom to the lower southwest quadrant of the screen and find the area shown in the image at right (there will be no green dot, navigate by the stream shapes).

This figure is zoomed to about ¼ of the DEM extent.  

You’ll want to zoom in much closer to digitize the point, so you can place it near

the center of one of the stream cells.



*   Zoom further to something like the figure to the right:

You must digitize a watershed outlet point (near the green point shown).



*   Make the outlet.shp active (select it in the Layers TOC) and
*   Click the main Whitebox frame Tools, then from the dropdown select On Screen Digitizing> Digitize New Feature (see right).  



This adds new tools at the top of the main window to Edit Features, Digitize New Features, and Delete Features.

When editing is activated, clicking on the Digitize new Feature icon will open a window to record the feature ID (FID) for a new point (see figure above-right).  Typing in a value and then clicking on OK activates the cursor for digitizing. Clicking on the displayed canvas adds a point to the outlet.shp layer.



*   Digitize your outlet.  To do this, zoom in to the desired location for an outlet on the DEM/thresholded flow accumulation layer, close enough so you can identify individual cells, and add an outlet point at the location described above.  Give it a positive FID.  
*   Toggle editing off, then right-click on outlets.shp in the TOC, left click on View Attribute Table, and verify the outlet point has been added.
*   Open the Tools tab in the TOC, and then select Hydrological Tools>Watershed Tools->Snap Pour Points.  
*   Specify Outlet as your Input Outlets File,
*   The flow accumulation as the raster you created earlier, f_accum
*   A new output raster to contain your raster pour point, name it r_pour_pt
*   An appropriate snap distance, something like 3 to 9 (about 1 to 3 cells).
*   Select Run

This should create a raster with a single cell for a value, near your digitized outlet.

Now, from the TOC Tools tab,



*   run Hydrological Tools>Watershed Tools>Watershed, with the appropriate D8 flow Pointer Raster (f_direction), the raster pour point layer you just created, (r_pour_pt), and picking an appropriate name for your output watershed.

This should create a watershed layer something like that to the right.



*   Change the color, and made the watershed raster 50% transparent.

Now convert the d_streams from a raster to a shapefile:



*   Use the TOC Tools, Conversion Tools>Raster/Vector Conversions>Raster Streams to Vector.**_  _**

Name the output something like _Derived_Streams._



*   Create a layout displaying the _Qdrift_ DEM, Watershed, _Outlet_ and _Derived_Streams_ with all the usual elements.
*   Print as a .pdf.
