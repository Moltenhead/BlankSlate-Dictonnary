import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Runes from "../components/Runes"

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/runes" exact component={Runes} />
    </Switch>
  </Router>
);
