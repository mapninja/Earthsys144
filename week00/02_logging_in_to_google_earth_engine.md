# Logging in to Google Earth Engine

## What is Google Earth Engine?

Google Earth Engine (GEE) is a cloud-based platform that lets you access and analyze massive amounts of satellite imagery and geospatial data without needing a powerful computer. Think of it like a library in the cloud where you can browse and analyze global imagery from the past few decades in real-time.

**Important concepts:**
- **Cloud-based** means the computing happens on Google's servers, not your laptop
- **Satellite imagery** is pictures of Earth taken from space
- **Geospatial analysis** is analyzing data about locations on Earth

## Why Do We Need a Google Cloud Project?

Google Earth Engine operates through something called a "Google Cloud Project" — this is essentially your account workspace within Google's cloud system. It's like opening a lab notebook where your GEE work gets organized and tracked. You need this project to:

1. Access satellite data
2. Run your analyses
3. Keep track of your work
4. Get compute resources (processing power) from Google

## Learning Objectives

By the end of this guide, you will be able to:

- Log into Google Earth Engine
- Create your first Google Cloud Project
- Register your project for non-commercial educational use
- Enable the Earth Engine API (the tool that lets you use GEE)
- Select your project so you can start analyzing data
- Share your work with instructors and classmates

---

## Step-by-Step: Setting Up Your Google Earth Engine Account

### Step 1: Access Google Earth Engine

1. Go to [https://code.earthengine.google.com/](https://code.earthengine.google.com/)
2. Log in using your Google account (or Stanford account if you're a Stanford student)
   - If you don't have a Google account, create one first at [google.com](https://www.google.com)
3. Accept the terms of service

You should now see the **Code Editor** interface. This is where you'll write scripts and analyze satellite data. The interface has several key areas:
- **Code Editor** (left side) - where you write your code
- **Map** (center/right) - where results are displayed
- **Console** (bottom right) - where messages and results appear
- **Assets** (left sidebar) - where you can store data

![Google Earth Engine Code Editor](images/20260220_110253_image.png)

### Step 2: Create a New Google Cloud Project

Now you need to create a Google Cloud Project. This is like creating a new workspace where your GEE account lives.

1. Click on your **Profile Icon** in the top right corner of the Code Editor

![Profile Icon location](images/20260220_110446_image.png)

2. Select **Register a new Cloud Project**
3. Enter a **Project name** (be descriptive, like "Earthsys144" or "GIS-Analysis-Spring2026")

![Project naming dialog](images/20260220_110920_image.png)

4. Click on the **Parent resource > Browse** link
5. Select **"GEE Student Projects"** from the list

![Parent resource selection](images/20260220_110944_image.png)

6. Click the **Create** button to mint your new project

![Create button](images/20260220_111042_image.png)

The system will now create your project. This may take a moment.

### Step 3: Access the Configuration Dashboard

Once your project is created, you should automatically go to the Configuration Dashboard. If not:

1. Click on your **Profile Icon** again
2. Select **Select Project**
3. Choose the project you just created
4. Click **Select**

![Select Project menu](images/20260220_111231_image.png)

**Note:** The Configuration Dashboard is where you configure permissions and settings for your project. Make sure you're viewing the correct project name before proceeding.

![Configuration Dashboard](images/20260220_111545_image.png)

### Step 4: Register Your Project for Non-Commercial (Educational) Use

For this course, you'll register your project as a non-commercial educational project, which gives you access to GEE's data and computing power without needing a credit card.

1. In the Configuration Dashboard, click on **See if you are eligible for non-commercial use > Get Started**

![Non-commercial registration button](images/20260220_112130_image.png)

2. Fill out the registration form with information about your use case:
   - Select **"Research & Education"** as your primary use case
   - Confirm that your use is non-commercial

![Registration form](images/20260220_112335_image.png)

3. Click **Check Eligibility**
4. When asked to choose a compute tier, select **"Community"** 
   - Community tier is designed for students and small research projects
   - It provides free access with reasonable computing limits

![Compute tier selection](images/20260220_112550_image.png)

5. Complete the remaining registration steps by filling out any additional forms

![Registration completion](images/20260220_112722_image.png)

![Final registration step](images/20260220_112807_image.png)

6. Click the **Register** button to complete the process

### Step 5: Enable the Earth Engine API

After registration completes, a pop-up window should appear asking you to enable the Earth Engine API. The API is what actually lets your project use Google Earth Engine.

![API enablement pop-up](images/20260220_112855_image.png)

1. Click the **Enable** link in the pop-up window

![Enable button detail](images/20260220_112941_image.png)

2. You may be taken to a Google Cloud Console page — this is normal
3. If prompted, confirm the API enablement

### Step 6: Select Your Project in Earth Engine

Now you need to tell the Code Editor which project to use.

1. Return to the Code Editor window
2. Click on your **Profile Icon** (top right)
3. Select **Select > Choose a Cloud Project**

![Profile menu for project selection](images/20260220_113116_image.png)

4. Find and select the project you just created

![Project selection modal](images/20260220_113340_image.png)

5. Click the **Select** button

![Selected project confirmation](images/20260220_113402_image.png)

Congratulations! Your project is now active in the Code Editor.

### Step 7: Test Your Setup

To verify everything is working:

1. You should see your project name in the top-right corner of the Code Editor
2. Try running a simple test script to confirm access
3. If you don't have a script, you can use this sample: [https://code.earthengine.google.com/f983a2d843739e23ffb77f336ad6d4fb](https://code.earthengine.google.com/f983a2d843739e23ffb77f336ad6d4fb)
   - Click **Run** to execute the script
   - You should see results appear on the map within a few seconds

---

## Sharing Your Work

### How to Share Your GEE Scripts

When submitting assignments, you'll need to share your GEE scripts with your instructor. Here's how:

1. In the Code Editor, click the **Share** button (top menu)
2. Copy the link that appears (or click "Get Link")
3. By default, this creates a "view-only" link that lets others see your code but not edit it
4. If you want others to edit, you can change permissions to "Editor" (not typically needed for homework)
5. Test the link by opening it in an **incognito window** to make sure it's accessible
6. Include this link in your homework submission

### Best Practices for Sharing

- Always test your shared links before submitting
- Use view-only access for homework submissions
- Include a brief description in your script comments explaining what it does
- Make sure your project name is descriptive so instructors know it's your work

---

## Troubleshooting

### I don't see the pop-up to enable the Earth Engine API
- Check your browser's pop-up blocker settings
- Try the process again
- Manually navigate to Google Cloud Console if needed

### My project won't initialize
- Log out and log back in
- Try a different browser
- Clear your browser's cookies and cache
- Contact your instructor for help

### I can't find my project in the "Select Project" menu
- Make sure you completed the registration form
- Wait a few minutes and refresh the page
- Create a new project if the old one won't appear

