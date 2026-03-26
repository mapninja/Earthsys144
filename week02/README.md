# Week 02 - Making and Collecting Data

Week 02 shifts the course from working with existing spatial data toward **creating** it. This is an important transition. A great deal of GIS work is not just analyzing data someone else prepared. It is deciding what should count as data in the first place, how it should be structured, how accurately it should be captured, and how to document it so other people can use it later.

The Week 02 labs approach data creation from three different angles:

- **Georeferencing** turns a scanned historical map into usable spatial data by aligning it to a reference system.
- **Digitizing in QGIS** creates new vector features from imagery and teaches careful interpretation of boundaries.
- **Field data collection with ArcGIS Online and Field Maps** shows how to design and deploy a mobile workflow for collecting new observations directly in the field.

By the end of Week 02, you should be able to:

- Explain the difference between using existing spatial data and creating new spatial data
- Explain why schema design, naming conventions, and organization matter in GIS projects
- Explain what georeferencing is and why projection and control point choice affect the result
- Create new vector data through digitizing and mobile field collection workflows
- Build cleaner, more reproducible project structures for data creation work
- Evaluate data creation choices in terms of accuracy, consistency, and fitness for use

## Week 02 Labs

These Week 02 labs include material that must be turned in for grading.

### 02 - TURN IN - Georeferencing with QGIS and AllMaps.org

[Open the lab](02_TURN_IN_georeferencing_with_qgis_and_allmaps_org.md)

This lab introduces georeferencing through a historical map of Wyoming. You will work with a scanned map image, a PLSS reference layer, and the QGIS Georeferencer to align the historical map to real-world coordinates. The lab emphasizes not only the mechanics of the tool, but the conceptual ideas behind reference data, projection choice, and control point placement.

### 01 - TURN IN - Data Creation in QGIS

[Open the lab](01_TURN_IN_data_creation_in_qgis.md)

This lab introduces vector data creation through a tree crown labeling exercise in QGIS. You will work from aerial imagery, create new polygon features, and document your work in a map layout. The main lesson is that digitizing is an interpretive act: you are making decisions about where features begin and end, and those decisions affect the quality of the resulting dataset.

### 03 - TURN IN - Introducing ArcGIS Field Maps and ArcGIS Online for Data Collection

[Open the lab](03_TURN_IN_introducing_arcgis_fieldmaps_and_arcgis_online_for_data_collection.md)

This lab introduces mobile field data collection. You will create hosted feature layers in ArcGIS Online, design a field form, configure offline use, and collect data with ArcGIS Field Maps. The purpose is to help you think carefully about field schema design, controlled vocabularies, usability, and the realities of collecting data away from a desktop GIS.
