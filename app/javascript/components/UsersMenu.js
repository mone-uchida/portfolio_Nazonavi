import React from 'react'

class UsersMenu extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      OpenMenu: false,
    };
  }

  handleMenuOpen(){
    this.setState({OpenMenu: true});
  }

  handleMenuClose(){
    this.setState({OpenMenu: false});
  }

  render() {
    let button;
    if (this.state.OpenMenu) {
      button = <a className= "button" onClick={() => this.handleMenuClose()}><i className="fas fa-bars"></i></a>;
    } else {
      button = <a className= "button" onClick={() => this.handleMenuOpen()}><i className="fas fa-bars"></i></a>;
    }
    let menu;
    if (this.state.OpenMenu) {
      menu = (
        <ul>
          <li><a href={'/users/' + this.props.user.id + '/like'}>行きたい！イベント</a></li>
          <li><a href={'/users/' + this.props.user.id + '/record'}>謎解きログ</a></li>
          <li><a href={'/users/' + this.props.user.id + '/edit'}>設定</a></li>
        </ul>
      );
    }
    return (
      <div>
        <p className="user_name">{ this.props.user.name }</p>
        <div className="icon">
        </div>
        <div className="menu">
          { button }
          { menu }
        </div>
      </div>
    );
  }
}
  
export default UsersMenu
