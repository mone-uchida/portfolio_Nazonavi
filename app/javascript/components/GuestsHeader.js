import React from 'react'

class GuestsHeader extends React.Component {
  render() {
    return (
      <div>
        <h1><a href='/home'>謎解き検索</a></h1>
        <div className="menu">
          <a href='/login'>ログイン</a>
          <a href='/users/new'>新規登録</a>
        </div>
      </div>
    );
  }
}
  
export default GuestsHeader
