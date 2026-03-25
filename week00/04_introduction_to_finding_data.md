# Introduction to Finding Spatial Data

## Overview

In this lab, you will build a practical strategy for finding data for GIS projects. The focus is not only on finding files, but on finding data that is trustworthy, well documented, and appropriate for your question and scale.

## Learning Objectives

By the end of this lab, you should be able to:

- Identify major data repositories for environmental, social, and infrastructure analysis.
- Match your project needs to appropriate source types (government, academic, global, or commercial).
- Use links to access common datasets directly.
- Evaluate metadata, quality, licensing, and scale before analysis.

## Quick Strategy: Start Here

1. Define your study area and time period.
2. Choose data type(s): vector boundaries, raster imagery, tabular attributes, or web services.
3. Search authoritative sources first.
4. Check metadata before download.
5. Verify CRS, temporal coverage, and license terms.

## Academic and Research Sources

### Stanford EarthWorks

- URL: [https://earthworks.stanford.edu/](https://earthworks.stanford.edu/)
- What it is: Stanford Libraries' geospatial discovery portal built around curated records and metadata.
- Best for: Research-grade vector and raster downloads, historical maps, and documentation-rich records.
- Common datasets you can find:
	- Administrative boundaries (county, state, census geographies)
	- Transportation and hydrography layers
	- Historical maps and scanned cartographic products
	- Thematic reference layers used in academic research
- Why it matters: Metadata quality is usually much higher than ad hoc web sources, which makes citation and reproducibility easier.

### Google Earth Engine Data Catalog

- URL: [https://developers.google.com/earth-engine/datasets](https://developers.google.com/earth-engine/datasets)
- What it is: Google's cloud catalog of analysis-ready raster and feature collections.
- Best for: Time series analysis, remote sensing, and large-area workflows without local download.
- Typical dataset families:
	- Optical satellite imagery: Landsat, Sentinel-2, MODIS
	- Radar: Sentinel-1
	- Climate and weather: ERA5, CHIRPS, GRIDMET
	- Elevation and terrain: SRTM, NASADEM
	- Land cover and agriculture: NLCD, Dynamic World, NASS CDL
- Why it matters: Datasets are pre-processed for cloud analysis and can be clipped/filtered directly in code.

Useful catalog entries:

- [Landsat Collection 2](https://developers.google.com/earth-engine/datasets/catalog/landsat)
- [Sentinel-2 Surface Reflectance](https://developers.google.com/earth-engine/datasets/catalog/COPERNICUS_S2_SR)
- [MODIS Surface Reflectance](https://developers.google.com/earth-engine/datasets/catalog/MODIS_006_MOD09A1)
- [ERA5 Daily Climate](https://developers.google.com/earth-engine/datasets/catalog/ECMWF_ERA5_DAILY)
- [CHIRPS Daily Precipitation](https://developers.google.com/earth-engine/datasets/catalog/UCSB-CHG_CHIRPS_DAILY)

## Government Data Sources

### Data.gov

- URL: [https://www.data.gov/](https://www.data.gov/)
- What it is: U.S. federal open-data index across agencies.
- Best for: Discovering datasets first, then following links to agency-authoritative downloads.
- Common themes:
	- Public health and demographics
	- Transportation and infrastructure
	- Environmental monitoring
	- Economic and administrative records

### USGS National Map

- URL: [https://viewer.nationalmap.gov/basic/](https://viewer.nationalmap.gov/basic/)
- What it is: USGS access point for national base geospatial layers.
- Best for: Standard U.S. base layers and terrain context.
- Common datasets:
	- Elevation and contours
	- Hydrography (NHD)
	- Transportation layers
	- Structures and geographic names

### USGS EarthExplorer

- URL: [https://earthexplorer.usgs.gov/](https://earthexplorer.usgs.gov/)
- What it is: USGS archive search and download interface.
- Best for: Raw and processed imagery download workflows.
- Common datasets:
	- Landsat archive
	- NAIP aerial imagery
	- SRTM/DEM products
	- Historical aerial collections

### USGS TopoView

- URL: [https://ngmdb.usgs.gov/topoview/viewer/](https://ngmdb.usgs.gov/topoview/viewer/)
- What it is: Interface for current and historical USGS topo sheets.
- Best for: Comparing historical versus current landscape conditions.
- Common use cases: Urban expansion studies, environmental change over time, historical context maps.

### FEMA Flood Map Service Center

- URL: [https://msc.fema.gov/portal/advanceSearch](https://msc.fema.gov/portal/advanceSearch)
- What it is: FEMA source for regulatory flood products.
- Best for: Floodplain boundaries and regulatory risk zones.
- Common datasets:
	- Flood Insurance Rate Maps (FIRMs)
	- Flood hazard polygons and supporting studies

### U.S. Census Geography and Boundary Files

- URL: [https://www.census.gov/geographies/mapping-files](https://www.census.gov/geographies/mapping-files/time-series/geo/kml-cartographic-boundary-files.html)
- What it is: Authoritative U.S. statistical geographies and boundary products.
- Best for: Demographic mapping and social analysis.
- Common datasets:
	- Census tracts, block groups, blocks
	- County and state boundaries
	- TIGER/Line files and cartographic boundary files

## Environmental and Physical Data Sources

### NAIP (National Aerial Imagery Program)

- Access: EarthExplorer and state portals.
- Also in GEE: [https://developers.google.com/earth-engine/datasets/catalog/USDA_NAIP_DOQQ](https://developers.google.com/earth-engine/datasets/catalog/USDA_NAIP_DOQQ)
- What it is: USDA aerial orthoimagery for the U.S.
- Typical resolution: About 1 meter.
- Common use cases: Land use mapping, urban growth interpretation, visual QA of classification outputs.

### NLCD (National Land Cover Database)

- Access: USGS portals and EarthExplorer.
- Also in GEE: [https://developers.google.com/earth-engine/datasets/catalog/USGS_NLCD_RELEASES](https://developers.google.com/earth-engine/datasets/catalog/USGS_NLCD_RELEASES)
- What it is: U.S. land cover classification product with repeated release years.
- Common classes: Developed intensity classes, forest types, wetlands, cropland, shrub/grass.
- Common use cases: Change detection, impervious surface context, watershed modeling inputs.

### NASS Crop Data Layer

- URL: [https://nassgeodata.gmu.edu/CropScape/](https://nassgeodata.gmu.edu/CropScape/)
- Also in GEE: [https://developers.google.com/earth-engine/datasets/catalog/USDA_NASS_CDL](https://developers.google.com/earth-engine/datasets/catalog/USDA_NASS_CDL)
- What it is: Annual crop classification product for U.S. agriculture.
- Common use cases: Crop rotation studies, ag land-use change, county-level crop summaries.

### National Wetlands Inventory

- URL: [https://www.fws.gov/wetlands/data/Mapper.html](https://www.fws.gov/wetlands/data/Mapper.html)
- What it is: U.S. Fish and Wildlife Service wetland mapping and classification.
- Common use cases: Habitat assessment, regulatory context, conservation prioritization.

### Elevation Data

- SRTM download portal: [http://srtm.csi.cgiar.org/srtmdata/](http://srtm.csi.cgiar.org/srtmdata/)
- SRTM 30m in GEE: [https://developers.google.com/earth-engine/datasets/catalog/USGS_SRTMGL1_003](https://developers.google.com/earth-engine/datasets/catalog/USGS_SRTMGL1_003)
- NASADEM in GEE: [https://developers.google.com/earth-engine/datasets/catalog/NASA_NASADEM_HGT_001](https://developers.google.com/earth-engine/datasets/catalog/NASA_NASADEM_HGT_001)
- What it is: DEM sources for terrain and hydrologic analysis.
- Common derived products: slope, aspect, hillshade, flow direction, viewshed inputs.

### Hydrography and Watersheds

- National Hydrography Dataset (via USGS National Map / EarthExplorer)
- HydroSHEDS portal: [https://www.hydrosheds.org/](https://www.hydrosheds.org/)
- HydroSHEDS in GEE: [https://developers.google.com/earth-engine/datasets/catalog/WWF_HydroSHEDS_03VFDEM](https://developers.google.com/earth-engine/datasets/catalog/WWF_HydroSHEDS_03VFDEM)
- What it is: River network and watershed boundary products.
- Common use cases: Delineation, upstream/downstream connectivity, basin-scale summaries.

### Soils Data

- USDA Web Soil Survey: [https://websoilsurvey.sc.egov.usda.gov/App/WebSoilSurvey.aspx](https://websoilsurvey.sc.egov.usda.gov/App/WebSoilSurvey.aspx)
- SoilGrids in GEE: [https://developers.google.com/earth-engine/datasets/catalog/ISRIC_SoilGrids250m_v2_0](https://developers.google.com/earth-engine/datasets/catalog/ISRIC_SoilGrids250m_v2_0)
- What it is: Physical and chemical soil properties from survey and modeled products.
- Common attributes: Texture fractions, pH, organic carbon, depth classes.

## Demographic and Social Data Sources

### IPUMS NHGIS

- URL: [https://www.nhgis.org/](https://www.nhgis.org/)
- Best for: Historical and contemporary demographic datasets with consistent geography.
- Typical data: Census and ACS tables linked to boundary geometries.
- Common use cases: Longitudinal neighborhood change and social equity analysis.

### SimplyAnalytics

- URL: [https://simplyanalytics.com](https://simplyanalytics.com)
- Best for: Market, consumer, and demographic mapping workflows.
- Typical data: Demographics, consumer behavior, and business context variables.
- Common use cases: Site selection, market profiling, and class projects with rapid exploratory mapping.

## Global and International Sources

### Natural Earth

- URL: [https://www.naturalearthdata.com/](https://www.naturalearthdata.com/)
- Best for: Cartographic-ready global vector/raster reference layers.
- Typical data: Country boundaries, coastlines, graticules, populated places, physical reference layers.
- Common use case: Fast global maps and small-scale reference context.

### OpenStreetMap

- URL: [https://www.openstreetmap.org/](https://www.openstreetmap.org/#map=3/10.17/20.40)
- What it is: A global, community-maintained open geospatial database (often called the "Wikipedia of maps").
- Best for: Streets, buildings, amenities, and place-based feature extraction.
- Typical data model: Nodes, ways, relations with key/value tags (for example `highway=primary`, `building=yes`).
- Strengths:
	- Excellent urban detail in many regions.
	- Rapid updates from local contributors.
	- Open license and broad tooling ecosystem.
- Cautions: Coverage/completeness is uneven by region; always validate against local authoritative sources when needed.

### Overpass Turbo

- URL: [https://overpass-turbo.eu/](https://overpass-turbo.eu/)
- Best for: Targeted extraction of OSM feature subsets.
- Typical workflow: Query by tag and extent (for example all `amenity=hospital` in a city), then export GeoJSON.

### Humanitarian OpenStreetMap Team Tasks

- URL: [https://tasks.hotosm.org/explore](https://tasks.hotosm.org/explore)
- What it is: HOT is a nonprofit that coordinates volunteer mapping in OpenStreetMap for disaster response and resilience.
- Best for: Structured mapping tasks in areas affected by crisis or with low baseline map coverage.
- Typical mapped features:
	- Building footprints
	- Road networks
	- Critical facilities (clinics, schools, water points)
- Why it matters: HOT workflows add traceable, task-based QA to volunteer mapping and support humanitarian operations.

### Humanitarian Data Exchange

- URL: [https://data.humdata.org/](https://data.humdata.org/)
- What it is: OCHA's open platform for humanitarian and crisis datasets.
- Best for: Country-level administrative boundaries, population estimates, camp/facility data, and emergency situation layers.
- Typical dataset categories:
	- COD-AB/COD-PS packages (common operational datasets)
	- Displacement and conflict indicators
	- Health, logistics, and access constraints
- Why it matters: HDX is a central source in humanitarian GIS, especially for rapid response basemaps and operational overlays.

## Commercial and Institutional Platforms

### Planet

- URL: [https://www.planet.com/](https://www.planet.com/)
- Best for: High-frequency commercial satellite imagery.
- Planet in GEE catalog reference: [https://developers.google.com/earth-engine/datasets/catalog/planet](https://developers.google.com/earth-engine/datasets/catalog/planet)
- Typical products: Daily optical imagery and analytic-ready scenes for monitoring change.
- Common use cases: Rapid event monitoring, agriculture, infrastructure and environmental compliance workflows.

### ArcGIS Hub

- URL: [https://hub.arcgis.com/](https://hub.arcgis.com/)
- Best for: Local and state open data portals and agency-hosted layers.
- Typical data: Parcels, zoning, transit, hazards, public works, and administrative boundaries.
- Common use case: Finding local authoritative layers quickly when national portals are too broad.

## Historical and Cultural Sources

### Old Maps Online

- URL: [https://www.oldmapsonline.org/](https://www.oldmapsonline.org/)
- What it is: Discovery portal for historical map collections from many institutions.
- Best for: Locating candidate historical maps before georeferencing workflows.

### David Rumsey Map Collection

- URL: [https://www.davidrumsey.com/](https://www.davidrumsey.com/)
- What it is: Major historical map archive with rich metadata and many georeferenced resources.
- Best for: Historical basemaps, cartographic comparison, and georeferencing exercises.

## Data Quality Checklist (Use Before Download)

- Is the source authoritative for your question?
- Is temporal coverage appropriate (year, season, update frequency)?
- Is spatial resolution/scale appropriate for your analysis?
- Is the CRS documented?
- Are metadata and attribute definitions complete?
- Is the license compatible with your project use?

## Search Tips

- Combine location and format in your query (for example: `California county boundaries shapefile`).
- Include thematic terms (`land cover`, `floodplain`, `zoning`, `census tract`).
- For raster workflows, check Earth Engine catalog first before bulk downloading.
- Save source URLs and citation details while you search.

In the next labs, you will use these sources to assemble project-ready data and begin analysis.
