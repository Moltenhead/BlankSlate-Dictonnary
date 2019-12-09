import React, { Component } from 'react-dom';
import { Link } from "react-router-dom"
import './index.scss';

class Home extends Component {
  render()
  {
    console.log('in Home')
    return (
      <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center App">
        <header className="jumbotron jumbotron-fluid bg-transparent App-header">
          <h1 className="display-4">Words</h1>
          <p className="lead">List of present Words within the application</p>
          <hr className="my-4"/>
          <Link
            to="/words"
            className="btn btn-lg custom-button"
            role="button"
          >
            View words
          </Link>
        </header>
      </div>
    );
  }
}

export default Home;
