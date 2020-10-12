import React, { Component } from "react";
import { Link } from "react-router-dom";

import pluralize from "pluralize";
import { capitalize } from "../utilities/string_utils";

export default class AlbumCardLink extends Component {
  constructor(props) {
    super(props);
    this.state = { elementsQuantity: 0 }
  }

  componentDidMount() {
    const { modelTypes } = this.props;
    const url = `/api/v1/${modelTypes}`;

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ elementsQuantity: response.length }))
      .catch(() => this.props.history.push("/"));
  }

  render()
  {
    const { name } = this.props
    const { elementsQuantity } = this.state
    return(
      <div className="col-md-4">
        <Link
          to={`/${name && pluralize(name)}`}
          className="btn btn-lg btn-outline-secondary card shadow-sm p-0"
          role="button"
        >
          <div className="card-header">
            <h2>{capitalize(pluralize(name))}</h2>
          </div>
          <div className="card-body">
            <div className="card-text">
              List of existing {name && pluralize(name)}
            </div>
            <div className="d-flex justify-content-end align-items-end">
              <small className="text-muted">
                {elementsQuantity} existing
              </small>
            </div>
          </div>
        </Link>
      </div>
    );
  }
}
