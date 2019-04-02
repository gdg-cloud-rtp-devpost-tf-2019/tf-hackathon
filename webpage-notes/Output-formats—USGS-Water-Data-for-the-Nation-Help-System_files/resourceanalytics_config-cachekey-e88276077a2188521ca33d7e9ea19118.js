
/* - ++resource++analytics_config.js - */
// https://help.waterdata.usgs.gov/portal_javascripts/++resource++analytics_config.js?original=1
(function($){getAnalyticsContainerWidth=function(container){var container_width;if($(container).parents('dl.collapsedBlockCollapsible').length>0){var dl_parent=$(container).parents('dl.collapsedBlockCollapsible').eq(0);dl_parent.removeClass('collapsedBlockCollapsible').addClass('expandedBlockCollapsible');container_width=$(container).innerWidth();dl_parent.removeClass('expandedBlockCollapsible').addClass('collapsedBlockCollapsible')} else{container_width=$(container).innerWidth()}
return container_width}}(jQuery));
