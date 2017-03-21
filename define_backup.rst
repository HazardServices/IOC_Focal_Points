Define backup sites if needed
=============================

This step is only necessary if there is a desire to interoperate with service backup. Of course, any site using Hazard Services to fulfill operational responsibilities will no doubt need to take this step. To do this, create a file at the path common_static/site/LLL/HazardServices/settings/backupSites.xml with the following contents::

<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<backupSites>
        <sites>BBX</sites>
        <sites>BBY</sites>
        <sites>BBZ</sites>
</backupSites>

In this idealized example, BBX, BBY, and BBZ are not literal, but rather represent the site id’s of the neighboring sites you want service backup functionality for. In order for Hazard Services to properly function for these backup sites, each backup site will need its own site override of StartUpConfig.py defining **"possibleSites"** and **"visibleSites"** (see Section 1).
Furthermore, after entering service backup it is desirable to be able to switch back to your primary site. To enable this, a site override of backupSites.xml is needed for each of your backup site ids containing the following::

<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<backupSites>
        <sites>LLL</sites>
</backupSites>


