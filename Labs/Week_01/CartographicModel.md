To introduce new students of spatial data science to the cartographic model using QGIS, a powerful, open-source geographic information system, this lab activity is designed to provide a hands-on experience with various data types and fundamental GIS concepts. We'll focus on understanding cartographic models, exploring different layers, and the significance of metadata, zones, features, values, properties, locations, and coordinate reference systems.

# Lab 01: Introduction to Cartographic Models using QGIS

The purpose of this Lab is to introduce new students of spatial data science to the **cartographic model** using QGIS, a powerful, open-source geographic information system, this lab activity is designed to provide a hands-on experience with various data types and fundamental GIS concepts. We'll focus on understanding cartographic models, exploring different layers, and the significance of metadata, zones, features, values, properties, locations, and coordinate reference systems.

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

### Exploring Project Properties & Metadata in QGIS

#### Step 1: Open the Pre-prepared QGIS Document
- Start by launching QGIS on your computer.
- Open the pre-prepared QGIS document provided for this lab. This document might come in the form of a `.qgz` or `.qgs` file, which you can open through File > Open Project, navigating to where your file is stored, and selecting it.

#### Step 2: Familiarize Yourself with the QGIS Interface
- Take a moment to look over the QGIS interface. You'll see several key areas:
  - **Menu Bar and Toolbars**: At the top, where actions and tools are accessed.
  - **Layers Panel**: On the left side, displaying a list of all the map layers included in your project.
  - **Map Canvas**: The central area where your map is displayed.
  - **Status Bar**: At the bottom, showing information about map coordinates, scale, and other details.

#### Step 3: Examine the Project Metadata
- Project metadata provides essential information about the overall GIS project. It includes details like the project's title, abstract (a brief description), and various attributes that might include the project's creation date, who created it, and the geographic extent of the data.
- To view the project metadata, follow these steps:
  1. **Navigate to Project Metadata**:
      - Go to the Menu Bar at the top of the screen.
      - Click on "Project" to open the project menu.
      - Select "Properties..." from the dropdown menu to open the Project Properties window.
  2. **Accessing Metadata**:
      - In the Project Properties window, click on the "Metadata" section on the left-hand side. This section allows you to view and edit the metadata associated with your QGIS project.
  3. **Explore the Metadata Content**:
      - The Metadata tab will show several fields filled with information about the project. Pay special attention to:
        - **Title and Abstract**: Provides a summary of the project's purpose and scope.
        - **Keywords**: Helps categorize the project under various themes or topics.
        - **Contact Information**: Details about the creator or the organization responsible for the project.
        - **Geographic Extent**: Shows the spatial coverage of the project, indicating which area of the world the project data pertains to.
      - Take some time to read through the metadata to understand the context and scope of the project you will be working with.

Understanding the project metadata is crucial for gaining insights into the purpose, scope, and data specifics of your GIS project. This foundational step ensures that you're well-prepared to engage with the data and analyses within the QGIS environment effectively.

## Map Layers  


Map layers are the core components of our cartographic models in QGIS. They represent different types of data that can be visualized and analyzed within a single project. There are primarily three types of layers:

- **Vector Data**: This represents geographic features as points, lines, and polygons. For example, census tracts are often represented as polygons that delineate areas with specific population characteristics. Vector data is essential for modeling discrete features on the earth’s surface, such as roads, rivers, or administrative boundaries.
- **Raster Data**: Raster data is represented as a grid of cells or pixels, with each cell containing a value representing information, such as land use land cover (LULC) classifications. This data type is suited for modeling continuous phenomena, like elevation, temperature, or satellite imagery.
- **Tabular Data**: Tabular or attribute data is often associated with vector data, providing additional information about each feature. For instance, a table might contain demographic details for each census tract.

These layers work together in QGIS to build a comprehensive picture of the geographic phenomena being studied.

### Exploring Map Layers in QGIS

Map layers form the foundation of geographic analysis in QGIS, allowing you to visualize, explore, and analyze different types of spatial data. Below are detailed instructions for interacting with vector, raster, and tabular data layers within your QGIS project.

#### Step 1: Identifying Layer Types in the Layers Panel

- **Open the Layers Panel**: If not already open, you can access the Layers Panel by going to the menu `View` > `Panels` and ensuring that the `Layers Panel` is checked. This panel is typically located on the left side of the QGIS window.
- **Examine the Layers**: Look through the list in the Layers Panel. You will see different icons representing the types of layers:
  - A polygon symbol for vector data layers (e.g., census tracts).
  - A grid or checkerboard pattern for raster data layers (e.g., LULC classification).
  - A table icon for tabular data, which might not be immediately visible if it is linked as attribute data to a vector layer.

