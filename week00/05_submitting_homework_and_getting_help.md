# Submitting Homework and Getting Help

## Introduction

Effective communication is crucial in a course with nearly 100 students - both when submitting your work and when seeking assistance. This guide teaches you the essential skills for properly formatting and submitting various types of assignments, as well as how to effectively seek help when you encounter technical problems.

## Learning Objectives

By the end of this guide, you will be able to:

- Submit homework in proper formats (images, PDFs, links)
- Create high-quality screenshots and documentation
- Write effective issue reports and help requests
- Use GitHub's issue tracking system
- Share Google Earth Engine scripts for troubleshooting
- Follow best practices for academic integrity and collaboration

## Submitting Homework

### Course-Wide Turn-In Rule

For this course, all assignments labeled `TURN_IN` should be uploaded to Canvas as PDF files.

- If your assignment output is a map layout, export the map from QGIS or the relevant software as a PDF.
- If your assignment output is one or more URLs, place those URLs in a Google Doc with your name and the assignment title, then export that Google Doc as a PDF for submission.
- If an assignment asks for more than one deliverable, Canvas can accept multiple PDF uploads, so submit each required PDF file there unless the assignment instructions say to combine them into one document.

> **Why use PDFs for all turn-ins?** A consistent PDF workflow makes grading easier, keeps submissions legible, and gives both you and the instructional team a stable record of exactly what was submitted.

### Submitting Images

**When to use screenshots:**

- **Asking for help**: Show errors, interface problems, or unexpected results
- **Simple submissions**: When explicitly instructed to submit a "simple screenshot"
- **Quick documentation**: Capturing work-in-progress or intermediate steps
- **Technical support**: Demonstrating software behavior or issues

**When NOT to use screenshots:**

- **Formal cartographic submissions**: If the assignment requires legends, north arrows, scale bars, titles, or other cartographic elements, use PDF export instead (see Section 1.2)
- **Professional maps**: When proper layout and design elements are expected
- **Final deliverables**: Screenshots lack the precision and completeness of proper map layouts

**Format Requirements:**

- PNG for maps and screenshots (lossless compression)
- JPEG for photographs (smaller file size)
- Avoid data & proprietary formats (TIFF, jp2)

**Quality Standards:**

- Sufficient resolution for clear reading
- Appropriate file size (typically < 5MB)
- Descriptive filenames
- Capture only the relevant content area

#### [Creating Screenshots on macOS](https://support.apple.com/en-us/102646)

**Method 1: Keyboard Shortcuts (Recommended)**

- **Entire screen**: `Command + Shift + 3`

  - Saves to Desktop as PNG automatically
  - Files named with timestamp (e.g., "Screenshot 2024-09-22 at 2.30.45 PM.png")
- **Selected area**: `Command + Shift + 4`

  - Cursor changes to crosshairs
  - Click and drag to select area
  - Release to capture
  - Press `Escape` to cancel
- **Specific window**: `Command + Shift + 5`

  - Cursor changes to camera icon
  - Click on any window to capture it with drop shadow
  - Great for capturing QGIS interface cleanly

**Method 2: Screenshot App**

1. Open **Screenshot** app (in Applications > Utilities)
2. Choose capture type: Entire Screen, Selected Windows, or Selected Portion
3. Set timer if needed
4. Choose save location
5. Click **Capture**

**macOS Screenshot Tips:**

- **Copy to clipboard instead**: Add `Control` key to any combination (e.g., `Command + Control + Shift + 4`)
- **Show mouse cursor**: Use Screenshot app and check "Show mouse pointer"
- **Save to different location**: Screenshot app > Options > Save to [location]
- **Change format**: Screenshot app > Options > Format (default PNG is best for GIS work)

#### [Creating Screenshots on Windows](https://www.microsoft.com/en-us/windows/learning-center/how-to-screenshot-windows-11)

**Method 1: Snipping Tool / Snip & Sketch (Recommended)**

- **Open Snipping Tool**: `Windows + Shift + S` (opens Snip & Sketch overlay)
- **Capture types**:
  - Rectangular snip (most common)
  - Freeform snip (irregular shapes)
  - Window snip (entire window)
  - Fullscreen snip

