import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";

// ROOT
import Home from "../components/Home";
// RUNES
import Runes from "../components/Runes/index"
import Rune from "../components/Runes/show"
import NewRune from "../components/Runes/create"

export default (
  <Router>
    <Switch>
      {/*ROOT*/}
      <Route path="/" exact component={Home} />
      {/*RUNES*/}
      <Route path="/runes" exact component={Runes} />
      <Route path="/rune/:id" exact component={Rune} />
      <Route path="/rune" exact component={NewRune} />
    </Switch>
  </Router>
);
