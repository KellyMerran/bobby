initialize = ->
  mapOptions =
    center: new google.maps.LatLng(48.863, 2.368189)
    zoom: 12
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
  marker = new google.maps.Marker(
    position: new google.maps.LatLng(48.863, 2.368189)
    map: map
    animation: google.maps.Animation.DROP
    title: "Hello World!"
  )
  google.maps.event.addListener marker, "click", toggleBounce
toggleBounce = ->
  if marker.getAnimation()?
    marker.setAnimation null
  else
    marker.setAnimation google.maps.Animation.BOUNCE
google.maps.event.addDomListener window, "load", initialize