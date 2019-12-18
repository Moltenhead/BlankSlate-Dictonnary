import React from "react";
import { Link } from "react-router-dom";

import pluralize from "pluralize";

class Index extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      instances: []
    };
    this.pageRegex = /(\?[\w_=&]*?page\[number\]=)([\d]+)(.)*?/;

    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
  }

  /* ======================= */
  /* ------ LIFECYCLE ------ */
  /* ======================= */
  componentDidMount() {
    const search = (this.props.location && this.props.location.search) || "?page[number]=1";
    const { displayingFields, modelTypes, pageRegex } = this;
    const finalDisplayingFields = displayingFields || [];
    
    const pageMatch = search.match(pageRegex);
    const page = parseInt(pageMatch[2]);
    const url = `/api/v1/${modelTypes}${search}`;
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ finalDisplayingFields, instances: response, pageIndex: page }))
      .catch(() => this.props.history.push("/"));
  }

  /* ======================= */
  /* ----- DEPENDENCIES ---- */
  /* ======================= */
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

  htmlPaginator()
  {
    const { pageIndex } = this.state;

    return(
      <>
        <div className="col-5 d-flex justify-content-end align-items-center">
          <div className="btn custom-button" onClick={this.previousPage}>
            {"<<"}
          </div>
        </div>
        <div className="col-2 d-flex justify-content-center align-items-center">
          Page: {pageIndex}
        </div>
        <div className="col-5 d-flex justify-content-start align-items-center">
          <div className="btn custom-button" onClick={this.nextPage}>
            {">>"}
          </div>
        </div>
      </>
    )
  }

  goToPage(i)
  {
    const { modelTypes } = this;
    const search = (this.props.location && this.props.location.search) || "?page[number]=1";
    const finalSearch = search.replace(this.pageRegex, `$1${i}$3`);
    const url = `/api/v1/${modelTypes}${finalSearch}`;
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ instances: response, pageIndex: i }))
      .catch(() => this.props.history.push("/"));
  }

  previousPage()
  {
    const pageIndex = (this.state && this.state.pageIndex) || 1;
    if (pageIndex < 2)
      return;
    
    this.goToPage(pageIndex - 1);
  }
  nextPage()
  {
    const pageIndex = (this.state && this.state.pageIndex) || 1;
    this.goToPage(pageIndex + 1);
  }

  updateInstances()
  {
    const { modelTypes, state: { pageIndex } } = this;
    const search = (this.props.location && this.props.location.search) || "?page[number]=1";
    const finalSearch = search.replace(this.pageRegex, `$1${pageIndex}$3`);
    const url = `/api/v1/${modelTypes}${finalSearch}`;
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ instances: response }))
      .catch(() => this.props.history.push("/"));
  }

  /* ======================= */
  /* -------- RENDER ------- */
  /* ======================= */
  defaultRender() {
    const { modelName, modelSingleType, modelTypes } = this;
    const { instances, pageIndex } = this.state;
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
    const noInstanceForPage = (
      <div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
        <h4>
          No {modelTypes} on page {pageIndex}
        </h4>
      </div>
    );

    return (
      <>
        <section className="jumbotron jumbotron-fluid text-center">
          <div className="container py-5">
            <h1 className="display-4">Existing {pluralize(modelName)}</h1>
            <p className="lead text-muted">
              List of existing {modelTypes}.
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
              {instances.length > 0 ? allInstances : pageIndex < 2 ? noInstance : noInstanceForPage}
            </div>
            <div className="row col-12">
              {this.htmlPaginator()}
            </div>
          </main>
        </div>
        <Link to="/" className="backwarder" />
      </>
    );
  }

  render() { return this.defaultRender(); }
}
export default Index;