#### Step 2: Toggling Layer Visibility

- **Locate the Checkbox**: Next to each layer name in the Layers Panel, there's a checkbox. This controls the visibility of that layer on the map canvas.
- **Toggle Visibility**: Click on the checkbox to toggle the visibility of each layer. When the box is checked, the layer is visible; when unchecked, the layer is hidden. Experiment with toggling different layers on and off to see how each contributes to the overall map.

#### Step 3: Changing the Order of Layers

- **Select a Layer**: Click on a layer name in the Layers Panel to select it. You should see the layer become highlighted.
- **Drag and Drop**: Click and hold the left mouse button on the selected layer, then drag it up or down in the list. Release the mouse button to drop the layer in its new position.
- **Observe Changes**: As you change the order of the layers, notice how this affects the map canvas. Layers at the top of the list will be drawn over layers below them. This is particularly important when working with a mix of opaque and transparent layers, as it can significantly impact the map's readability and appearance.

### Practical Tips for Exploring Map Layers

- **Exploring Vector Data**: When a vector layer is selected and visible, try using the `Identify Features` tool (a blue cursor icon) from the toolbar to click on individual features on the map. This will bring up a window with attribute data for the selected feature, providing detailed information about it.
- **Exploring Raster Data**: For raster layers, use the `Identify Features` tool to click on different parts of the raster. This will show you the value of the pixel under the cursor, which can be useful for understanding the data represented by the raster, such as elevation values or land cover classifications.
- **Layer Properties and Symbology**: Right-click on any layer in the Layers Panel and select `Properties` to explore settings like symbology, which controls how the layer is visually represented on the map. This is a powerful feature for making your data more understandable and visually appealing.

By familiarizing yourself with these fundamental interactions with map layers in QGIS, you'll gain a deeper understanding of how spatial data can be manipulated and visualized to reveal insights about the geographic phenomena being studied.


## Metadata

Metadata is data about data. It includes important information about your data layers, such as the source, scale, accuracy, and date of creation. Metadata is crucial for understanding the context and limitations of your data, facilitating its proper use and interpretation. In QGIS, examining a layer's metadata can provide insights into its applicability for your project, ensuring that you're working with the most relevant and accurate information available.

### Exploring Metadata in QGIS

Metadata provides critical context for understanding and working with spatial data effectively. It encompasses a wide range of information, including the data source, how it was collected, its format, and any transformations it has undergone. This guide will help you navigate through metadata in QGIS for various layers in your project, enhancing your ability to make informed decisions about your spatial analysis.

#### Step 1: Accessing Metadata for a Layer

- **Select a Layer**: In the QGIS Layers Panel, identify the layer for which you want to explore the metadata. This could be any type of layer - vector, raster, or tabular.
- **Open Layer Properties**: Right-click on the chosen layer to open the context menu and select `Properties`. This action opens the Layer Properties dialog box.

#### Step 2: Navigating to the Metadata Section

- **Locate the Metadata Tab**: Within the Layer Properties dialog box, you will see several tabs on the left-hand side. Click on the `Metadata` tab to switch to the metadata view of the layer.

#### Step 3: Examining Layer Metadata

- **Read Through the Metadata**: The Metadata tab presents various sections filled with information about the layer. Key sections to focus on include:
  - **Data Source**: Tells you where the data came from, which is crucial for assessing its reliability and suitability for your project.
  - **Extent**: Shows the geographic extent covered by the data, helping you understand its spatial coverage.
  - **Coordinate Reference System (CRS)**: Indicates the CRS used by the layer, which affects how it aligns with other layers in your project.
  - **Attributes**: Lists the attributes contained in the layer, providing insight into the data's content and structure.
  - **History and Processing Steps**: If available, this section can tell you about any processing or analysis the data has undergone before it was added to your project.

#### Step 4: Discussing the Importance of Metadata

Understanding metadata is essential for several reasons:

- **Data Quality and Reliability**: Metadata helps you assess the quality and reliability of your data by providing information about its source, accuracy, and method of collection.
- **Data Integration**: Knowing the CRS and extent of your data ensures that you can effectively integrate it with other data layers in your project without encountering misalignment or scaling issues.
- **Informed Decision Making**: By understanding the attributes and history of your data, you can make more informed decisions about how to use it in your analysis and which analytical methods are appropriate.

