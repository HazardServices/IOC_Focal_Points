Localization
============

Hazard Services needs to be localized to your site. This document covers Hazard Services-specific steps needed and assumes that more general localization steps such as porting over a Hydro Database, setting up FFMP, and localizing EDEX have been taken care of.

The Localization Perspective in CAVE provides access to the user-configurable files for various applications. There is a directory for Hazard Services which contains configuration files, recommenders, and product generators. Each file has a BASE version which can be viewed in the Localization editor by clicking on it. A copy of this file can be made to produce a SITE, Desk, Workstation, or User version. If these versions exist, they are used instead of the BASE version in a hierarchical manner. For example, if a SITE version exists, it is used instead of the BASE. If a User version exists, it is used instead of the SITE or BASE. Overrides can be partial in the sense that the override file contains only what is to be changed from the base file. In this way, specific customizations can be made.

Overrides
----------

In Hazard Services, there are various kinds of Overrides to files.
* Incremental Override: Some files consist of simple Python dictionaries or lists and are overridden by a process we call “incremental” override. Examples of these files are the Settings files (e.g. Hydrology_All.py) and HazardTypes.py. Although you will see examples of overriding files, a complete set of documentation for “incremental override” of Hazard Services configuration files can be found in the Incremental Override for Configuration Data document. 

* Class-based Override: Other files contain Python classes and their overrides are “class-based”. A “skeleton” class is defined in the override file and the user adds selected Python methods from the class to “override” or add to the original methods. Overriding of these files is similar to the GFE and is covered in that training.

* XML Override: Some configuration files (e.g. Alerts) are “xml” format and are overridden as other “xml” files in AWIPS 2.
Python Method Override: Some files consist of only Python methods e.g. Megawidget Side Effects. To override these files, you must copy the entire method into your override file.

There may be times when the more conventional non-incremental override behavior is desired even though the file is subject to incremental override.  This is very simple to achieve with a single extra entry placed at the very beginning of the override file content; the form of this entry depends on whether the file is a dictionary or list at the top level.  For a dictionary this extra entry is "_override_replace_" : True,  ; for a list it is "_override_replace_",  .  Then the content that follows can be a complete copy of the base, modified in whatever way is desired.

The Localization Perspective under the Hazard Services tab (or in directories under ...utility/common_static/base/hazardServices/) contains the baseline and localization files for Hazard Services. You will find the following tabs in alphabetical order. They are listed here in logical groupings:

* Configuration of Graphical User Interface
  * Startup Config (incremental override)
  * Alerts (xml override)
  * Settings (incremental override)
* Hazard Types and metadata
  * Hazard Types (incremental override)
  * TODO: Hazard Type Color Table ??
  * Hazard Categories (incremental override)
  * Hazard metadata (class-based override)
  * Megawidget Side Effects (python method override)
* Recommenders and Product Generation
  * Recommenders (class-based override)
  * Product Generator Table (incremental override)
  * Product Generators (class-based override)
  * Product Formats (class-based override)
  * Utilities (class-based override)

Megawidgets
-----------
Hazard Services supports a set of user-defined graphical user interface components, called Megawidgets which are used throughout Hazard Services customization. Examples will be seen throughout this document and complete documentation can be found in the Megawidget section.

Required Steps
------------

* StartUpConfig.py: Override StartUpConfig.py required fields as designated in the baseline file. 
* Site-specific geometries: Ingest shapefiles for Dam Inundation, Riverpoint Inundation, Burnscar areas. See detailed instructions in the next section.
