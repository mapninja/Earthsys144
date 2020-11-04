
# Introduction to Remote Sensing with Google Earth Engine

## Sign into Google Earth Engine
We'll be completing these exercises using the Earth Engine code editor: [https://code.earthengine.google.com/](https://code.earthengine.google.com/)

1. Using your _mysunetid@stanford.edu_ email, login to the Code Editor: We'll be completing these exercises using the Earth Engine code editor: [https://code.earthengine.google.com/](https://code.earthengine.google.com/).
2. Once logged in, click on this link to load the sample scripts:

https://code.earthengine.google.com/?accept_repo=users/stacemaples/GEE_Intro_RS  

## What you will do for this lab
For this Lab, you will work your way through a series of Sample Scripts, running each of them, and in some cases "uncommenting" sections of code to enable new functions, or changing code in simple ways.

The code in these scripts is heavily commented with instructions and notes about what the code is doing.

You are encouraged to alter the scripts by changing date ranges, adjusting visualization parameters, and altering the bands being used, to see what happens.

You can always reload the script, if things get broken beyond comprehension.

## An Introduction to the Code Editor Interface

![](images/Intro_RS_GEE-acba35fa.png)

It is worth noting that the Code Editor uses the javascript client API to make requests to the server.  The key point is that the Code Editor runs in the browser and all the hard processing is done on Google Servers.  Also, there are [Code Editor docs](https://developers.google.com/earth-engine/playground).



1. Editor Panel
    1. The **Editor Panel** is where you write and edit your Javascript code.
    2. Note that the **Run button** executes the code.
2. Right Panel
    1. **Console tab** for printing output and errors.
    2. **Inspector tab** for querying map results.
        Click on the map and note that _there is a scale in meters associated with the zoom level_.
    3. **Tasks tab** for managing long-running tasks.
3. Left Panel
    1. **Scripts tab** for managing your programming scripts.  These are git repos hosted at Google.
    2. **Docs tab** for accessing documentation of Earth Engine objects and methods, as well as a few specific to the Code Editor application.  This is the definitive API reference and is populated by the server.
    3. **Assets tab** for managing assets that you upload.  You get 250 GB free.
4. Interactive Map
    1. For visualizing map layer output.
    2. Note **layer controls**.
    3. Note the **geometry tools**.
5. Search Bar
    1. For finding **datasets** and ****places of interest****.
6. Get Link button
    1. A static snapshot of the Code Editor at the time the button is clicked. ** If you change the code, get a new link. ** You can email these around for easy collaboration.
7. Help Menu
    1. **User guide** - reference documentation
    2. **Help forum** - Google group for discussing Earth Engine
    3. **Shortcuts** - Keyboard shortcuts for the Code Editor
    4. **Feature Tour** - overview of the Code Editor
    5. **Feedback** - for sending feedback on the Code Editor
    6. **Suggest a dataset** - Our intention is to continue to collect datasets in our public archive and make them more accessible, so we appreciate suggestions on which new datasets we should ingest into the Earth Engine public archive.

### Script 00 - Javascript Syntax  

Beginning users (especially if new to programming) often confuse commas, periods, semi-colons, parentheses, square and curly brackets.  An understanding of these syntactic elements is key to making Earth Engine work.  Carefully read and run this script for an introduction to basic JavaScript, including Hello World!, strings, numbers, comments, lists, objects (dictionaries), functions, etc.

Run this script in the ode Editor, by clicking on it to load it into the Code Window, then click Run.

For more, you can check out the W3Schools site: https://www.w3schools.com/js/DEFAULT.asp

### Script 01 - Client vs. Server objects

_For the purpose of this lab, you won't need to understand this bit too deeply, but when you start making your own scripts and running tasks on the GEE platform, it will be important to understand these points. I've put this script here, just after the javascript syntax introduction so  that it is easlity referenced in the future. You should skim this topic, but don't worry if it doesn't make perfect sense, yet._

Everything in the previous section was a client-side object that lives in the browser.  Client-side code is useful for a great many things, and is often necessary, for example when programming [user interfaces for Earth Engine](https://developers.google.com/earth-engine/apps).  However, client-side objects are NOT to be confused with server-side objects as demonstrated by the code in this script.  

*   Read the [Client vs. Server docs](https://developers.google.com/earth-engine/client_server).  See also [the debugging doc](https://developers.google.com/earth-engine/debugging#avoid-mixing-client-functions-and-objects-with-server-functions-and-objects).

## Walking through the rest of the scripts

The Sample Scripts in the repo at the link above are heavily commented.

1. Please click on each script to load it into the Code Editor and read through the code comments.
2. Some code comments will ask you to alter the code in simple ways, or explore the GEE interface in ways that expand your knowledge of the platform.
3. Note that many of the functions and methods you are exploring can be applied equally to other datasets in the Google Earth Engine Data Catalog

## To turn in:
1. Work you way through the entire set of scripts, then **go to the Google Earth Engine Data Catalog** by clicking on the dropdown arrow next to  the Search bar:

![](images/Intro_RS_GEE-bb2408c1.png)

2. **Explore** as much of the data catalog as you are interested in, then select a dataset you are interested in and go to it's page
3. **Explore the Metadata for the dataset**, particularly the data type and ranges, as well as the band avaialble.
4. **Answer the following in a TXT document**:
   1. What is the Earth Engine Name of the dataset? (HINT: Earth Engine Snippet)
   2. What is the Pixel Resolution of the dataset?
   3. What date range is the data available for?
5. **Scroll to the bottom of the page** for your dataset and click on the **Open in Code Editor button** to open the sample  script  for this dataset, in your Code Editor window.
6. **Run the Script**
7. **[Optional]** If you so desire, make some changes to the code to alter the setCenter() function, date filters, vis params, etc..., and create comments to highlight what changes you have made.
8. Save your script so you can return to it, whenver you want.
9. **Click** on the **Get Link button** to see how you can copy a link to your script and share it.

![](images/Intro_RS_GEE-bf3427b7.png)

10. Copy the link and paste it into a **New Browser Tab** to see how scripts are shared.
11. Add the script link to your TXT document, and upload to Canvas for full credit.  

### Sample HW Submission:

The content or your Homework submission should look something like this:

```
Week 8 - Google Earth ENgine  - Stace Maples

1. What is the Earth Engine Name of the dataset? (HINT: Earth Engine Snippet):

ee.ImageCollection("USDA/NASS/CDL")

2. What is the Pixel Resolution of the dataset?

30 meters

3. What date range is the data available for?

1997-01-01T00:00:00 - 2019-01-01T00:00:00

4. Shared Script: https://code.earthengine.google.com/d592975ab22732d8326a858eb9948c90
```



## Where to go next…

1. Read through the [Earth Engine docs](https://developers.google.com/earth-engine/). Read through the [Introduction](https://developers.google.com/earth-engine/) and [Get Started](https://developers.google.com/earth-engine/getstarted) sections,  work your way through the [API tutorials](https://developers.google.com/earth-engine/tutorials), and then dive deeper into any concepts that you are interested in. From the Javascript Playground, the docs can be accessed via the menu **Help -> User guide**.
2. Join and participate in the [Google Earth Engine Developers](https://groups.google.com/forum/#!forum/google-earth-engine-developers) forum, where Earth Engine users post and answer questions about the platform.
3. Check out the content from the recent Google Geo4Good Summit 2020, including mini-workshops on many Earth Engine tips, tricks and capabilities. https://earthoutreachonair.withgoogle.com/events/geoforgood20
