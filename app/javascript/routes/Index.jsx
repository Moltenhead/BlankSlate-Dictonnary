import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";

// ROOT
import Home from "../components/Home";
// WORDS
import Words from "../components/Words/index";
import Word from "../components/Words/show";
import NewWord from "../components/Words/create";
// SYLLABLES
import Syllables from "../components/Syllables/index";
import Syllable from "../components/Syllables/show";
import NewSyllable from "../components/Syllables/create";
// CONCEPTS
import Concepts from "../components/Concepts/index";
import Concept from "../components/Concepts/show";
import NewConcept from "../components/Concepts/create";
// RUNES
import Runes from "../components/Runes/index";
import Rune from "../components/Runes/show";
import NewRune from "../components/Runes/create";

export default (
  <Router>
    <Switch>
      {/*ROOT*/}
      <Route path="/" exact component={Home} />
      {/*WORDS*/}
      <Route path="/words" exact component={Words} />
      <Route path="/word/:id" exact component={Word} />
      <Route path="/word" exact component={NewWord} />
      {/*SYLLABELS*/}
      <Route path="/syllables" exact component={Syllables} />
      <Route path="/syllable/:id" exact component={Syllable} />
      <Route path="/syllable" exact component={NewSyllable} />
      {/*CONCEPTS*/}
      <Route path="/concepts" exact component={Concepts} />
      <Route path="/concept/:id" exact component={Concept} />
      <Route path="/concept" exact component={NewConcept} />
      {/*RUNES*/}
      <Route path="/runes" exact component={Runes} />
      <Route path="/rune/:id" exact component={Rune} />
      <Route path="/rune" exact component={NewRune} />
    </Switch>
  </Router>
);
