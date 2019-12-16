import React from "react";
import { Link } from "react-router-dom";

class NewRune extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      roman: "",
      phonology: "",
      short_description: "",
      long_description: ""
    };

    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
    this.stripHtmlEntities = this.stripHtmlEntities.bind(this);
  }

  stripHtmlEntities(str) {
    return String(str)
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;");
  }

  onChange(event) {
    console.log("event", event.target)
    this.setState({ [event.target.name]: event.target.value });
    console.log(this.state);
  }

  onSubmit(event) {
    event.preventDefault();
    const url = "/api/v1/runes";
    const { name, short_description, long_description, roman, phonology } = this.state;

    if (name.length == 0 || short_description.length == 0 || long_description.length == 0 || roman.length == 0 || phonology.length ==0)
      return;

    const body = {
      data: {
        attributes: {
          name,
          short_description,
          long_description,
          roman,
          phonology
        }
      }
    };

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
      .then(response => this.props.history.push(`/rune/${response.id}`))
      .catch(error => console.log(error.message));
  }

  render() {
    return (
      <div className="container mt-5">
        <div className="row">
          <div className="col-sm-12 col-lg-6 offset-lg-3">
            <h1 className="font-weight-normal mb-5">
              Add a new rune to our awesome rune collection.
            </h1>
            <form onSubmit={this.onSubmit}>
              <div className="form-group">
                <label htmlFor="runeName">Rune name</label>
                <input
                  type="text"
                  name="name"
                  id="runeName"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="runeRoman">Roman form</label>
                <input
                  type="text"
                  name="roman"
                  id="runeRoman"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="runePhonology">Phonology</label>
                <input
                  type="text"
                  name="phonology"
                  id="runePhonology"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="runeShortDescription">Short description</label>
                <input
                  type="text"
                  name="short_description"
                  id="runeShortDescription"
                  className="form-control"
                  required
                  onChange={this.onChange}
                />
              </div>
              <label htmlFor="runelongDescription">Long description</label>
              <textarea
                className="form-control"
                id="runelongDescription"
                name="long_description"
                rows="5"
                required
                onChange={this.onChange}
              />
              <button type="submit" className="btn custom-button mt-3">
                Create Rune
              </button>
              <Link to="/runes" className="btn btn-link mt-3">
                Back to runes
              </Link>
            </form>
          </div>
        </div>
      </div>
    );
  }

}

export default NewRune;