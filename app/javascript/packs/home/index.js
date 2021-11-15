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

window.onButtonClick = function() {
    let area = document.getElementById("area").value;
    switch (area) {
      case "Hokkaido":
        lat = 43.679252;
        lng = 142.671353;
        num = 7.2;
        break;
      case "Tohoku":
        lat = 39.247216;
        lng = 140.893187;
        num = 7.3;
        break;
      case "Kanto":
        lat = 35.926093;
        lng = 139.295290;
        num = 8.7;
        break;
      case "Chubu":
        lat = 35.945237;
        lng = 137.881428;
        num = 8.1;
        break;
      case "Kinki":
        lat = 34.570542;
        lng = 135.729580;
        num = 8.3;
        break;
      case "Shikoku":
        lat = 33.492037;
        lng = 133.472084;
        num = 8.7;
        break;
      case "Chugoku":
        lat = 34.735482;
        lng = 132.767810;
        num = 8.6;
        break;
      case "Kyushu":
        lat = 32.257072;
        lng = 130.716358;
        num = 7.7;
        break;
      case "Okinawa":
        lat = 26.487623;
        lng = 127.932426;
        num = 9;
        break;
    }
    map.setCenter(new google.maps.LatLng(lat,lng));
    map.setZoom(num);
  }
  