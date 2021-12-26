let map;
let marker;
let num = 15;
let spot = gon.spot;
let Lat = spot.lat;
let Lng = spot.lng;
window.initMap = function(){
  map = new google.maps.Map(document.getElementById('spot-map'), {
      center: {lat: Lat,lng: Lng},
      zoom: num
  }); 
  marker = new google.maps.Marker({
    position: {lat: Lat, lng: Lng},
    map: map
  })
}
