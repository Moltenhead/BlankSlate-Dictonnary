import React from "react";
import { Link } from "react-router-dom";

class Rune extends React.Component {
  constructor(props) {
    super(props);
    this.state = { rune: { ingredients: "" } };

    this.deleteRune = this.deleteRune.bind(this);
  }

  componentDidMount() {
    this._isMounted = true;
    const {
      match: {
        params: { id }
      }
    } = this.props;

    const url = `/api/v1/runes/${id}`;

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => { if(!this._isMounted) { this.setState({ rune: response }) } })
      .catch(() => this.props.history.push("/runes"));
  }

  componentWillUnmount() { this._isMounted = false; }

  deleteRune() {
    const {
      match: {
        params: { id }
      }
    } = this.props;
    const url = `/api/v1/runes/${id}`;
    const token = document.querySelector('meta[name="csrf-token"]').content;

    fetch(url, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json"
      }
    })
      .then(response => {
        const r = response
        if (response.status === 204) {
          return response;
        }
        throw new Error("Network response was not ok.");
      })
      .then(() => {
        this.props.history.push("/runes");
        this.setState({toCollection: true})
      })
      .catch(error => console.log(error.message));
  }

  render() {
    const { rune } = this.state;
    const { name, short_description, long_description, roman, phonology } = rune

    if (this.state.toCollection === true) {
      return <Redirect to='/' />
    }

    return (
      <div className="">
        <div className="hero position-relative d-flex align-items-center justify-content-center">
          <img
            src={rune.image}
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
            <div className="col-sm-12 col-lg-3">
              <ul className="list-group">
                <h5 className="mb-2">Short description</h5>
                {short_description}
              </ul>
            </div>
            <div className="col-sm-12 col-lg-7">
              <h5 className="mb-2">Long description</h5>
              {long_description}
            </div>
            <div className="col-sm-12 col-lg-2">
              <button type="button" className="btn btn-danger" onClick={this.deleteRune}>
                Delete Rune
              </button>
            </div>
          </div>
          <Link to="/runes" className="btn btn-link">
            Back to runes
          </Link>
        </div>
      </div>
    );
  }
}

export default Rune;