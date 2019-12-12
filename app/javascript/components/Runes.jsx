import React from "react";
import { Link } from "react-router-dom";

class Runes extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      runes: []
    };
  }

  componentDidMount() {
    const url = "/api/v1/runes";
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ runes: response }))
      .catch(() => this.props.history.push("/"));
  }

  render() {
    const { runes } = this.state;
    const allRunes = runes.map((rune, index) => (
      <div key={index} className="col-md-6 col-lg-4">
        <div className="card mb-4">
          <img
            src={rune.image}
            className="card-img-top"
            alt={`${rune.name} image`}
          />
          <div className="card-body">
            <h5 className="card-title">{rune.name}</h5>
            <Link to={`/rune/${rune.id}`} className="btn custom-button">
              View Rune
            </Link>
          </div>
        </div>
      </div>
    ));
    const noRune = (
      <div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
        <h4>
          No runes yet. Why not <Link to="/rune">create one</Link>
        </h4>
      </div>
    );

    return (
      <>
        <section className="jumbotron jumbotron-fluid text-center">
          <div className="container py-5">
            <h1 className="display-4">Existing Runes</h1>
            <p className="lead text-muted">
              View, edit and delete existing runes.
            </p>
          </div>
        </section>
        <div className="py-5">
          <main className="container">
            <div className="text-right mb-3">
              <Link to="/rune" className="btn custom-button">
                Create New Rune
              </Link>
            </div>
            <div className="row">
              {runes.length > 0 ? allRunes : noRune}
            </div>
            <Link to="/" className="btn btn-link">
              Home
            </Link>
          </main>
        </div>
      </>
    );
  }
}
export default Runes;