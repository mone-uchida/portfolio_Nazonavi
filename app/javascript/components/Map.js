import React from "react";
import AreaSearch from './AreaSearch';

class Map extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      mapIsReady: false,
      lat: 35.926093,
      lng: 139.295290,
      num: 8.7,
    };
  }

  componentDidMount() {
    const ApiKey = process.env.GOOGLE_API_KEY;
    const script = document.createElement('script');
    script.src = `https://maps.googleapis.com/maps/api/js?key=${ApiKey}`;
    script.async = true;
    script.defer = true;
    script.addEventListener('load', () => {
      this.setState({ mapIsReady: true });
    });

    document.body.appendChild(script);
  }

  componentDidUpdate() {
    if (this.state.mapIsReady) {
      this.map = new window.google.maps.Map(document.getElementById('map'), {
        center: {lat: this.state.lat, lng: this.state.lng},
        zoom: this.state.num,
        mapTypeId: 'roadmap',
      });
      // You also can add markers on the map below
    }
  }

  onButtonClick() {
    const area = document.getElementById("area").value;
    switch (area) {
      case "Hokkaido":
        this.setState({
          lat: 43.679252,
          lng: 142.671353,
          num: 7.2,
        });
        break;
      case "Tohoku":
        this.setState({
          lat: 39.247216,
          lng: 140.893187,
          num: 7.3,
        });
        break;
      case "Kanto":
        this.setState({
          lat: 35.926093,
          lng: 139.295290,
          num: 8.7,
        });
        break;
      case "Chubu":
        this.setState({
          lat: 35.945237,
          lng: 137.881428,
          num: 8.1,
        });
        break;
      case "Kinki":
        this.setState({
          lat: 34.570542,
          lng: 135.729580,
          num: 8.3,
        });
        break;
      case "Shikoku":
        this.setState({
          lat: 33.492037,
          lng: 133.472084,
          num: 8.7,
        });
        break;
      case "Chugoku":
        this.setState({
          lat: 34.735482,
          lng: 132.767810,
          num: 8.6,
        });
        break;
      case "Kyushu":
        this.setState({
          lat: 32.257072,
          lng: 130.716358,
          num: 7.7,
        });
        break;
      case "Okinawa":
        this.setState({
          lat: 26.487623,
          lng: 127.932426,
          num: 9,
        });
        break;
    }
    this.map.panTo(new google.maps.LatLng(this.state.lat,this.state.lng));
    this.map.setZoom(this.state.num);
  }
  render () {
    return (
      <div>
        <form>表示エリアを選択
          <select id="area">
            <option value="Hokkaido">北海道</option>
            <option value="Tohoku">東北</option>
            <option value="Kanto">関東</option>
            <option value="Chubu">中部</option>
            <option value="Kinki">近畿</option>
            <option value="Shikoku">四国</option>
            <option value="Chugoku">中国</option>
            <option value="Kyushu">九州</option>
            <option value="Okinawa">沖縄</option>
          </select>
          <input type="button" value="検索" onClick={() => {this.onButtonClick()}} />
        </form>
        <div id="map"></div>
      </div>
    );
  }
}

export default Map
