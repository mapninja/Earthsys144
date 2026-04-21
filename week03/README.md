# Week 03 - Tables & Queries

## Overview

This week introduces one of the most important ideas in GIS: a layer is not only geometry on a map, but also a table.

That means a large part of GIS work depends on how information is structured in rows, columns, fields, and related tables. Before students can do more advanced analysis, they need to be comfortable reading table structure, recognizing key fields, understanding what a join actually does, and seeing how tabular logic affects mapping.

Week 03 is organized around that transition.

You will move from:

1. inspecting table structure in QGIS
2. joining descriptive information to mapped features
3. calculating new values from joined attributes
4. using SQL to ask more explicit questions of relational data
5. improving the communication of those results through cartographic design

## Core Ideas for the Week

### A GIS layer is also a table

When you open a GIS layer, you are not only looking at shapes on a screen. You are also looking at records and variables.

- A **row** usually represents one feature.
- A **column** stores one type of information.
- A **field name** tells you what the column is meant to contain.
- A **field type** tells QGIS how the values should be interpreted.

Many GIS problems are really table problems first.

### Joins connect geometry to meaning

A join works by matching values in a shared field.

This week you will work with classic join patterns such as:

- many polygons connecting to one lookup-table record
- one layer being joined to another layer through a shared identifier
- tables being linked so a map can be symbolized or queried using more meaningful attributes

The important point is that QGIS is usually joining tables first and then displaying the result through the geometry of the target layer.

### Relational structure matters

You will encounter several relational ideas this week:

- **key fields**
- **primary keys**
- **foreign keys**
- **one-to-many** and **many-to-one** relationships

These are not just database terms. They explain why some joins work, why some fail, and why some data structures are more flexible than others.

### SQL makes the table logic explicit

The SQL lab pushes the same ideas further. Instead of relying only on menus and dialogs, you will begin asking direct questions of the data using `SELECT`, `WHERE`, `GROUP BY`, and `JOIN`.

The goal is not just to memorize syntax. The goal is to understand that GIS analysis often depends on being precise about:

- which rows you want
- how tables are related
- how values should be summarized
- which features are close to one another in space

### Cartography still matters

This week is not only about joining and querying data. It is also about presenting it clearly.

The cartographic design materials for the week ask you to look at hierarchy, legibility, clutter, basemap choice, legends, titles, locator maps, and general layout structure. By this point in the course, students should be moving beyond "I made a map" toward "I made a map that communicates well."

## How the Week Fits Together

### [01 - TURN IN - Basic Table Structures and Operations in QGIS](01_TURN_IN_basic_table_structures_and_operations_in_qgis.md)

This lab introduces a lookup-table join using a soils polygon layer and a separate soil-properties table. The main goal is to understand the characteristics of a many-to-one join from the perspective of the feature layer.

### [02 - TURN IN - Basic Table Joins and Calculations in QGIS](02_TURN_IN_basic_table_joins_and_calculations.md)

This lab extends those ideas by joining one county layer to another and then calculating both absolute and percent change. It also introduces a choropleth mapping decision: once you can calculate a value, you still have to decide how to classify and symbolize it.

### [03 - TURN IN - SQL Operations in QGIS](03_TURN_IN_sql_operations_in_qgis.md)

This lab moves from menu-driven table work into SQL and relational querying inside QGIS. Here, the emphasis is on using saved queries, understanding how tables relate, and turning SQL results back into mappable outputs.

### [04 - TURN IN - Cartographic Design Basics](04_TURN_IN_cartographic_design_basics.md)

This page points you to David Medeiros' materials for the week. The redesign exercise complements the technical table work by focusing on communication, layout revision, and design judgment.

## What to Expect in the Individual Lab Documents

The individual lab pages for this week are intended to be more hands-on and workflow-focused.

That means:

- the step-by-step documents emphasize what to click, inspect, compare, calculate, and export
- conceptual framing is concentrated here in the week overview
- shorter notes remain inside the lab documents wherever they directly explain a workflow choice or help prevent a likely beginner mistake

Use this page as the conceptual guide for the week, and use the individual lab pages as the operational guides for completing the exercises.
