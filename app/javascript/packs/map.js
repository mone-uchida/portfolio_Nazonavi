const script = document.createElement('script');
script.src = `https://maps.googleapis.com/maps/api/js?key=${process.env.GOOGLE_API_KEY}&callback=initMap`;
script.async = true;

document.head.appendChild(script);

var map
var LatLng
var num
window.initMap = function() {
  LatLng = {lat: 35.926093, lng: 139.295290};
  num = 8.7,
  map = new google.maps.Map(document.getElementById('map'), {
      zoom: num,
      center: LatLng
  });
};

window.onButtonClick = function() {
  const area = document.getElementById("area").value;
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
  map.panTo(new google.maps.LatLng(lat,lng));
  map.setZoom(num);
}