### Practical Tips for Working with Metadata in QGIS

- **Keep Metadata Updated**: If you process or analyze the data within QGIS, consider updating the metadata to reflect any changes or additional steps you've taken. This can be done in the same Metadata tab by editing the relevant sections.
- **Use Metadata for Layer Documentation**: The metadata can serve as a form of documentation for your project, making it easier for you or others to understand the data layers and their origins in the future.

By following these steps to explore and understand metadata in QGIS, you equip yourself with the knowledge needed to utilize spatial data more effectively, ensuring the success of your geospatial projects.

## Zones & Features

In vector data, zones are often represented as polygons, which can delineate areas with specific characteristics, such as census tracts. Each zone or feature within a vector layer can have various properties and values associated with it, stored in an attribute table. This allows for detailed analysis and visualization of spatial data, enabling users to explore and understand the distribution of different phenomena across space.

### Exploring Zones and Vector Features in QGIS

Vector data layers in QGIS are powerful tools for analyzing spatial phenomena, as they allow for the exploration of specific zones, such as census tracts, and the features within those zones. Here’s how you can dive into these aspects:

#### Step 1: Zooming into a Specific Census Tract

- **Locate Your Area of Interest**: Use the mouse wheel or the zoom tools (magnifying glass icons) on the toolbar to zoom into the area where your census tracts are visible. You might also use the "Pan" tool (hand icon) to navigate to the specific location you're interested in.
- **Selecting a Census Tract**: Once you have a clear view of the census tracts, identify one that you would like to explore further. The boundaries of these tracts should be clearly delineated, each representing a different zone.

#### Step 2: Using the Identify Features Tool

- **Activate the Identify Features Tool**: Find the "Identify Features" tool on the QGIS toolbar. It’s represented by an icon that looks like an "i" inside a blue circle. Click on this tool to activate it.
- **Click on a Census Tract**: With the Identify Features tool active, move your cursor over to the map canvas and click on the census tract you're interested in. This action will query the vector layer and display information about the feature you clicked on.
- **Examine the Attribute Data**: Upon clicking a tract, the "Identify Results" panel will open, typically on the right side of the QGIS window. This panel displays a wealth of information about the selected feature, including its attribute data.
  - **Attributes Overview**: Here, you will see a list of attributes for the selected census tract, such as its ID, name, population, area, and any other demographics or characteristics stored in the dataset.
  - **Understanding the Data**: Take some time to review the attribute data. This information can provide insights into the specific characteristics of the zone, enabling a deeper understanding of the spatial distribution of various phenomena.

### Tips for Exploring Zones and Features

