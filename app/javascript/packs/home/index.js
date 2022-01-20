let map;
let marker = [];
let infoWindow = [];
let defaultlat = 35.703732;
let defaultlng = 139.579514;
let num = 10;
window.initMap = function(){
  map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: defaultlat,lng: defaultlng},
      zoom: num
  });
  for (var i = 0; i < gon.events.length; i++) {
    let Id = gon.events[i].id
    let spotId = gon.events[i].spot_id;
    let titleId = gon.events[i].title_id;
    let markerLat = gon.spots[spotId -1].lat;
    let markerLng = gon.spots[spotId -1].lng;
    marker[i] = new google.maps.Marker({
      position: {lat: markerLat, lng: markerLng},
      map: map
    })
    let name = gon.titles[titleId -1].name;
    if (gon.events[i].start_at != null) {
      var startDate  = gon.events[i].start_at.replace(/(\d{4})-0?(\d{1,2})-0?(\d{1,2})/, '$1年$2月$3日');
    } else {
      var startDate = ""
    }
    if (gon.events[i].finish_at != null) {
      var finishDate  = gon.events[i].finish_at.replace(/(\d{4})-0?(\d{1,2})-0?(\d{1,2})/, '$1年$2月$3日');
    } else {
      var finishDate = "開催中"
    }
    infoWindow[i] = new google.maps.InfoWindow({
        content: `<div class="infowindow">
                    <h2>${name}</h2>
                    <div class="info-list">
                      <div class="info-date">
                        <p>${startDate} ~ ${finishDate}</p>
                      </div>
                      <div class="info-link">
                        <a href="/events/${Id}">詳細</a>
                      </div>
                    <div>
                  </div>`
		});
    markerEvent(i);
  }
  function markerEvent(i) {
    marker[i].addListener('click', function() {
        infoWindow[i].open(map, marker[i]);
    });
  }
}

window.onButtonClick = function geocode() {
  let geocoder = new google.maps.Geocoder();
  let prefecture = document.getElementById('prefecture').value;
  geocoder.geocode({'address': prefecture}, function(results) {
    map.setCenter(new google.maps.LatLng(results[0].geometry.location));
    map.setZoom(8.5);
  })
}
