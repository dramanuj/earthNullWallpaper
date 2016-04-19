var url = 'http://earth.nullschool.net/#current/wind/surface/level/overlay=temp/orthographic=-90.09,32.37,480';
var page = require('webpage').create();
page.viewportSize = {
  width: 1920,
  height: 1080
};
page.open(url, function() {
 setTimeout(function() {
  page.render('earthNullLatest.png');
  phantom.exit();
 },5000);
});


//ALternate URL
//'http://earth.nullschool.net/#current/wind/surface/level/overlay=off/orthographic=-97.10,43.90,480'