# Installing QGIS and Plugins

## Introduction

QGIS (Quantum Geographic Information System) is a free, open-source desktop GIS application that will serve as our primary tool for spatial data analysis and cartography. This lab will guide you through the installation process and setup of essential plugins and additional software tools.

## Learning Objectives

By the end of this lab, you will be able to:

- Install QGIS and verify proper functionality
- Install and configure essential QGIS plugins
- Set up additional software tools for the course
- Configure text editing and file transfer applications

## 1. QGIS Installation

### 1.1 Download and Install QGIS

QGIS installation varies by operating system:

**Windows:**

1. Visit [qgis.org/en/site/forusers/download.html](https://qgis.org/en/site/forusers/download.html)
2. Download the Long Term Release (LTR) version
3. Run the installer with administrator privileges
4. Accept default installation options

**macOS:**

1. Download the official QGIS installer for macOS
2. Follow the installation instructions carefully
3. Allow installation from identified developers in System Preferences
4. Verify installation by launching QGIS

**Linux:**

1. Use your distribution's package manager
2. Add the official QGIS repository for latest versions
3. Install using apt, yum, or equivalent package manager

### 1.2 First Launch and Verification

After installation:

1. Launch QGIS and wait for the splash screen
2. Verify the interface loads properly
3. Check the About dialog for version information
4. Test basic functionality by creating a new project

## 2. Essential QGIS Plugins

### 2.1 Quick Map Services

Quick Map Services provides easy access to basemap layers:

1. Go to **Plugins → Manage and Install Plugins**
2. Search for "QuickMapServices"
3. Install and enable the plugin
4. Access via **Web → QuickMapServices** menu
5. Enable additional providers in settings for more basemap options

### 2.2 WhiteBox Tools

WhiteBox Tools provides advanced terrain analysis capabilities:

1. In the Plugin Manager, search for "WhiteboxTools Open-Core"
2. Install the plugin
3. The plugin will download the WhiteBox executable automatically
4. Verify installation by checking the Processing Toolbox
5. Test with a simple terrain analysis function

### 2.3 SAGA and SAGA Next Generation Plugin

SAGA provides additional geoprocessing algorithms:

1. Search for "SAGA NextGen" in the Plugin Manager
2. Install the plugin
3. SAGA tools will appear in the Processing Toolbox
4. Verify installation by expanding the SAGA folder in Processing
5. Note: Some tools may require additional configuration

## 3. Additional Software Installation

### 3.1 OpenRefine

OpenRefine is essential for data cleaning and transformation:

**Installation:**

1. Visit [openrefine.org](https://openrefine.org)
2. Download the appropriate version for your OS
3. Extract the downloaded file
4. Launch according to your operating system instructions
5. Verify by opening localhost:3333 in your browser

**Usage Notes:**

- OpenRefine runs as a local web application
- Keep the terminal/command window open while using
- Works with CSV, JSON, XML, and other structured data formats

### 3.2 Secure FTP Client

For transferring files to Stanford's AFS system:

**FileZilla (Cross-platform):**

1. Download from [filezilla-project.org](https://filezilla-project.org)
2. Install using default settings
3. Configure connection to myth.stanford.edu
4. Test connection with your Stanford credentials

**Alternative Options:**

- **Windows:** WinSCP
- **macOS:** Cyberduck or built-in Terminal
- **Linux:** Command-line sftp or nautilus

### 3.3 Text Editor

A good text editor is essential for code and documentation:

**Recommended Options:**

- **Visual Studio Code** (free, cross-platform, excellent for code)
- **Atom** (free, highly customizable)
- **Sublime Text** (fast, powerful, trial available)
- **Notepad++** (Windows only, lightweight)

**Configuration Tips:**

- Install syntax highlighting for common spatial data formats
- Configure line endings for your operating system
- Enable word wrap for markdown files

## 4. Configuration and Testing

### 4.1 QGIS Configuration

Optimize QGIS for course work:

1. Set default coordinate reference system to WGS84
2. Configure processing tools location
3. Set up project templates
4. Configure rendering and performance settings

### 4.2 Plugin Testing

Verify all plugins work correctly:

1. Load a sample dataset
2. Test Quick Map Services basemap loading
3. Run a simple WhiteBox terrain analysis
4. Verify SAGA tools appear in Processing Toolbox

### 4.3 Integration Testing

Test software integration:

1. Create a simple dataset in QGIS
2. Export to CSV and open in OpenRefine
3. Clean data in OpenRefine and re-import to QGIS
4. Save project and verify all components work together

## Troubleshooting Common Issues

### QGIS Won't Launch

- Check system requirements
- Run as administrator (Windows)
- Clear QGIS settings folder
- Reinstall with antivirus disabled

### Plugins Not Working

- Verify QGIS version compatibility
- Check internet connection for online plugins
- Clear plugin cache
- Reinstall problematic plugins

### Processing Tools Missing

- Enable Processing plugin in Plugin Manager
- Refresh Processing Toolbox
- Check provider settings in Processing options

## Next Steps

With QGIS and essential plugins installed, you're ready to create your first maps and begin exploring the world of spatial data visualization and analysis.
