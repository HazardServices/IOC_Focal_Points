Define "possibleSites" and "visibleSites" (Required)
====================================================

.. warning::
    Without this patch, drawing a polygon and then choosing a hazard type in the Hazard Information Dialog **MAY** result in the polygon completely disappearing. 
 
**Action:** Modify *common_static/site/LLL/HazardServices/startUpConfig/StartUpConfig.py* to contain the following:

.. code-block:: python

    StartUpConfig = {
      "possibleSites": ["LLL"],
      "visibleSites": ["LLL"]
    }


