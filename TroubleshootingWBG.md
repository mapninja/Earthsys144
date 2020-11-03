# Troubleshooting WhiteboxGAT

If you are having trouble getting **WhiteboxGAT** to run on your Mac, by **right-click>Open** and selecting Open in the security warning popup, then try the following:

1. Right-click on the folder containing the **WhiteboxGIS.jar** file and go to **Services>New Terminal at Folder**
2. In the resulting Terminal Window, enter the following:

`xattr -dr com.apple.quarantine WhiteboxGIS.jar`  

then:

`java -jar WhiteboxGIS.jar`

This removes an overly aggressive quarantine from teh jar file, and hopefully allows you to run it.

If that doesn't work, then try using the following instructions for a Clean Install of QGIS PR, and WhiteboxTools for QGIS.

Note that there will be chages to the workflows you will use, between the lab written for WhiteboxGAT and the tools you will use in WhiteboxTools. Please look at the Lab Addenda Announcements on Canvas to find some of the support there on the differences between the two labs. If those announcements steps don't get you through, please use Slack to get in touch, in the Labs channel.  
