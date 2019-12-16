import React from "react";
import { Link } from "react-router-dom";

class Show extends React.Component {
  constructor(props)
  {
    super(props);
    this.state = { modelFields: [], instance: {} };

    this.deleteInstance = this.deleteInstance.bind(this);
  }

  setModelTypes(str)
  {
    const instance = (this.state && this.state.instance) || {};
    instance.modelTypes = str;
    this.setState({instance});
  }

  setModelFields(arr)
  {
    this.setState({modelFields: arr});
  }

  componentDidMount()
  {
    this._isMounted = true;
    const { modelTypes, modelFields } = this;
    const {
      match: {
        params: { id }
      }
    } = this.props;

    const url = `/api/v1/${modelTypes}/${id}`;
    this.setModelFields(modelFields);
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

  deleteInstance()
  {
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
    }).then(response => {
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

  produceField(options = {})
  {
    const { key, data } = options;
    const { name } = data;
    const fieldValue = (this.state && this.state.instance && this.state.instance[name]) || "empty";
    return (
      <div key={key} className="col-sm-12 col-lg-3">
        <h5 className="mb-2">{name}</h5>
        {fieldValue}
      </div>
    );
  }

  displayableFields()
  {
    const modelFields = this.state && this.state.modelFields;
    if (modelFields) {
      const formatedFieldsList = modelFields.map((fieldData, i) => this.produceField({key: i, data: fieldData}));
      return(
        <div className="container">
          {formatedFieldsList}
        </div>
      );
    } else {
      return(
        <div className="loading"></div>
      )
    }
  }

  defautlRender()
  {
    const { instance } = this.state;
    const { name, short_description, long_description, roman, phonology } = instance;

    if (this.state.toCollection === true) {
      return(<Redirect to='/' />);
    }

    return (
      <div className="">
        <div className="hero position-relative d-flex align-items-center justify-content-center">
          <img
            src={instance.image}
            alt={`${name} image`}
            className="img-fluid position-absolute"
          />
          <div className="overlay bg-dark position-absolute" />
          <h1 className="display-4 position-relative text-white">
            {name}
          </h1>
        </div>
        <div className="container py-5">
          <div className="row">
            {this.displayableFields()}
          </div>
          <Link to="/runes" className="btn btn-link">
            Back to runes
          </Link>
        </div>
      </div>
    );
  }

  render() { return this.defautlRender(); }
}

export default Show;