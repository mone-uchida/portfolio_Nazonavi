import React from 'react'
import question from '../../assets/images/icon_question.jpg';
import bird from '../../assets/images/icon_bird.jpg';
import crab from '../../assets/images/icon_crab.jpg';
import fish from '../../assets/images/icon_fish.jpg';
import hedgehog from '../../assets/images/icon_hedgehog.jpg';
import manta from '../../assets/images/icon_manta.jpg';
import octopus from '../../assets/images/icon_octopus.jpg';
import penguin from '../../assets/images/icon_penguin.jpg';

class IconSelect extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      OpenSelect: false,
      Icon: this.props.user.icon,
      Iconpath: '',
    };
  }

  handleSelectOpen(){
    this.setState({OpenSelect: true});
  }

  handleSelectClose(){
    this.setState({OpenSelect: false});
  }

  handleChangeIcon(icon){
    this.setState({
      Icon: icon.name,
      Iconpath: icon.pct,
    });
  }

  render() {
    const icons = [
        { name: "icon_question.jpg", pct: question },
        { name: "icon_bird.jpg", pct: bird },
        { name: "icon_crab.jpg", pct: crab },
        { name: "icon_fish.jpg", pct: fish },
        { name: "icon_hedgehog.jpg", pct: hedgehog },
        { name: "icon_manta.jpg", pct: manta },
        { name: "icon_octopus.jpg", pct: octopus },
        { name: "icon_penguin.jpg", pct: penguin },
      ];
    
    let button;
    let select;
    if (this.state.OpenSelect) {
        select = (
          <div className="icon-select">
            <div className="icon-images">
              {icons.map((icon,i) =>
                <img
                  key={ icon }
                  id={`icon-${i}`}
                  className="icons"
                  src={ icon.pct }
                  value={ icon.name }
                  onClick={() => this.handleChangeIcon(icon)}
                />
              )}
            </div>
            <div className="select-image">選択中のアイコン
              <img 
                src={ this.state.Iconpath }
              />
            </div>
          </div>
        );
    } else {
      button = <button id="select-button" onClick={() => this.handleSelectOpen()}>アイコンを選択する</button>
    }
    return (
      <div className="icon-wrapper">
        <label>アイコン</label>
          <input id="icon" name="icon" type="text" value={ this.state.Icon }　readOnly={true} hidden />
          { button }
          { select }
      </div>
    )
  }
}
  
export default IconSelect
