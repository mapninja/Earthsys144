## Saving a Copy of a Joined Layer and Table

**Many operations will default to acting <span style="text-decoration:underline;">only on</span> the selected records**, if there is a **selected subset**. Failure to clear an active selection will often produce partial results.



* **Select** the **demographics.shp layer** in the **Layers panel**, and open the attribute table.
* **Unselect** all features in the table, using the methods used before above.
* Then right click on the demographics.shp in the **Layers panel**, and **Export>Save Features As...** a new shapefile named something like **tablejoin.shp**.  

This step copies the data in your temporary join to permanent storage, as a shapefile.  All items from the joined tables are saved to a new, usually larger table, with associated polygons (or points or lines).

Note that often the **column names are not copied**, e.g., each of the joined table columns is named something like “**more_data, more_data1, more_data2**….”  Easy, if tedious, to fix by renaming.   If your installation doesn’t transfer column names, you can use the steps below to fix this:



* Open a new QGIS project, and add only the tablejoin.shp that you just exported.
* **Open the attribute table** for your **tablejoin** **layer**
* **Add** and **open** the **more_data.dbf** table, and sort in ascending order on the column named **BLKGRP** (remember, click on the name until you have an upward pointing triangle)
* Also **sort** the **tablejoin.shp** attribute table by the **BLKGRP** attribute.
* Look at the set of rows, and notice how the columns match those in demojoin shapefile, that is, there is both a row and column correspondence.

We’ll want to change the **Field Names** in the exported **tablejoin.shp shapefile** to reflect those originally in the source **more_data.dbf **file.

We will use the **Refactor tool,** described on the next page, to **assign the name HH80 to the more_data_ variable,  assign HH90 to more_data_1, and so on** until the end.  Note that we do not assign BLKGRP to any of the new columns. As you might have noticed in the original join, and the columns of the exported file, **BLKGRP** is not copied, but rather the value comes from the original demographics shapefile.  



