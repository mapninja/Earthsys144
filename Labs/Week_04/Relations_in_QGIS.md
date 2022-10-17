## Relations in QGIS  

Relations are special joins, with the ability to create connections between tables with different numbers of records. For instance, imagine that you are responsible for the rolling inventory of street trees in your city.

Creating a new point every time you revisit a tree to re-survey isn't the presents all sorts of problems for querying and maintaining the data. Ideally, you might want to create a spatial dataset of `locations`, with a single point geometry for each tree site. Keeping in mind that each tree site can have multiple "states" (such as: Tree, Dead Tree, Stump, Planting Site, New Planting, etc...), you create a separate table to store the `survey_records` for the `locations` as you revisit the locations, year-over-year.

This is the simplest meaning of _normalizing tables_, in the context of relational databases. The object is to remove redundancy of data, and here we would be removing the need to record the coordinates, address, property ID and other properties of the `locations`, with every subsequent `survey_records` revisit.

To connect the two datasets, you use a `unique_identifier`, or _keyfield_ (perhaps a randomly generated code, or the coordinate pair of the `locations`) for the `locations` that also exists in the `survey_records` table, so that  every row in `survey_record` has the value of the `unique_identifier` for only one `location`. This would be a "**one-to-many**" relation, where **one** `locations` row might have **many** matching `survey_records` rows, depending on how many times it has been surveyed.

Not only can you very quickly query all of the `unique_identifier` records for a single `location` but you can leverage the relations in the other direction to do things like identifying the `locations` of all dead trees, or planting sites, etc..., or summarize the conditions of all trees in a particular area, by combining the relations with a **Selection by Location**.

In this exercise, you will create Relations between several datsets in QGIS in order to answer the questions:

1. What are the chemicals being released within 5km of any particular school in our study area, and
