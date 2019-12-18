import React from "react";
import { Link } from "react-router-dom";

import pluralize from "pluralize";

class Index extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      instances: []
    };
  }

  componentDidMount() {
    const search = (this.props.location && this.props.location.search) || "";
    const { displayingFields, modelTypes } = this;
    const finalDisplayingFields = displayingFields || [];
    const url = `/api/v1/${modelTypes}${search}`;
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ finalDisplayingFields, instances: response }))
      .catch(() => this.props.history.push("/"));
  }

  // displayableFields()
  // {
  //   const displayingFields = this.state && this.state.displayingFields;
  //   if (displayingFields) {
  //     const formatedFieldsList = displayingFields.map((fieldData, i) => this.produceField({key: i, data: fieldData}));
  //     return(
  //       <>
  //         {formatedFieldsList}
  //       </>
  //     );
  //   } else {
  //     return(
  //       <div className="loading"></div>
  //     )
  //   }
  // }

  htmlPaginator() {
    const { modelTypes } = this;
    const search = (this.props.location && this.props.location.search) || "?page[number]=1";
    const pageRegex = /(\?[\w_=&]*?page\[number\]=)([\d]+)(.)*?/;
    const pageMatch = search.match(pageRegex);
    const page = parseInt(pageMatch[2]);
    const previousPage = page - 1;
    const nextPage = page + 1;
    const previousPageSearch = search.replace(pageRegex, `$1${previousPage}$3`);
    const nextPageSearch = search.replace(pageRegex, `$1${nextPage}$3`);

    return(
      <>
        <div className="col-5 d-flex justify-content-end align-content-center">
          <Link to={`/${modelTypes}${previousPageSearch}`} className="btn custom-button">
            {"<<"}
          </Link>
        </div>
        <div className="col-2 d-flex justify-content-center align-content-center">
          Page: {page}
        </div>
        <div className="col-5 d-flex justify-content-start align-content-center">
          <Link to={`/${modelTypes}${nextPageSearch}`} className="btn custom-button">
            {">>"}
          </Link>
        </div>
      </>
    )
  }

  defaultRender() {
    const { modelName, modelSingleType, modelTypes } = this;
    const { instances } = this.state;
    const allInstances = instances.map((instance, index) => (
      <div key={index} className="col-md-6 col-lg-4">
        <div className="card mb-4">
          <img
            src={instance.image}
            className="card-img-top"
            alt={`${instance.name} image`}
          />
          <div className="card-body">
            <h5 className="card-title">{instance.name}</h5>
            <Link to={`/${modelSingleType}/${instance.id}`} className="btn custom-button">
              View {modelName}
            </Link>
          </div>
        </div>
      </div>
    ));
    const noInstance = (
      <div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
        <h4>
          No {modelTypes} yet. Why not <Link to={`/${modelSingleType}`}>create one</Link>
        </h4>
      </div>
    );

    return (
      <>
        <section className="jumbotron jumbotron-fluid text-center">
          <div className="container py-5">
            <h1 className="display-4">Existing {pluralize(modelName)}</h1>
            <p className="lead text-muted">
              View, edit and delete existing {modelTypes}.
            </p>
          </div>
        </section>
        <div className="py-5">
          <main className="container">
            <div className="text-right mb-3">
              <Link to={`/${modelSingleType}`} className="btn custom-button">
                Create New {modelName}
              </Link>
            </div>
            <div className="row">
              {instances.length > 0 ? allInstances : noInstance}
            </div>
            <div className="row col-12">
              {this.htmlPaginator()}
            </div>
            <Link to="/" className="btn btn-link">
              Home
            </Link>
          </main>
        </div>
      </>
    );
  }

  render() { return this.defaultRender(); }
}
export default Index;