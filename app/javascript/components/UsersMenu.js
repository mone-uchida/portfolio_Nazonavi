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
      button = <a className= "button" onClick={() => this.handleMenuClose()}><i className="fas fa-bars fa-lg"></i></a>;
    } else {
      button = <a className= "button" onClick={() => this.handleMenuOpen()}><i className="fas fa-bars fa-lg"></i></a>;
    }
    let menu;
    if (this.state.OpenMenu) {
      menu = (
        <ul class="menu-item">
          <li><a href={'/users/' + this.props.user.id + '/favorites'}>お気に入り</a></li>
          <li><a href={'/users/' + this.props.user.id + '/post'}>投稿一覧</a></li>
          <li><a href={'/users/' + this.props.user.id + '/edit'}>設定</a></li>
        </ul>
      );
    }
    return (
      <div className="menu">
        { button }
        { menu }
      </div>
    );
  }
}
  
export default UsersMenu