* Find or display the Processing Toolbox (if not shown, remember View>Panels or Processing>Toolbox

* **Type ‘Refactor’ **into the **Search** at the top of the **toolbox**
* Double-click on the **Refactor fields tool **

This should open the Refactor table, shown in the figure below:

The target layer (“Input layer”) is listed near the top. Once the target layer is specified (here **tablejoin.shp**), the tool lists the source expression, Field name, type, and other characteristics of the existing fields.

We can modify the Field name directly.



1. Double click on the field name cell (<span style="text-decoration:underline;">not</span> the source expression cell), and manually type the new name.
2. Do this for each of the Field names you wish to change. After specifying the output file and editing all the Field names, your table should look something like the above screenshot.
3. **Browse** and **name** the **Refactored (Output) file**. Note that you can also overwrite the existing layer, but this isn’t recommended.  

4. **Click run**, and examine the attribute table of the resulting layer (which should be added to your project, by default).

**More Calculating into New Columns**

Let’s practice adding items (columns), and modifying the values.  

We would like to know total per capita income.  We calculate this by multiplying the average household income by the number of households, and then dividing the result by population.  



1. Toggle the editing on

<p id="gdcalert4" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image4.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert5">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image4.png "image_tooltip")
, then add a new column

<p id="gdcalert5" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image5.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert6">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image5.png "image_tooltip")
.
2. Name the field something like  TotIncome, no spaces, no more than 10 characters,
3. Make the Type “Decimal number”, length 12, Precision 2, then left click on OK
4. Add a second field, name it per_cap_in, with the same specifications as Tot_Income.
5. Open the Field Calculator tool

<p id="gdcalert6" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image6.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert7">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image6.png "image_tooltip")

, and calculate the total income as

`HH90 * HHINCAVG `


6. Click OK.



<p id="gdcalert7" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image7.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert8">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image7.png "image_tooltip")



    After the calculation, inspect the **TOTINCOME** column you just calculated.



7. Use the **Field Calculator** to **Create a new field** called **PERCAPINC** and **calculate** the per capita income as:

    **<code>TOTINCOME / POPBASE</code></strong>


Again, check the results.



<p id="gdcalert8" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image8.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert9">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image8.png "image_tooltip")




8. Save your edits, and toggle editing off.


## To turn in:

Compose a map (PDF), with** 5 Categories **using **PERCAPINC**.  Remember to include all the usual required map components, and note the classification method you used for the choropleth map you are making.

Refer to [John Nelson’s blog post](http://uxblog.idvsolutions.com/2011/10/telling-truth.html) on Classification in choropleth mapping for advice on determining the appropriate classification method for this data.

Note that you can view the **Histogram tab** for your Field Values in the Layer Styling Panel, when your layer is selected to explore your options. To activate the Layer Styling Panel, on the **Main Menu:** **View>Panels>Layer Styling**





<p id="gdcalert9" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image9.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert10">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image9.png "image_tooltip")


**Creating New Tables & Joining Tables**

Creating a table and joining it to existing tables is a common operation.  Often, this join involves a one-to-many relationship between tables. Each record in one table matches many records in the second table. **For example, a typical county may have approximately 80 different soil types, but over 100,000 different soil polygons of these types.** Therefore, we may have properties for each of the 80 different types, e.g., crop productivity, engineering properties, moisture characteristics.  We may format these in a table, and join this table to our existing county data layer. The repeated properties aren’t copied, just displayed for the appropriate polygon. This saves space, because we don’t have redundant copies of the soil properties information saved for each instance of a soil polygon in our data layer.

This exercise will give you practice in creating and joining tables, and the other techniques you learned in the first section of this lab

**Table Joins**





1. Open a new blank project, and add the **_soils.shp_ data layer**

2. Right-click on the **soils layer** and go to **Layer CRS>Set Project CRS from Layer**

3. Set a **Categorical symbology** based on the variable **SOIL_TYPE (**Don’t forget to click “Classify” to see your symbols**)**


You should have a layer displayed something similar to that on the right:

The **SOIL_TYPE** attribute contains a code corresponding to the soil type of each individual polygon.  Notice there are 15 different soil types designated by numbers between 18 and 69.  There are 122 different soil polygons.  

In this exercise you will use the **SOIL_TYPE** variable in the soils shapefile as the **join item**, or **join column**. **_This is the “key” variable that will be used in a join_**.  This join matches the table rows for layer soils.shp to a new soil properties table you will import.

Let’s examine **SOIL_TYPE**, or proposed “key” or join column in the target table, via the **Properties>Fields panel**.

This should display the window at the right:  

Note the **properties** of the **SOIL_TYPE** item, **especially the Type**, but **also the length and precision**. It is generally best for join keys to have the same type in both tables, e.g., we wouldn’t want to try to join an int to a double, or to text variables.

Now we need to download a new data table with information not included in the current table. We’ll then join this new table to **soils.shp**.

Download the  **[SoilProperties.csv](https://docs.google.com/spreadsheets/d/1iD5DjOD3nREz_jGUGGMMLikyvq23z9LrmB6zJWiJBjM/edit?usp=sharing), or comma separated value file**.  This is a text file with commas between each column entry, with a line in the file corresponding to each row.  **Excel, OpenOffice, Google Sheets or LibreOffice** are all spreadsheet software that allow you to easily enter the data in cells, then **[export it as a CSV](https://docs.google.com/spreadsheets/d/1iD5DjOD3nREz_jGUGGMMLikyvq23z9LrmB6zJWiJBjM/edit?usp=sharing) **formatted file, so if you ever need to create a table of this sort, its quite easy.

**Here is the link for the table you will download:**

[https://docs.google.com/spreadsheets/d/1iD5DjOD3nREz_jGUGGMMLikyvq23z9LrmB6zJWiJBjM/edit?usp=sharing](https://docs.google.com/spreadsheets/d/1iD5DjOD3nREz_jGUGGMMLikyvq23z9LrmB6zJWiJBjM/edit?usp=sharing)



1. Once you have the **[Soil Properties Google Sheet](https://docs.google.com/spreadsheets/d/1iD5DjOD3nREz_jGUGGMMLikyvq23z9LrmB6zJWiJBjM/edit?usp=sharing)** open, use **FIle>Download>Comma-separated values **to download to your  computer**.**

2. Browse to the location that you downloaded the **SoilProperties.csv** to and **right-click** it to **Add Layer to Project...  
**
3. This should add the table to your** QGIS Layers panel**.  Left-click and open the new table, verifying the values for rows and columns.

4. Examine the **attributes** of the _SoilProperties.csv_ table

5. **Join** the **soils layer attribute table** and the **SoilProperties.csv** table you just added, using the **Join tab**, from the  **soils layer Properties**. Remember to use the common field **SOIL_TYPE** to join the files. If you are unclear on how to join, refer to the instructions on joining earlier in this lab.

6. Open the **Attribute Table **of your newly joined **soils layer**  to confirm the new data  has been properly joined.



<p id="gdcalert10" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image10.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert11">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image10.png "image_tooltip")




7. Note that, although you have many more records in your original **soils layer** (122) than your SoilProperties.csv (15)


## To turn in:

After you’ve completed the join, create a map (PDF) using the new soils data.  



* Display soils in a categorical map using the **NAME** field, added from the **SoilProperties.csv**  
* Use the Add Attribute Table tool

<p id="gdcalert11" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image11.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert12">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image11.png "image_tooltip")
 to add your **SoilProperties.csv** table to your layout. Experiment with the **Item Properties **(particularly the **Attributes Button** to clean up the header labels), for formatting the table.
* Remember that **unchecking Auto update** for your **legend** allows you to click (_AND right-click, or ** **button**, **hint hint_)  on individual items in the legend and remove or edit (Edit item button:

<p id="gdcalert12" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image12.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert13">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image12.png "image_tooltip")
**)** their appearance in the layout.

* Add the usual map elements (title, name, CRS, scale, basemap, orientation, etc…), and export a **PDF** of your map.




<p id="gdcalert13" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image13.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert14">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image13.png "image_tooltip")


I’d like to stress the utility of what you’ve just done.  You will often want information grouped and displayed in different ways, and joins are then used to add information to and produce maps, often from pre-existing boundary datasets.  Geographic data may be joined to many different sets of tabular data that aggregate characteristics we are interested in. These joined sets may be selected based on many combinations of attributes, greatly increasing the flexibility and utility of data in a GIS.
