# Georeferencing and Altering Projections

## Data
* Department Of The Interior General Land Office Hon. Binger Hermann, Commissioner. Map Of The State Of Wyoming. Compiled from the official Records of the General Land Office and other sources under the direction of Harry King, C.E., Chief of Drafting Division G.L.O. 1900. Compiled, Drawn and Lettered by I.P. Berthrong [cartographic material] - https://searchworks.stanford.edu/view/10453474
* Public Land Survey System of the United States, 2010 - https://earthworks.stanford.edu/catalog/stanford-td889mh1819

## Downloading the Scanned Map Image

1. In a browser, go to the following link (described above):

![](images/GeoreferencingImages-a3388300.png)

![](images/GeoreferencingImages-770e751a.png)

### Adding Data from a Web Feature Service (WFS)

1. Open a new QGIS Project and go to Layer>Add Layer>AddWFS Layer... to open the Data Source Manager
2. In the Server Connections panel, lick on the **New** Button
3. Use "Earthworks" as the Name for the connection, and `https://geowebservices.stanford.edu/geoserver/wfs` as the URL. Click OK to add the connection.

![](images/GeoreferencingImages-4f1ac719.png)

4. Back in the Data Source Manager, Click on the Connect Button to create a live connection to the Earthworks server.
5. In the search box, search for `Public Land Survey System of the United States` (You may not need the entire string to return the target layer).
6. Confirm that the layer returned has the following unique identifier: `druid:td889mh1819`


![](images/GeoreferencingImages-079634f3.png)

7. Click on the layer in the Search Return window, and then click the Add button, to add the Feature Layer Service to your QGIS Map.
8. Close the Data Source Manager window.

![](images/GeoreferencingImages-822b51ff.png)







### Using Filters to subset a layer's view

1. Examine the Attributes
![](images/GeoreferencingImages-b52fe42c.png)

2. Build the QUery

![](images/GeoreferencingImages-3a2041a1.png)

![](images/GeoreferencingImages-7faad8b8.png)



### Apply Symbology for Georeferencing Reference

1. Use Transparent Fill  


![](images/GeoreferencingImages-5fb490c5.png)
2. Set the Stroke color to something bright  

![](images/GeoreferencingImages-f56493cb.png)
### Add a basemap


## Altering a CRS for a specific application

### Examine the scanned map image

You can do this using the PURL Page Viewer, here: https://searchworks.stanford.edu/view/10453474

![](images/GeoreferencingImages-e200422a.png)

Compare the top and bottom graticule

1. What is the difference between the Longitude coordinates at the top, and the Longitude coordinates at the bottom of the map?

2. What do we call the line(s) of reference that the top and bottom of the map refer to?

3. Now take a look at the Wyoming/Montana State Line. What do you notice about it? Is it straight?

4. What is the approximate Center Longitude of Wyoming/Montana State Line?

5. What is the approximate Center Latitude?

Use your curser in QGIS to hover over the approximate center of Wyoming and see if the Coordinates match what you have answered, above.

### Altering the CRS of the Project

* Change Project CRS to USA_Contiguous_Equidistant_Conic `ESRI:102005` and observer the results

![](images/GeoreferencingImages-710d8abe.png)

What has happened to the PLSS Grid Layer?

![](images/GeoreferencingImages-a5dae868.png)

* Return to Project CRS Properties and Copy the Proj4 Text:

`+proj=eqdc +lat_0=39 +lon_0=-96 +lat_1=33 +lat_2=45 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs`

1. Go to Settings>Custom Projections
2. Add a CRS ![](images/GeoreferencingImages-af1d2c6d.png)
3.
Note the following changes in bold:

+proj=eqdc +lat_0=**43** +lon_0=-**107.5** +lat_1=**37** +lat_2=**49** +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs

You can cut & Paste the following:

`+proj=eqdc +lat_0=43 +lon_0=-107.5 +lat_1=37 +lat_2=49 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs`

![](images/GeoreferencingImages-f22eab0f.png)

Once you've created the Custom Projection, apply it:

![](images/GeoreferencingImages-600c37b6.png)

![](images/GeoreferencingImages-ef467f86.png)



Save your Project File

## Georeferencer Plugin

* Download **Original Source File** of Wyoming Map
* Launch Layers>Georeferencer Plugin

![](images/GeoreferencingImages-cddb9aa8.png)

* Load jp2 image ![](images/GeoreferencingImages-bea03193.png)


![](images/GeoreferencingImages-59d5a890.png)

* Set Transformation Settings: ![](images/GeoreferencingImages-21191db7.png)


 * 	Transformation Type: Poly2
 *  Resample: Cubic
 *  Target CRS: Your Custom Projection
 *  Save GCP Points
 *  Load in QGIS when done

![](images/GeoreferencingImages-600d9b86.png)


* Place points at corners and center, then work around for even coverage across the image ![](images/GeoreferencingImages-81727f78.png)

![](images/GeoreferencingImages-0fac269d.png)

![](images/GeoreferencingImages-54b2173e.png)

Link Georeferencer to QGIS or Vice Versa ![](images/GeoreferencingImages-d07410f9.png)

![](images/GeoreferencingImages-0dae9f4b.png)



Press the Start Georeferencing Button when enough points are placed. ![](images/GeoreferencingImages-01c707a8.png)

![](images/GeoreferencingImages-500242e1.png)

Drag the newly added image below the PLSS Layer

Check the accuracy of your georeferencing against the PLSS grid layer

![](images/GeoreferencingImages-e7488dd4.png)