**After capturing:**

1. Image appears in notification
2. Click notification to open in Snip & Sketch
3. Annotate if needed (arrows, highlights, text)
4. Save as PNG from File menu

**Method 2: Print Screen Key**

- **Entire screen**: `Print Screen` (copies to clipboard)
- **Active window**: `Alt + Print Screen`
- **Save directly**: `Windows + Print Screen` (saves to Pictures > Screenshots folder)

**Windows Screenshot Tips:**

- **Always save as PNG**: Better quality than JPEG for screenshots
- **Use Snip & Sketch for annotations**: Built-in arrows and highlighting tools
- **Organize screenshots**: Create dedicated folder for course screenshots
- **Check save location**: Screenshots may save to different folders depending on method used
- **For high DPI displays**: Screenshots automatically capture at correct resolution

### Submitting PDFs

PDF is often required for formal map layouts:

**Creating PDFs from QGIS:**

1. Use Print Layout for professional cartographic output
2. Set appropriate page size and margins
3. Include title, legend, scale bar, coordinate reference system (CRS), north arrow (when appropriate), date and your name
4. Export as PDF with high resolution (300 DPI minimum)

**Common PDF Problems and Solutions:**

- **Fonts not embedded**: Use standard fonts or embed all fonts
- **Images appear pixelated**: Increase raster resolution in export settings
- **File size too large**: Optimize images before adding to layout
- **Colors look different**: Use RGB color space for screen viewing

### Submitting Links

Many assignments require links, but in this course link-based `TURN_IN` work should still be submitted to Canvas as a PDF document that contains those links.

**Common Link Types:**

- GitHub repository URLs
- Google Earth Engine shared scripts
- ArcGIS Online web maps
- Google Colab notebooks
- Published web maps and applications

#### Google Docs PDF Submission for URLs

**When to use this method:**

- Assignment requires one or more links
- You need to provide context or descriptions for links
- You want your `TURN_IN` submission to follow the course PDF submission standard
- You want to organize links with headings or annotations

**Creating a Google Docs link submission:**

1. **Create new Google Doc**:

   - Go to docs.google.com
   - Click "Blank document"
   - Title your document: "[Your Name] - [Assignment Name] Links"
2. **Add your links with context**:

   ```
   Assignment: Week 01 Lab 02
   Student: Jane Smith

   GitHub Repository:
   https://github.com/username/earthsys144-week01
   (Contains all code and data files for the assignment)

   Google Earth Engine Script:
   https://code.earthengine.google.com/abcd1234efgh5678
   (Interactive script showing precipitation analysis)
   ```
3. **Make links clickable (hyperlinked)**:

   - **Automatic method**: Google Docs usually auto-formats URLs as hyperlinks
   - **Manual method**:
     - Select the URL text
     - Press `Ctrl/Cmd + K` or click Insert → Link
     - Ensure URL is correct and click "Apply"
   - **Verify**: Hyperlinks should appear blue and underlined
4. **Download as PDF**:

   - Click **File → Download → PDF Document (.pdf)**
   - Save with descriptive filename: `Smith_Jane_Week01_Links.pdf`
   - Upload the PDF file to Canvas assignment submission

**Minimum content for a URL submission PDF:**

- Your name
- The course and assignment title
- Each required URL
- A short label explaining what each URL points to

**Google Docs PDF Benefits:**

- **Professional appearance**: Clean, formatted document
- **Multiple links**: Organize several links with descriptions
- **Permanent record**: PDF preserves formatting and content
- **Accessibility**: Works even if Google Docs access changes
- **Context**: Add descriptions, notes, or instructions for each link

**Link Submission Best Practices:**

- **Test links**: Open each link in private/incognito browser window
- **Verify permissions**: Ensure links are publicly accessible or properly shared
- **Descriptive context**: Include brief description of what each link contains
- **Organized format**: Use clear headings and consistent formatting
- **Check submission**: Verify your PDF uploaded correctly to Canvas

## Getting Help

### Understanding "Issues" in Programming and GIS

In programming and spatial data science, an **"issue"** is simply a structured way to describe a problem, question, or request for help. Think of it as a detailed problem report that gives someone else all the information they need to understand and help solve your problem.

