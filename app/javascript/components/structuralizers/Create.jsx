import React from "react";
import { Link } from "react-router-dom";

import { capitalize } from "../../utilities/string_utils";

class Create extends React.Component {
  constructor(props)
  {
    super(props);

    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
    this.stripHtmlEntities = this.stripHtmlEntities.bind(this);
  }

  stripHtmlEntities(str)
  {
    return String(str)
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;");
  }

  onChange(event)
  {
    this.setState({ [event.target.name]: event.target.value });
  }

  onSubmit(event)
  {
    event.preventDefault();
    const { mutableFields, modelSingleType, modelTypes } = this; 
    const url = `/api/v1/${modelTypes}`;

    if (mutableFields.some(fieldData => fieldData.required === true && !this.state[fieldData.name] && this.state[fieldData.name].length == 0))
      return;

    const body = {
      data: {
        attributes: {}
      }
    };
    mutableFields.forEach(fieldData => body.data.attributes[fieldData.name] = this.state[fieldData.name]);

    const token = document.querySelector('meta[name="csrf-token"]').content;
    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json"
      },
      body: JSON.stringify(body)
    })
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.props.history.push(`/${modelSingleType}/${response.id}`))
      .catch(error => console.error(error.message));
  }

  // RENDERING DEPENDENCIES
  produceField(options = {})
  {
    const { modelName } = this;
    const { key, data } = options;
    const { name } = data;
    const required = data.required || false;
    return (
      <div key={key} className="form-group">
        <label htmlFor="instanceName">{modelName} {name}</label>
        <input
          type="text"
          name={name}
          id={`instance${capitalize(name)}`}
          className="form-control"
          required={required}
          onChange={this.onChange}
        />
      </div>
    );
  }

  formatedMutableFields()
  {
    const { mutableFields } = this;
    if (mutableFields) {
      const formatedFieldsList = mutableFields.map((fieldData, i) => this.produceField({key: i, data: fieldData}));
      return(
        <>
          {formatedFieldsList}
        </>
      );
    } else {
      return(
        <div className="loading"></div>
      )
    }
  }

  defaultRender()
  {
    const { modelName, modelTypes } = this;
    return (
      <div className="container mt-5">
        <div className="row">
          <div className="col-sm-12 col-lg-6 offset-lg-3">
            <h1 className="font-weight-normal mb-5">
              Add a new {modelName}.
            </h1>
            <form onSubmit={this.onSubmit}>
              {this.formatedMutableFields()}
              <button type="submit" className="btn custom-button mt-3">
                Create {modelName}
              </button>
              <Link to={`/${modelTypes}`} className="btn btn-link mt-3">
                Back to {modelTypes}
              </Link>
            </form>
          </div>
        </div>
      </div>
    );
  }

  render() { return this.defaultRender(); }
}

export default Create;
