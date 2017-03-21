Synchronize hazard inclusion percentages
========================================

This impacts interoperability, which is the ability for hazards issued in warnGen to also be handled in Hazard Services and vice versa. If all the inclusion percentages for warnGen are the base defaults, then there is no need to take this step. Run the simple shell script that follows on a px or dx; if it produces no output, then in all likelihood you have no overrides for include percentages that impact IOC products for Hazard Services:

.. code-block:: bash

           #!/bin/csh -f
           set LLL = `cat /awips2/edex/bin/setup.env | grep AW_SITE_IDENTIFIER | \
                      head -n 1 | cut '-d=' -f2 | tr -d ' '`
           set cmnRoot = /awips2/edex/data/utility/common_static
           if ( -e $cmnRoot/site/$LLL/warngen/geospatialConfig_COUNTY.xml ) then
               diff $cmnRoot/site/$LLL/warngen/geospatialConfig_COUNTY.xml \
                    $cmnRoot/base/warngen/geospatialConfig_COUNTY.xml | \
                    grep inclusionPercent
           endif
           if ( -e $cmnRoot/site/$LLL/warngen/geospatialConfig_ZONE.xml ) then
               diff $cmnRoot/site/$LLL/warngen/geospatialConfig_ZONE.xml \
                    $cmnRoot/base/warngen/geospatialConfig_ZONE.xml | \
                    grep inclusionPercent
           endif
           set templateOverrides = \
              `( cd $cmnRoot/site/$LLL/warngen ; find . -name '*xml' ) | \
               cut -c3-99 | grep -i flood | grep -v geospatialConfig`
           foreach one ( $templateOverrides )
               grep inclusionPercent $cmnRoot/site/$LLL/warngen/$one
           end
           #

If there are overrides of inclusion percentages for warnGen, one needs to override the inclusion percentages for Hazard Services to match them. This is done by producing an override file for HazardTypes.py. The paths, respectively, to the base and site override version of this file are:

.. code-block:: python

    common_static/base/HazardServices/hazardTypes/HazardTypes.py
    common_static/site/LLL/HazardServices/hazardTypes/HazardTypes.py

This file is subject to incremental override, and so the site override file need only contain the new inclusion percentages for any impacted hazard types. Suppose for example that the only change needed was to adjust the inclusion percentage for Convective FFWs to 15 percent. Then the entire contents of the site override of HazardTypes.py would be:

.. code-block:: python

    HazardTypes = {
       'FF.W.Convective' : {'inclusionFraction': 15}
    }
           
Changes in geospatialConfig_COUNTY.xml would potentially impact every hazard type where you have 'ugcType': 'county', and changes in geospatialConfig_ZONE.xml could potentially affect all those where you have 'ugcType': 'zone'. If the inclusion percentage is overridden in an individual product template, then one needs to identify the associated hazard in HazardTypes.py and provide the appropriate override value.
          
