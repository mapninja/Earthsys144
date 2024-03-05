To introduce new students of spatial data science to the cartographic model using QGIS, a powerful, open-source geographic information system, this lab activity is designed to provide a hands-on experience with various data types and fundamental GIS concepts. We'll focus on understanding cartographic models, exploring different layers, and the significance of metadata, zones, features, values, properties, locations, and coordinate reference systems.

### Lab Activity Outline: Introduction to Cartographic Models using QGIS

#### Objectives:
- Understand the basic concepts of cartographic models and their applications in spatial data science.
- Learn to manipulate and explore vector, raster, and tabular data within QGIS.
- Examine the characteristics of different layers and understand their relevance.
- Get acquainted with metadata and its importance in GIS projects.

#### Requirements:
- QGIS software installed on your computer. QGIS can be downloaded from [qgis.org](https://qgis.org/en/site/).
- Download the pre-prepared QGIS Document (QGS or QGZ file).
- Access and download the required datasets:
  - Vector data layer (Census Tracts): Obtain from the US Census Bureau's website or a similar open data portal.
  - Raster data layer (Land Use Land Cover - LULC classification): Available from the USGS Earth Explorer or the Copernicus Land Monitoring Service.
  - Imagery layer (Sentinel-2): Accessible through the Copernicus Open Access Hub or Sentinel Hub.
  - Tabular data (Census Attributes): Downloadable from the US Census Bureau or relevant statistical office.

## Instructions:

### Cartographic Models & Projects

Cartographic models are conceptual tools that allow us to translate real-world phenomena into a format that can be represented on a map. They guide us in selecting which data to include, how to represent it, and what analyses might be possible or necessary. In the context of software like QGIS, a project can be seen as a comprehensive cartographic model that encompasses various data layers, their symbology, and any analytical processes applied to them. Each QGIS project is a digital workspace where these models are applied and explored, allowing for the visualization and analysis of spatial data.

##### Cartographic Models & Projects
1. Open the pre-prepared QGIS Document.
2. Explore the interface briefly to familiarize yourself with the layout and features of QGIS.
3. Examine the project metadata by navigating to Project > Properties > Metadata.

## Map Layers  


Map layers are the core components of our cartographic models in QGIS. They represent different types of data that can be visualized and analyzed within a single project. There are primarily three types of layers:

- **Vector Data**: This represents geographic features as points, lines, and polygons. For example, census tracts are often represented as polygons that delineate areas with specific population characteristics. Vector data is essential for modeling discrete features on the earth’s surface, such as roads, rivers, or administrative boundaries.
- **Raster Data**: Raster data is represented as a grid of cells or pixels, with each cell containing a value representing information, such as land use land cover (LULC) classifications. This data type is suited for modeling continuous phenomena, like elevation, temperature, or satellite imagery.
- **Tabular Data**: Tabular or attribute data is often associated with vector data, providing additional information about each feature. For instance, a table might contain demographic details for each census tract.

These layers work together in QGIS to build a comprehensive picture of the geographic phenomena being studied.

#### Map Layers

1. In the Layers Panel, identify the different types of layers included: vector (census tracts), raster (LULC classification), and imagery (Sentinel-2).
2. Toggle the visibility of each layer by clicking the checkbox next to the layer name.
3. Change the order of layers by dragging and dropping them in the Layers Panel to see how layer ordering affects the map's appearance.

## Metadata

Metadata is data about data. It includes important information about your data layers, such as the source, scale, accuracy, and date of creation. Metadata is crucial for understanding the context and limitations of your data, facilitating its proper use and interpretation. In QGIS, examining a layer's metadata can provide insights into its applicability for your project, ensuring that you're working with the most relevant and accurate information available.

#### Metadata
1. Right-click on each layer and select Properties > Metadata to examine the metadata for each layer.
2. Discuss the importance of metadata in understanding and utilizing spatial data effectively.

### Zones & Features

In vector data, zones are often represented as polygons, which can delineate areas with specific characteristics, such as census tracts. Each zone or feature within a vector layer can have various properties and values associated with it, stored in an attribute table. This allows for detailed analysis and visualization of spatial data, enabling users to explore and understand the distribution of different phenomena across space.

#### Zones & Features
1. Zoom into a specific census tract (vector layer) to explore its boundaries.
2. Use the Identify Features tool to click on a tract and examine its attribute data in the Identify Results panel.

### Values & Properties

Values and properties in spatial data refer to the quantitative or qualitative information associated with spatial features. In vector data, these are stored in attribute tables as columns, where each row represents a different feature, and each column represents a different attribute of those features. Raster data, on the other hand, stores values as cell or pixel values, where each cell's value represents the characteristic of the area that cell covers, such as land cover type or elevation.

#### Values & Properties
1. Explore the attribute table of the census tracts layer by right-clicking the layer and selecting Open Attribute Table.
2. Identify key attributes, such as population density or land use codes, in the vector and raster layers.

### Locations & Coordinate Reference Systems

Understanding locations and Coordinate Reference Systems (CRS) is fundamental to spatial thinking. Locations on Earth can be represented in many ways, but in GIS, we use coordinate systems to map these locations accurately onto a two-dimensional surface.

- **Geographic Coordinate Systems (GCS)** use latitude and longitude to describe the location of any point on the earth's surface. These coordinates are measured in degrees and represent angles from the Earth's center to a point on the Earth's surface.
- **Projected Coordinate Systems (PCS)**, on the other hand, project or translate the Earth's spherical surface onto a flat plane, making it easier to measure distances and areas accurately. This process inevitably introduces some distortion, which varies depending on the projection used.

Both types of CRS are crucial for accurately mapping and analyzing spatial data. In QGIS, users must be mindful of the CRS of their data layers to ensure accurate representation and analysis. Future labs will delve deeper into how different CRSs affect spatial analysis and how to choose the appropriate CRS for your project needs.

#### Locations & Coordinate Reference Systems
1. Investigate the Coordinate Reference System (CRS) for each layer by accessing the Layer Properties > Information.
2. Discuss the significance of CRS in GIS projects and how it affects the interpretation of spatial data.













#### Deliverables:
- A brief report summarizing the key findings from each section of the lab, emphasizing the importance of layers, metadata, and CRS in spatial analysis.
- Include screenshots of your QGIS workspace highlighting different aspects explored during the lab.

#### Resources:
- [QGIS Tutorials and Tips](https://www.qgistutorials.com)
- [US Census Bureau](https://www.census.gov)
- [USGS Earth Explorer](https://earthexplorer.usgs.gov)
- [Copernicus Open Access Hub](https://scihub.copernicus.eu)

This lab activity provides a foundational understanding of cartographic models and practical experience with GIS software, setting the stage for more advanced spatial analysis and mapping projects.
