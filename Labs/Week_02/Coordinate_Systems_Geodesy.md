# Coordinate Systems, Projections & Geodesy

## Projections & Measurement Error

In this Lab Assignment, we will be exploring Projections & Geographic Coordinate Systems and the effect they have upon spatial measurements.

### Data

The datasets for this exercise include the County Boundaries as polygons and a 10-degree "Graticule" as lines. These datasets will be downloaded from Stanford's https://earthworks.stanford.edu spatial data catalog. In order to explore the difference between basic data formats, we will download one layer in shapefile format and one layer in GeoJSON.

1. **Create a Project Folder** (something like _/Week02Labs_), on your hard drive, to save the data and QGIS Project files, within, and keep all of the content from the project in one place for portability (we'll discuss this idea, more, later).

#### Download the data from:

2. Download the following datasets from Earthworks, into your **Project Folder**.

  * Please **Download** the **original shapefile**, using the **Original Shapefile** button, for the _1:1,000,000-Scale County Boundaries of the United States, 2014_ - https://earthworks.stanford.edu/catalog/stanford-wg010mf7692
  * Please **Download** the **GeoJSON** version, using the **Export Formats>GeoJSON** button for the _10-Degree Graticule Grid, World, 1:10 million, 2012_ - https://earthworks.stanford.edu/catalog/stanford-fr122tq8910

![](images/Coordinate_Systems_Geodesy-85bbc2cc.png)

3. **Browse** to where you saved these **files**, and **unzip them**, if necessary.

### Create a New Project

Now, we will create a new project file to add our data and make our calculations, within.

#### A word about the relationship between your data and your project files.

_Be aware that a Project File DOES NOT CONTAIN THE DATA THAT YOU ADD TO IT, BUT ONLY LINKS TO THE DATASETS! This idiosyncrasy of GIS Projects, in general, means that if you want to move your project, best practice is to put your datasets and project files into the same folder. It's fine to put data into a_ `/data/` _folder, if you like to be tidy, but that_ `/data/` _folder should be nested under a project folder, that also contains your project file. If you want to move the project, or share it with others, you want to move, or .zip compress, the whole project folder, with everything underneath it._

1. **Open QGIS**, if not already open.
2. **Click** on the **New Project** button ![](images/Coordinate_Systems_Geodesy-e1fd8eb8.png)
2. **Click** on the **Save** button ![](images/Coordinate_Systems_Geodesy-c1847aa3.png)
3. **Browse** to your **Project Folder** and name the project  something like `week_02_projections.qgz`  and **click Save**.

![](images/Coordinate_Systems_Geodesy-e98f5463.png)

### Add the Data

We'll explore adding data to this new project using two common methods.

#### Drag & Drop Method

1. In the **Browser Window**, which should be on the right side of the QGIS window above the Layers panel, **browse to the Project Folder** you created and saved your data and project file to and expand the folder that your data is saved in.

_HINT: If you saved your Project File to the same folder as you `/data/` folder, or you data, you should be able to simply Expand the Home folder that shows up near the top of the Browser panel. The Home folder is always the folder that the currently open project file is in._

![](images/Coordinate_Systems_Geodesy-4ed8aeab.png)

2. **Select**, **Drag-and-Drop** the `countyp010g.shp` file, into the Map Frame to add it to the project.

![](images/Coordinate_Systems_Geodesy-0804df1b.png)

3. Click the Save Button to save the change you have made to the Project.

#### Add Data Dialog Method


![](images/Coordinate_Systems_Geodesy-e068b994.png)

### Explore the Data
#### Open the Attribute Table
#### Symbolize the Data
* Use Expression  `"POP"  /  "SQ_MILES"`

### CRS

#### Check Project Properties

#### Set Ellipse & Linear Unit

### Project CRS

* Examine Project CRS
* Set Project CRS from Layer

![](https://geodesy.noaa.gov/SPCS/images/spcs83_conus_final.png)

* Change Project CRS to `ESRI:102999 [NAD_1983_2011_StatePlane_California_III_FIPS_0403]`

#### Questions
What happened to the data?

What class of projection (developable surface) do you think you are using, now?

### Attribute Table
#### Calculate `$AREA`

Static Variable

ORIG_SQKM = `$AREA/1000000`

#### Change CRS of a Layer

Export using CRS: `ESRI:102999 [NAD_1983_2011_StatePlane_California_III_FIPS_0403]`

### Attribute Table
#### Calculate `Area`

Projected Area = `area( $geometry )/1000000`

#### Calculate `$AREA`

Static Variable

ELLIP_AREA = `$AREA/1000000`

### Calculate Error

AREA_ERROR =  `"ELLIP_AREA"  -  "PROJ_AREA" `

ERRO_PCT = AREA_ERROR/ELLIP_AREA

# Altering a CRS for a Specific Region

Change CRS and map with two layouts

## Ellipsoid vs Orthometric Height

### Sample Scripts
* https://code.earthengine.google.com/?accept_repo=users/stacemaples/Earthsys144
*
