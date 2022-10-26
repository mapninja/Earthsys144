# Introduction to Remote Sensing with Google Earth Engine


## Sign into Google Earth Engine

We'll be completing these exercises using the Earth Engine code editor: [https://code.earthengine.google.com/](https://code.earthengine.google.com/)

1. Using your _mysunetid@stanford.edu_ email, login to the Code Editor: We'll be completing these exercises using the Earth Engine code editor: [https://code.earthengine.google.com/](https://code.earthengine.google.com/).
2. Once logged in, click on this link to load the sample scripts:

[https://code.earthengine.google.com/?accept_repo=users/stacemaples/SGC-EE101](https://code.earthengine.google.com/?accept_repo=users/stacemaples/SGC-EE101)


## What you will do for this lab

For this Lab, you will work your way through a series of Sample Scripts, running each of them, and in some cases "uncommenting" sections of code to enable new functions, or changing code in simple ways.

The code in these scripts is heavily commented with instructions and notes about what the code is doing.

You are encouraged to alter the scripts by changing date ranges, adjusting visualization parameters, and altering the bands being used, to see what happens.

You can always reload the script, if things get broken beyond comprehension.

**_I suggest that you open up the YouTube Video for my Google Earth Engine Workshop, and watch it, pausing at points where you are asked to uncomment or change the code in Code Editor._**

**_You can find my video-walkthrough, here:_**

**_[https://storymaps.arcgis.com/stories/cdfc91d050634a5294ac897acc959d55](https://storymaps.arcgis.com/stories/cdfc91d050634a5294ac897acc959d55)_**


## An Introduction to the Code Editor Interface


![](images/Remote_Sensing-5310d7d7.png)


It is worth noting that the Code Editor uses the javascript client API to make requests to the server. The key point is that the Code Editor runs in the browser and all the hard processing is done on Google Servers. Also, there are [Code Editor docs](https://developers.google.com/earth-engine/playground).

1. **Editor Panel**  
    1. The **Editor Panel** is where you **write and edit your Javascript code**.  
    2. Note that the **Run button executes the code**.  
2. **Right Panel**  
    1. **Console** tab for **printing output and errors**.  
    4. **Inspector** tab for **querying map** results. Click on the map and note that _there is a scale in meters associated with the zoom level_.  
    5. **Tasks** tab for managing **long-running tasks**.  
3. **Left Panel**  
    1. **Scripts** tab for **managing your programming scripts**. These are git repos hosted at Google.  
    7. **Docs** tab for **accessing documentation** of Earth Engine objects and methods, as well as a few specific to the Code Editor application. This is the definitive API reference and is populated by the server.  
    8. **Assets** tab for **managing assets** that you upload. You get 250 GB free.  
4. **Interactive Map**  
    1. For **visualizing map** layer output.  
    10. Note **layer controls**.  
    11. Note the **geometry tools**.  
5. **Search Bar**  
    1. For **finding datasets and places of interest**.  
6. **Get Link** button  
    1. This button creates a static snapshot of the Code Editor at the time the button is clicked. **If you change the code, get a new link.** You can share these for easy collaboration and troubleshooting.  
7. **Help Menu**  
    1. **User guide** - reference documentation  
    15. **Help forum** - Google group for discussing Earth Engine  
    16. **Shortcuts** - Keyboard shortcuts for the Code Editor  
    17. **Feature Tour** - overview of the Code Editor  
    18. **Feedback** - for sending feedback on the Code Editor  
    19. **Suggest a dataset** - Our intention is to continue to collect datasets in our public archive and make them more accessible, so we appreciate suggestions on which new datasets we should ingest into the Earth Engine public archive.  

### Script 00 - Javascript Syntax

Beginning users (especially if new to programming) often confuse commas, periods, semi-colons, parentheses, square and curly brackets. An understanding of these syntactic elements is key to making Earth Engine work. Carefully read and run this script for an introduction to basic JavaScript, including Hello World!, strings, numbers, comments, lists, objects (dictionaries), functions, etc.

Run this script in the Code Editor, by clicking on it to load it into the Code Window, then click Run.

For more, you can check out the W3Schools site: [https://www.w3schools.com/js/DEFAULT.asp](https://www.w3schools.com/js/DEFAULT.asp)


### Script 01 - Client vs. Server objects

_For the purpose of this lab, you won't need to understand this bit too deeply, but when you start making your own scripts and running tasks on the GEE platform, it will be important to understand these points. I've put this script here, just after the javascript syntax introduction so that it is easlity referenced in the future. You should skim this topic, but don't worry if it doesn't make perfect sense, yet._

Everything in the previous section was a client-side object that lives in the browser. Client-side code is useful for a great many things, and is often necessary, for example when programming [user interfaces for Earth Engine](https://developers.google.com/earth-engine/apps). However, client-side objects are NOT to be confused with server-side objects as demonstrated by the code in this script.



* Read the [Client vs. Server docs](https://developers.google.com/earth-engine/client_server). See also [the debugging doc](https://developers.google.com/earth-engine/debugging#avoid-mixing-client-functions-and-objects-with-server-functions-and-objects).

## Walking through the rest of the scripts

The [Sample Scripts in the repo](https://code.earthengine.google.com/?accept_repo=users/stacemaples/SGC-EE101) at the link above are heavily commented.

1. Please **click on each script** to load it into the Code Editor and **read through the code comments**.
2. Some code comments will ask you to **alter the code in simple ways**, or **explore the GEE interface in ways that expand your knowledge** of the platform.
3. Note that **many of the functions and methods** you are exploring **can be applied equally to other datasets** in the Google Earth Engine Data Catalog
4. You should "play" with the first 15 scripts in the repo.
5. Beyond the first 15 scripts, you will find more complex workflows and "modeling." The code become longer and more complex, but still well-commented. If you are interested in using Google Earth Engine for your final project, you should explore the scripts beyond #15, as well.

### To Uncomment code:

Javascript Code is **commented in two ways**, in these Sample Scripts:

A **single line of code** is commented out, like so (and appears green, when commented out):

`// print(‘hello, world’);`

So that DELETING THE // WILL UNCOMMENT THIS CODE AND CAUSE IT TO RUN WHEN THE RUN BUTTON IS PUSHED.

A **block of code** is commented out, like so:
```
/*
saythis = ‘Hello, World!’;
print(saythis);
*/
```

So that DELETING THE `/*`   and the  `*/`   WILL UNCOMMENT THIS CODE AND CAUSE IT TO RUN WHEN THE RUN BUTTON IS PUSHED.


### To turn in:

Work your way through the **entire set of scripts**, then **go to the Google Earth Engine Data Catalog** by clicking on the dropdown arrow next to the Search bar:

![](images/Remote_Sensing-124a8d47.png)

1. **Explore as much of the data catalog as you are interested in, then select a dataset you are interested in and go to its page**
2. **Explore the Metadata** for the dataset, particularly the **data type** and **ranges**, as well as the **bands available** and their **Properties**.
3. Answer the following **in a TXT document**:
    1. What is the Earth Engine Name of the dataset? (_HINT: Earth Engine Snippet_)
    2. How many bands does the dataset include?
    2. What is the **Pixel Resolution** of the dataset? You may have to look around for this.
    3. What **date range is the data available** for? (_HINT: this is listed near the thumbnail and "Earth Engine Snippet"_)
    4. Click on the **Get Link button** to (see below for image), copy a link to your script and add this link to your document.
4. Scroll to the bottom of the page for your dataset and click on the **Open in Code Editor button** to open the sample script for this dataset, in your Code Editor window.
5. **Run the Script**
6. **Make some changes to the code**.   

Some ideas include:
  * Alter the `setCenter()` function (most samples use it),
  * Change the date filters,
  * Change the vis params, etc...


7. Once you have done this, **create single-line or block comments to highlight what changes you have made.**
8. **Make sure the script works** as you expect it to.
7. **Save your script** so you can return to it, whenever you want.
8. **Submit the Get Link button URL** for your altered version of the script!

![](images/Remote_Sensing-e9d68e3d.png)


###  Sample HW Submission:

![](images/Remote_Sensing-90979e07.png)

The content or your Homework submission should be placed into a text document and include these items, from above:

----

**Week 6 - Google Earth Engine  - Stace Maples**

1. **What is the Earth Engine Name of the dataset?** (HINT: Earth Engine Snippet):

`ee.ImageCollection("USDA/NASS/CDL")`

2. **How many bands does the dataset include?**

`3 bands: cropland, cultivated and confidence`

2. **What is the Pixel Resolution of the dataset?**

`30 meters`

3. **What date range is the data available for?**

`1997-01-01T00:00:00 - 2019-01-01T00:00:00`

4. **Shared Script**: [`https://code.earthengine.google.com/1fb4c87e6c15605e98a1e0e95b210f7c`](https://code.earthengine.google.com/1fb4c87e6c15605e98a1e0e95b210f7c)

----

## Where to go next…

#### Cloud-Based Remote Sensing with Google Earth Engine Textbook

There is an excellent new Google Earth Engine textbook, written in collaboration with many of the Google Earth Engine developers. In the spirit of Google Earth Engine, the textbook: [Cloud-Based Remote Sensing with Google Earth Engine](https://www.eefabook.org/), is FREE and available online, for anyone. There are an accompanying set of [Samples Scripts](https://goo.gle/EEFA_repo) [https://goo.gle/EEFA_repo], you can save to your own Code Editor repository for reference.

#### Read the Docs
Read through the [Earth Engine docs](https://developers.google.com/earth-engine/). Read through the [Introduction](https://developers.google.com/earth-engine/) and [Get Started](https://developers.google.com/earth-engine/getstarted) sections, work your way through the [API tutorials](https://developers.google.com/earth-engine/tutorials), and then dive deeper into any concepts that you are interested in. From the Javascript Code Editor, the docs can be accessed via the menu **Help>User guide**.

#### Participate in the Community
Join and participate in the [Google Earth Engine Developers](https://groups.google.com/forum/#!forum/google-earth-engine-developers) forum, where Earth Engine users post and answer questions about the platform.

#### Geo for Good Summits
Check out the content from the recent **Google Geo4Good Summit 2022**, including On-Demand Videos of the mini-workshops on many Earth Engine tips, tricks and capabilities. [https://earthoutreachonair.withgoogle.com/events/geoforgood22](https://earthoutreachonair.withgoogle.com/events/geoforgood22)