**Common student issues include:**

- "This is giving me an error and I don't know why"
- "The lab instructions don't make sense to me"
- "My map looks different from the example"
- "QGIS crashed when I tried to do step 5"
- "I think there's a mistake in the course materials"

**Why structure matters:**
A well-written issue helps others help you faster and more effectively. Whether you're asking a classmate, instructor, or posting on a technical forum, clear communication leads to better solutions.

### Writing a General Help Issue (Getting Help with Labs)

Use this format when you need help with assignments, technical problems, or understanding concepts:

#### Issue Template for Lab Help

**Title:** Brief, specific description of the problem

```
Example: "QGIS crashes when opening shapefile in Week 2 Lab 1"
NOT: "Help!" or "QGIS problem"
```

**Issue Description Format:**

1. **What I'm trying to do:**

   - "I'm working on Week 2, Lab 1, Step 8"
   - "I'm trying to load the population shapefile into QGIS"
2. **What I expected to happen:**

   - "The shapefile should load and display as a map layer"
   - "Based on the lab instructions, I should see a choropleth map"
3. **What actually happened:**

   - "QGIS immediately crashes with no error message"
   - "The layer loads but appears completely blank"
4. **My system information:**

   - Operating System: macOS Sonoma 14.1 / Windows 11
   - QGIS Version: 3.34 (check Help → About)
   - File location: Where your data files are stored
5. **What I've already tried:**

   - "Restarted QGIS"
   - "Tried a different shapefile"
   - "Checked that all files (.shp, .shx, .dbf, .prj) are present"
6. **Screenshots or error messages:**

   - Include full error messages (copy exact text)
   - Screenshots showing the problem
   - Before/after screenshots if relevant

#### Example Good Lab Help Issue

**Title:** "Population data not displaying correctly in QGIS Week 3 Lab 2"

**Description:**
"I'm working on Week 3, Lab 2, Step 12 where we're supposed to create a population density map.

**What I expected:** The population data should display as different colored areas showing population density.

**What's happening:** All the areas are showing up as the same gray color, even though I followed the symbology steps.

**My setup:**

- macOS Ventura 13.2
- QGIS 3.34.1
- Files are in my Local_GIS/Week03/data/ folder

**What I've tried:**

- Rechecked the attribute table - the population data is there
- Tried different classification methods
- Restarted QGIS and reopened the project

**Screenshots:** [attach screenshots of your symbology panel and map display]

Any ideas what might be wrong?"

### Need to Report Course Material Problems?

If you find errors, unclear instructions, or problems with the course materials themselves, please see **[06 - Help Fix the Labs](06_help_fix_the_labs.md)** for detailed guidance on submitting GitHub issues to improve the course for future students.

### Supporting Your Issues with Evidence

#### Screenshots for Technical Support

**Effective screenshots for getting help:**

- Show the entire relevant interface
- Include error messages in full (don't crop them)
- Highlight the problem area with arrows or circles
- Show system information when relevant
- Capture before and after states when possible

#### Sharing Google Earth Engine Scripts

**When sharing GEE scripts for troubleshooting:**

1. Click the "Get Link" button in the Code Editor
2. Choose "Anyone with the link can view" permissions
3. Copy the generated URL
4. Test the link in an incognito window
5. Include the link in your issue report

#### Including System Information

**Always include:**

- Operating System and version
- Software versions (QGIS, browser, etc.)
- File locations and folder structure
- Any recent changes to your setup

## Communication Best Practices

### Professional Communication

When seeking help or submitting work:

- Use clear, professional language
- Be specific about the problem or question
- Provide context for your work
- Show what you've already attempted
- Be patient and respectful

### Academic Integrity

Guidelines for collaboration and individual work:

- Clearly attribute any code or methods borrowed from others
- Collaborate appropriately based on assignment guidelines
- Ask for clarification when collaboration rules are unclear
- Maintain your own backup copies of all work

### Time Management

Effective strategies for managing coursework:

- Start assignments early to allow time for troubleshooting
- Keep organized records of your work process
- Document problems as they occur
- Seek help promptly rather than struggling alone