- **Explore Multiple Features**: Don’t limit yourself to just one census tract. Use the Identify Features tool to click on different tracts to compare their attribute data. This comparative analysis can help you identify patterns or anomalies within the dataset.
- **Attribute Table**: For a broader view of the data, consider opening the attribute table of the vector layer by right-clicking on the layer in the Layers Panel and selecting "Open Attribute Table." This table provides a comprehensive overview of all features and their attributes within the layer.
- **Customizing the Identify Results**: The Identify Results panel has several modes for displaying data. You can experiment with these (found in the panel's toolbar) to change how the information is presented, whether as a list for a single feature or a table for multiple features.

By following these steps, you'll gain hands-on experience with analyzing vector data in QGIS, enhancing your spatial analysis skills and deepening your understanding of geographic zones and features.

## Values & Properties

Values and properties in spatial data refer to the quantitative or qualitative information associated with spatial features. In vector data, these are stored in attribute tables as columns, where each row represents a different feature, and each column represents a different attribute of those features. Raster data, on the other hand, stores values as cell or pixel values, where each cell's value represents the characteristic of the area that cell covers, such as land cover type or elevation.

### Exploring Attributes of Vector Features and Pixel Values in QGIS

Understanding the values and properties of spatial data is crucial for effective analysis and interpretation in GIS. This guide provides instructions for exploring the attributes of vector features as well as the pixel values of raster layers in QGIS.

#### Exploring Attributes of Vector Features

##### Step 1: Accessing the Attribute Table

- **Select the Vector Layer**: In the Layers Panel, click to select the vector layer you're interested in, such as census tracts.
- **Open the Attribute Table**: Right-click on the selected layer and choose "Open Attribute Table" from the context menu. This action will open a new window displaying the attribute table for the layer.

##### Step 2: Exploring the Attribute Table

- **Browse the Table**: The attribute table displays data in rows and columns, with each row representing a different feature (e.g., a census tract) and each column representing a different attribute (e.g., population density, area, etc.).
- **Identify Key Attributes**: Look for columns that hold significant information for your analysis, such as population density, land use codes, or any other relevant attributes. These attributes can provide insights into the characteristics of the features represented in the layer.

#### Exploring Pixel Values of Raster Layers

##### Step 1: Using the Identify Features Tool

- **Activate the Identify Features Tool**: Locate and click on the "Identify Features" tool in the toolbar, symbolized by an "i" inside a blue circle.
- **Select a Raster Layer**: Ensure that the raster layer you wish to explore (e.g., an LULC classification layer) is selected and visible in the Layers Panel.

##### Step 2: Clicking on the Raster to Identify Pixel Values

- **Click on the Map Canvas**: With the Identify Features tool active, click on a point within the raster layer displayed on the map canvas. This will query the pixel at the location you clicked.
- **Examine the Pixel Values**: The "Identify Results" panel will open, showing the value of the pixel you selected. If the raster layer contains multiple bands (such as in multi-spectral satellite imagery), you will see the values for each band. These values might represent different types of information depending on the nature of the raster data, such as land cover categories, elevation, or spectral reflectance values.

### Tips for Effective Exploration

- **Filtering in the Attribute Table**: Use the filtering and searching functionalities within the attribute table to narrow down to features of interest based on specific criteria, enhancing your ability to focus on relevant data.
- **Understanding Raster Values**: For raster layers, understanding what the pixel values represent is key to analysis. Refer to the metadata or documentation of the dataset to interpret these values correctly.
- **Visualizing Data**: Consider using QGIS's styling options to visualize vector attributes or raster values on the map, such as through thematic mapping or applying different color ramps to raster data. This can help in visually identifying patterns or anomalies within your data.

By following these steps, you'll be able to effectively explore and understand the attributes and values associated with both vector and raster layers in QGIS, laying a solid foundation for your spatial analysis endeavors.

## Locations & Coordinate Reference Systems

Understanding locations and Coordinate Reference Systems (CRS) is fundamental to spatial thinking. Locations on Earth can be represented in many ways, but in GIS, we use coordinate systems to map these locations accurately onto a two-dimensional surface.

- **Geographic Coordinate Systems (GCS)** use latitude and longitude to describe the location of any point on the earth's surface. These coordinates are measured in degrees and represent angles from the Earth's center to a point on the Earth's surface.
- **Projected Coordinate Systems (PCS)**, on the other hand, project or translate the Earth's spherical surface onto a flat plane, making it easier to measure distances and areas accurately. This process inevitably introduces some distortion, which varies depending on the projection used.

Both types of CRS are crucial for accurately mapping and analyzing spatial data. In QGIS, users must be mindful of the CRS of their data layers to ensure accurate representation and analysis. Future labs will delve deeper into how different CRSs affect spatial analysis and how to choose the appropriate CRS for your project needs.

### Exploring Locations and Coordinate Reference Systems in QGIS

In QGIS, understanding and managing Coordinate Reference Systems (CRS) is crucial for accurate spatial analysis. The CRS defines how the two-dimensional, projected map in your GIS relates to real places on the earth. Consider the CRS as the "lingua franca" of your project, ensuring that all layers speak the same spatial language for seamless integration and analysis.

#### Step 1: Investigating Layer CRS

- **Select a Layer**: In the Layers Panel, click on any layer you're interested in to select it.
- **Access Layer Properties**: Right-click on the selected layer and choose "Properties" from the context menu.
- **Find CRS Information**: In the Layer Properties window, click on the "Information" tab. Here, you will find the CRS for the layer specified under the "Coordinate Reference System" section.
- **Note the CRS**: Pay attention to whether the layer uses a Geographic Coordinate System (GCS) or a Projected Coordinate System (PCS). The description will include the EPSG (European Petroleum Survey Group) code, which is a unique identifier for specific CRS, and details about the projection or datum used.

#### Step 2: Understanding the Project CRS

- **Access Project Properties**: Go to "Project" > "Properties" from the main menu.
- **Navigate to CRS Settings**: Click on the "CRS" tab in the Project Properties window.
- **Project CRS as Reference System**: The Project CRS can be thought of as the common language or "lingua franca" for your GIS project. It's the standard against which all layers are displayed or analyzed together. If layers in your project have different CRS, QGIS can reproject them on the fly to match the Project CRS. However, for accuracy and performance, it's often better to have all layers in the same CRS.
- **Changing the Project CRS**: If needed, you can change the Project CRS by searching for a CRS by name or EPSG code and selecting it. Remember, changing the Project CRS does not alter the underlying data of your layers; it only changes how they are projected in the current project.

#### The Relationship Between Project CRS and Layer CRS

Understanding the relationship between the Project CRS and Layer CRS is essential:

- **Consistency is Key**: For accurate spatial analysis, all layers should ideally be in the same CRS. This ensures that measurements, distances, and areas are consistent across your project.
- **On-the-fly Reprojection**: QGIS automatically reprojects layers to the Project CRS during visualization. While convenient, this can sometimes lead to inaccuracies or performance issues, especially with large datasets.
- **Checking Layer Compatibility**: Before starting an analysis, check that all layers are compatible with your Project CRS. If not, consider reprojecting your layers to match the Project CRS using the "Reproject layer" tool under "Processing" > "Toolbox" in QGIS.

### Practical Tips

- **Be Mindful of Distortions**: Different projections can introduce different types of distortions (area, distance, direction, shape). Choose a Project CRS that minimizes distortion for the type of analysis you're conducting.
- **Verify Layer CRS When Adding Data**: Always check the CRS of new layers when you add them to your project. If they do not match your Project CRS, consider reprojecting them.
- **Use EPSG Codes for Precision**: When communicating or searching for CRS, use the EPSG code to avoid confusion, as different systems might have similar names.

By carefully managing CRS settings in your QGIS project, you ensure that your spatial analysis is grounded in an accurate representation of real-world locations, making your conclusions more reliable and meaningful.


## Deliverables:

For this lab, you will use the QGIS Layout Manager to create a comprehensive map layout that incorporates the data layers you've explored throughout the lab. This layout will then be exported to a PDF document, showcasing your ability to apply the concepts learned about layers, metadata, and Coordinate Reference Systems (CRS) in spatial analysis. A layout template named "Lab 1 - Layout" is included with your QGIS Project File to assist in this process.

##### Creating Your Map Layout in QGIS:

1. **Open the Layout Manager**:
   - Navigate to `Project` > `Layout Manager` from the main menu in QGIS.
   - In the Layout Manager window, select the "Lab 1 - Layout" template and click `Open`. If the template is not listed, you may need to import it using the `Import Layout` button, assuming you have a file for it.

2. **Customize the Layout**:
   - Once in the layout editor, you can customize the map view by selecting the map frame and using the `Move item content` tool to pan to the area of interest.
   - Ensure that the layers you want to showcase are visible and correctly ordered in the Layers Panel back in the main QGIS window. Changes to layer visibility and order will reflect in the layout's map item.
   - You can adjust the scale of the map within the layout to better fit the area of interest using the scale box in the layout toolbar.

3. **Adding Map Elements**:
   - Utilize the layout tools to add text boxes where you can summarize key findings from each section of the lab, emphasizing the role and importance of layers, metadata, and CRS in spatial analysis.
   - You can also insert legends, scale bars, and north arrows to enhance the interpretability of your map layout.

4. **Exporting to PDF**:
   - Once you are satisfied with your layout, export it to a PDF by going to `Layout` > `Export as PDF` in the layout editor's menu.
   - In the export dialog, choose your desired settings and specify a file name and location for your PDF.

## Final Deliverable:

- **PDF Document**: Your final deliverable will be a PDF document generated from the "Lab 1 - Layout" template. This document should include:
  - A map showcasing the included data layers with appropriate symbols and legends.
  - Text annotations summarizing the key findings related to layers, metadata, and CRS.
  - Any additional map elements (e.g., scale bar, north arrow) that aid in the interpretation of the map.

This deliverable will demonstrate your ability to apply spatial data science concepts in QGIS and communicate your findings effectively through a professional map layout.

#### Resources:
- [QGIS Tutorials and Tips](https://www.qgistutorials.com)
- [US Census Bureau](https://www.census.gov)
- [USGS Earth Explorer](https://earthexplorer.usgs.gov)
- [Copernicus Open Access Hub](https://scihub.copernicus.eu)

This lab activity provides a foundational understanding of cartographic models and practical experience with GIS software, setting the stage for more advanced spatial analysis and mapping projects.
