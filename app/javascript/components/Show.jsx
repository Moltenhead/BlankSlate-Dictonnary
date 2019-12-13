import React from "react";
import { Link } from "react-router-dom";

class Show extends React.Component {
  constructor(props) {
    super(props);
    this.modelTypes = "";
    this.modelFields = [];
    console.log('in');
    const { modelFields } = this;

    this.state = modelFields.reduce(
      (state, modelField) => ({
        ...state,
        ...instance,
        [modelField.name]: modelField.default
      }),
      {}
    );

    this.deleteInstance = this.deleteInstance.bind(this);
  }

  componentDidMount() {
    this._isMounted = true;
    const { modelTypes, modelFields } = this;
    const {
      match: {
        params: { id }
      }
    } = this.props;

    const url = `/api/v1/${modelTypes}/${id}`;
    console.log("url", url);
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => {
        if(!this._isMounted) {
          this.setState({ instance: response });
        }
      }).catch(() => this.props.history.push(`/${modelTypes}`));
  }

  componentWillUnmount() { this._isMounted = false; }

  deleteInstance() {
    const {
      modelTypes,
      match: {
        params: { id }
      }
    } = this.props;
    const url = `/api/v1/${modelTypes}/${id}`;
    const token = document.querySelector('meta[name="csrf-token"]').content;

    fetch(url, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json"
      }
    })
      .then(response => {
        const r = response;
        if (response.status === 204) {
          return response;
        }
        throw new Error("Network response was not ok.");
      })
      .then(() => {
        this.props.history.push(`/${modelTypes}`);
        this.setState({toCollection: true})
      })
      .catch(error => console.log(error.message));
  }

  produceFormField(fieldData)
  {
    const { name, type } = fieldData;
    return (
      <div className="col-sm-12 col-lg-3">
        <h5 className="mb-2">{name}</h5>
        {this.state.instance[name]}
      </div>
    );
  }
}

export default Show;