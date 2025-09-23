# Help Fix the Labs

## Introduction

Welcome to Earthsys144! This course is an ever-evolving educational experience that tries to incorporate new technology and techniques every quarter. As spatial data science rapidly advances, we continuously update our labs to include the latest tools, methods, and best practices.

**You can help make this course better for future students!**

One of the most valuable contributions you can make is identifying problems in the course materials and suggesting improvements. When you find errors, unclear instructions, or broken links, submitting a GitHub issue helps us fix problems quickly and keeps the course current and accurate.

## Learning Objectives

By the end of this lab, you will be able to:

- Understand how to contribute to course improvement through GitHub issues
- Identify when course materials need correction or clarification
- Write effective technical issues that help instructors fix problems quickly
- Use GitHub's issue tracking system for course materials
- Become part of a collaborative learning community

## Why Your Help Matters

### The Challenge of Keeping Current

**Technology moves fast:**

- New software versions are released constantly
- Web services change their interfaces
- Data sources get updated or moved
- Best practices evolve with new research

**Quarter-to-quarter changes:**

- QGIS updates multiple times per year
- Google Earth Engine adds new features
- ArcGIS Online interfaces change
- Operating systems get updated

**Your fresh perspective helps:**

- You encounter problems we might miss
- You see instructions with "beginner's eyes"
- You test the labs on different computer setups
- You catch inconsistencies between related labs

### The Impact of Your Contributions

**When you submit a good issue:**

- Future students won't get stuck on the same problem
- The course becomes more accessible to diverse computer setups
- Instructions become clearer and more precise
- We can fix problems before they affect entire classes

**Real examples of student contributions:**

- Fixed broken download links before 50+ students tried to use them
- Clarified confusing button descriptions that were causing widespread confusion
- Identified missing prerequisite steps that were causing lab failures
- Suggested better file organization that improved workflow efficiency

## Writing Technical GitHub Issues for Course Materials

### When to Submit a GitHub Issue

**Submit GitHub issues for course material problems:**

- **Typos or errors in lab instructions**

  - Spelling mistakes, incorrect terminology
  - Wrong step numbers or references

- **Broken links or missing files**

  - Download links that return 404 errors
  - References to files that don't exist in the data folders
  - Links to external resources that have moved

- **Unclear or confusing explanations**

  - Instructions that could be interpreted multiple ways
  - Technical terms used without definition
  - Steps that assume knowledge not covered earlier

- **Steps that don't work as written**

  - Software behaves differently than described
  - Menu options have changed locations
  - Tools produce different results than expected

- **Missing information or prerequisites**

  - Required software not mentioned in setup
  - Assumed knowledge that isn't covered
  - Dependencies between labs not clearly stated

- **Suggestions for improving course materials**
  - More efficient workflows you've discovered
  - Additional resources that would help students
  - Better ways to explain difficult concepts

### What NOT to Submit as GitHub Issues

**Don't submit GitHub issues for:**

- **Personal help with assignments** (use general help channels instead)

  - Your specific technical problems
  - Questions about assignment requirements
  - Requests for help understanding concepts

- **Questions about concepts** (ask in class or office hours)

  - "What does this mean?"
  - "Why do we do this step?"
  - "How does this relate to the lecture?"

- **Technical problems with your computer setup**
  - Software installation issues
  - Operating system-specific problems
  - Hardware compatibility issues

## GitHub Issue Template for Course Materials

### Title Format

Make your title specific and actionable:

**Good titles:**

- "Week 2 Lab 1 Step 8: Broken download link for population data"
- "Week 3 README: Missing prerequisite information about QGIS plugins"
- "Week 5 Lab 2 Step 12: Screenshot shows old QGIS interface"

**Poor titles:**

- "Problem with Week 2"
- "Help!"
- "This doesn't work"

### Issue Labels to Use

When creating your issue, add appropriate labels:

- **`bug`** - Something is definitely wrong (broken links, incorrect instructions)
- **`documentation`** - Instructions need clarification or improvement
- **`enhancement`** - Suggestion for making something better
- **`outdated`** - Content needs updating for new software versions

### Issue Description Template

Use this structure for your issue description:

#### 1. Location of Problem

Be very specific about where the problem occurs:

- "Week 2, Lab 1, Step 8"
- "Week 3 README.md, Section 2.1, bullet point 3"
- "Summary.md navigation link to Week 5"

