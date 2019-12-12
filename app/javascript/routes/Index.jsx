import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Runes from "../components/Runes"
import Rune from "../components/Rune"
import NewRune from "../components/NewRune"

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/runes" exact component={Runes} />
      <Route path="/rune/:id" exact component={Rune} />
      <Route path="/rune" exact component={NewRune} />
    </Switch>
  </Router>
);
