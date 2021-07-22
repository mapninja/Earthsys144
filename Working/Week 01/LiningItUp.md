# Lining it up
## Working with Geographic and Projected Coordiate Systems

### Objectives:  

After this lab, you should be able to:

* Explain the relationship  between Geographic and Projected Coordinate Systems
* Select an appropriateprojected coordinate system for a project, based upon region, scale and desired measurement(s)
* Troubleshoot basic projection problems
* Customize a Projected Coordinate System to a specific study area for more accurate measurements



## Excercise 01 - A First Project and Projection   

### Finding & Downloading Data

We're going to explore a number of ways projections can effect measurements, but we'll do so with an interesting dataset. Earthworks is Stanford's Spatial Data discovery platform and, to date, indexes nearly 100,000 spatial datasets, available from dozens of academic institutions. Some datasets are licensed for use by specific schools, and those restricted to Stanford users can be accessed by signing into Earthworks with your Stanford credentials, at teh top of the page.

1. Go to [https://Earthworks.stanford.edu](https://Earthworks.stanford.edu)
2. Search for the "Spread of Africanized Honey Bees in the United States, 1990-2005" data, held by Stanford Libraries and download the **Original Shapefile**

### Starting a new project in QGIS

Now that we have some data, we'll begin building a project in QGIS. QGIS uses a layers to organize thematic datasets into stacks of data for a region. In general, data layers typically
