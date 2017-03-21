Define "possibleSites" and "visibleSites" 
=========================================

 Add: When would someone want to do this?
 
..note
  **common_static/site/LLL/HazardServices/startUpConfig/StartUpConfig.py**
  is the path to a site override of this file, which needs to contain the following::

StartUpConfig = {
    "possibleSites": ["LLL"],
    "visibleSites": ["LLL"]
    }

Without this patch, the most obvious symptom is that drawing a polygon and then choosing a hazard type in the Hazard Information Dialog results in the polygon completely disappearing. 
