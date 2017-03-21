Getting Started
===============

.. toctree::
   :caption: Subsections
   :numbered:
   
.. must be a space before actual sections   
   define_sites

.. note::
   This guide is for Focal Points who are already familiar with the material in the Hazard Services User’s Guide. It covers basic,   required configuration as well as advanced optional customizations.
   
For a standard production installation of Cave including the Hazard Services software, the Hazard Services application really won’t 
do much that is very useful. In order for Hazard Services to function correctly, there is a bare minimum amount of manual site 
configuration needed.

This section will focus on what is absolutely needed to get Hazard Services to the point where it will issue SOMETHING. We will also 
document some customizations that prevent certain incorrect behaviors from manifesting. Later sections will discuss how to customize 
Hazard Services such that the look and feel of the products issued conform to what is specifically desired for your WFO.

Here we will focus on which content will need to change in which files. We will use LLL to stand for the primary WFO id of your site. 
Where file paths are mentioned that start with common_static/ or cave_static/, it is implied that these are subdirectories of 
/awips2/edex/data/utility/. For changes to configuration files in EDEX, it will be left to the reader to decide whether to implement 
the changes in the Localization perspective or by changing the files in the file system and then bouncing EDEX. Changing files in the 
Localization perspective is always preferred, but every once in a while problems will manifest with how userRoles work, and there will 
be no way around it other than to change a file in the file system and then restart EDEX.  On an lx, one can inspect the contents of 
these same files under ~/caveData/common/ (for common_static/) or under ~/caveData/etc/ (for cave_static/), **but under no circumstances 
should one directly modify files under ~/caveData/common/ or ~/caveData/etc/.** Where these instructions request adding or changing a file 
that for some reason your site has already added or changed, then the changes will need to be merged. Some of the changes mentioned here
may need to be updated later in order to implement a robust rather than bare bones functionality.
