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
