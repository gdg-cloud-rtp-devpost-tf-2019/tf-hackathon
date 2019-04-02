// This file is required for all USGS websites to employ.
// POCs: Tim Woods (twoods@usgs.gov); Scott Horvath (shorvath@usgs.gov)
// DO NOT MODIFY any code beneath this unless approval provided by all POCs above.
// ---------
// CHANGES:
// ---------
// Version 1.4.3 - 4/28/2016
// - Removed all unnecessary scripts no longer to be used on the new USGS platform or other USGS websites.
// Version 1.4.2 - 4/21/2016
// - Removed Foresee Survey due to upcoming transition to Drupal
// Version 1.4.1 - 2/18/2015
// - Removed Enhanced Linking to improve performance issues.
// Version 1.4 - 2/12/2015
// - The Federated Analytics code has been updated to the new UA version.
// - Added additional parameters for enabling Enhanced Linking, Demographics data, and allowing Optout features for users.
// - Modification to the standard ID tag to _fed_an_ua_tag from _fed_an_js_tag
// - Modification of Sub Agency parameter from "sub-agency" to "subagency"
// - Removed YouTube tracking parameter "yt" as it now defaults to "true".
// - If you're reading this change log, we applaud you.
// Version 1.3 - 2/5/2014
// - References new minified Federated Analytics file
// Version 1.2 - 1/30/2014
// - Include new Federated GA pUA implementation and reorder of attributes.
// - Removal of USGS specific analytics code.
// ---------
// Updated on 1/24/13 to include switching between http and https based on protocol

function include(file, flag)
{
  var script  = document.createElement('script');
  if (flag == 1) {
  script.id = '_fed_an_ua_tag';
  }
  script.type = 'text/javascript';
  script.src  = file;
  script.defer = true;
 
  document.getElementsByTagName('head').item(0).appendChild(script);
}

if ("https:" == document.location.protocol) {
    /* secure */
	// Version 1.1 - 3/4/2013
	include('https://dap.digitalgov.gov/Universal-Federated-Analytics-Min.js?agency=DOI&subagency=USGS&pua=UA-23479674-1&dclink=true',1);
	// include('https://www2.usgs.gov/scripts/analytics/usa-search.js',0);
} else {
    /* unsecure */
	// Version 1.1 - 3/4/2013
	include('https://dap.digitalgov.gov/Universal-Federated-Analytics-Min.js?agency=DOI&subagency=USGS&pua=UA-23479674-1&dclink=true',1);
	// include('https://www2.usgs.gov/scripts/analytics/usa-search.js',0);
} 

// JavaScript Document