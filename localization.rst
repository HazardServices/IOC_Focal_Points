Localization
============

Hazard Services needs to be localized to your site. This document covers Hazard Services-specific steps needed and assumes that more general localization steps such as porting over a Hydro Database, setting up FFMP, and localizing EDEX have been taken care of.

The Localization Perspective in CAVE provides access to the user-configurable files for various applications. There is a directory for Hazard Services which contains configuration files, recommenders, and product generators. Each file has a BASE version which can be viewed in the Localization editor by clicking on it. A copy of this file can be made to produce a SITE, Desk, Workstation, or User version. If these versions exist, they are used instead of the BASE version in a hierarchical manner. For example, if a SITE version exists, it is used instead of the BASE. If a User version exists, it is used instead of the SITE or BASE. Overrides can be partial in the sense that the override file contains only what is to be changed from the base file. In this way, specific customizations can be made.

Overrides
----------

In Hazard Services, there are various kinds of Overrides to files:

* **Incremental Override:** Some files consist of simple Python dictionaries or lists and are overridden by a process we call “incremental” override. Examples of these files are the Settings files (e.g. Hydrology_All.py) and HazardTypes.py. Although you will see examples of overriding files, a complete set of documentation for “incremental override” of Hazard Services configuration files can be found in the Incremental Override for Configuration Data document. 

* **Class-based Override:** Other files contain Python classes and their overrides are “class-based”. A “skeleton” class is defined in the override file and the user adds selected Python methods from the class to “override” or add to the original methods. Overriding of these files is similar to the GFE and is covered in that training.

* **XML Override:** Some configuration files (e.g. Alerts) are “xml” format and are overridden as other “xml” files in AWIPS 2.

* **Python Method Override:** Some files consist of only Python methods e.g. Megawidget Side Effects. To override these files, you must copy the entire method into your override file.

There may be times when the more conventional non-incremental override behavior is desired even though the file is subject to incremental override.  This is very simple to achieve with a single extra entry placed at the very beginning of the override file content; the form of this entry depends on whether the file is a dictionary or list at the top level.  For a dictionary this extra entry is **"_override_replace_" : True**,  ; for a list it is **"_override_replace_"**,  .  Then the content that follows can be a complete copy of the base, modified in whatever way is desired.

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
Hazard Services supports a set of user-defined graphical user interface components, called Megawidgets which are used throughout Hazard Services customization. Examples will be seen throughout this document and complete documentation can be found in the `Megawidget Section  <http://hazardservices.readthedocs.io/en/latest/megawidgets.html>`_.

Required Steps
------------

#. **StartUpConfig.py:** Override StartUpConfig.py required fields as designated in the baseline file. 
#. **Site-specific geometries:** Ingest shapefiles for Dam Inundation, Riverpoint Inundation, Burnscar areas. See detailed instructions in the next section.

Optional Steps
---------------

* **Startup Configuration:** Override non-required items in StartUpConfig.py which has various options that you may want to change.
* **Settings:** Create Site-Specific Settings. It may be useful for your site to have site-specific Settings to aid in the Forecast Process. For example, you may want a Setting that views only Warnings and Advisories, filtering out Watches. Or you may want a Setting to view only issued and ending hazards.
* **General Configuration:** Baseline versions of the Recommenders, Product Generators, Hazard MetaData (appearing in the Hazard Information Dialog), Hazard Types and Categories will work for your site “out-of-the-box.” However, as you work with the system, you will want to appropriately localize. This document will give you the information you need to do so.

.. note::

   Configuration of Hazard Services involves Python configuration files. If you are not already familiar with Python and Class-based programming there are various tutorials that will give you the background needed:
   
      * `Codeacademy  <https://www.codecademy.com/>`_  --Gives problems and checks them for you.
      * `Google tutorial  <https://developers.google.com/edu/python/?hl=en>`_  --Has videos which is also very helpful.
      * `Official Python Website  <https://docs.python.org/2/tutorial/>`_ 
      * `Learn Python  <http://www.learnpython.org/>`_ 
      * `Tutorials Point <http://www.tutorialspoint.com/python/>`_


StartUp Configuration
=====================

The StartUpConfig.py file contains various items listed below. More detailed information can be found in the documentation within that file.

*  Dissemination order for products
*  Recommender to use when creating hazards from gage points
*  Console Settings and Time Line navigation options
*  Hazard Information Dialog layout and tab options
*  Specific default Alerts 

Hazard Configuration
=====================
The baseline VTEC hazard types, categories, and metadata are set up in the files discussed in this section. All of these files can be overridden to adjust modifiable attributes of existing hazards or to add new hazard types.

Hazard Types
============

The Hazard Types are stored in a localization file (HazardTypes.py) identifying all the hazards and basic information about each. (This is similar to the VTECTable in legacy operations.) It’s stored as a Python dictionary of dictionaries:

.. code-block:: python

   dict = {phen:{TO.W:field}, sig{FF.W.Convective:field}, sub-type{FF.W.NonConvective:field}}
   
.. note:: 

   Sub-type is optional. An example NonConvective Field is a dam failure. Please see the HazardTypes.py file for descriptions of the fields
       * headline -- 'FLASH FLOOD WARNING'
 
.. note:: The hazard Types file contains almost 100 hazard types and is quite large. Using incremental override to add a new hazard type, is easy. Just modify the SITE level file like the example below.

.. code-block:: python

  HazardTypes = {
    'HY.S' : {'phen': 'HY',
              'sig': 'S',
              'headline': 'HYDROLOGIC STATEMENT',
     }
  }
  
Also, since Hazard Services will eventually implement a National Hazard Database, there is the possibility that with user-defined hazard types there could be duplicate hazard types with different meanings which could lead to confusion for Forecasters viewing hazard information from other sites. This problem needs to be addressed, perhaps as a National registry for hazard types.  
  