#### 2. Specific Problem

Describe exactly what's wrong:

- "The download link returns a 404 error"
- "Instructions say to 'click the blue button' but there are three blue buttons in the interface"
- "Step 12 refers to 'the attribute table we created in step 8' but step 8 doesn't create an attribute table"

#### 3. Impact on Students

Explain how this affects the learning experience:

- "Students cannot complete the lab without this data"
- "Multiple students are confused about which button to click"
- "This creates a logical gap in the workflow that breaks the analysis"

#### 4. Suggested Fix (if you have one)

If you know how to fix it, share your solution:

- "Update link to point to https://newdatasource.gov/population.zip"
- "Add clarification: 'click the blue Export button in the main toolbar'"
- "Add step 8a: 'Right-click the layer and select Open Attribute Table'"

#### 5. Evidence

Include supporting materials:

- Screenshots of the problem
- Copy of exact error messages
- Links to broken resources
- Screenshots comparing what's shown vs. what students see

## Example: Complete GitHub Issue

**Title:** "Week 1 Lab 3 Step 15: Incorrect file path for Linux users"

**Labels:** `bug`, `documentation`

**Description:**

**Location:** Week 1, Lab 3, Step 15

**Problem:** The instructions provide file paths for Windows and Mac users, but the Linux path is incorrect.

**Current instruction says:**

```
Linux: ~/Documents/Earthsys144/Week01/
```

**Should be:**

```
Linux: ~/Documents/Earthsys144/week01/
```

**Impact:** Linux users cannot find their files because the folder is named 'week01' (lowercase) not 'Week01' (capitalized). This prevents them from completing the lab and causes confusion about the course file structure.

**Evidence:** I'm using Ubuntu 22.04 and confirmed the folder structure uses lowercase names as shown in the Week 0 setup instructions. Screenshot attached showing actual folder structure.

**Suggested fix:** Update the path in Step 15 to use lowercase 'week01' for consistency with the folder structure established in Week 0 setup instructions.

## How to Submit Your Issue

### Step 1: Access the Course Repository

1. Go to the course GitHub repository (link provided in Canvas)
2. Click the "Issues" tab at the top of the page
3. Check if someone has already reported the same problem

### Step 2: Create a New Issue

1. Click "New Issue" button
2. Choose the appropriate issue template (if available)
3. Fill in your title and description using the format above
4. Add appropriate labels
5. Click "Submit new issue"

### Step 3: Follow Up

1. Check for responses from instructors or other students
2. Provide additional information if requested
3. Test fixes when they're implemented
4. Close the issue if you confirm it's resolved

## Best Practices for Course Contribution

### Be Constructive

- Focus on improving the learning experience
- Suggest solutions when possible
- Be respectful and professional in your language
- Remember that instructors are trying their best to keep up with rapidly changing technology

### Be Specific

- Provide exact step numbers and locations
- Include complete error messages
- Attach relevant screenshots
- Test your suggested fixes before proposing them

### Be Collaborative

- Search existing issues before creating new ones
- Add to existing discussions when relevant
- Help test fixes proposed by others
- Share resources you find helpful

## The Bigger Picture

### You're Part of the Solution

By contributing to course improvement, you're:

- **Building professional skills** - Technical writing, issue tracking, and collaborative development are valuable career skills
- **Improving education** - Your contributions help dozens of future students
- **Learning GitHub** - Issue tracking and collaborative development are industry standards
- **Developing community** - You're part of a learning community that supports each other

### Skills You're Developing

**Technical communication:**

- Writing clear, actionable problem reports
- Providing evidence and context
- Proposing specific solutions

**Quality assurance:**

- Testing procedures and identifying edge cases
- Documenting problems systematically
- Verifying fixes work as intended

**Collaboration:**

- Working with instructors and peers to solve problems
- Contributing to shared resources
- Building on others' contributions

## Conclusion

This course belongs to all of us - instructors and students together. By helping identify and fix problems in the course materials, you're not just completing an assignment; you're improving the learning experience for everyone who comes after you.

Every semester, student contributions make this course more accessible, more current, and more effective. Your fresh perspective and careful attention to detail are invaluable resources that help us keep pace with the rapidly evolving world of spatial data science.

Thank you for being part of the solution!
