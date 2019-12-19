import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";

// ROOT
import Home         from "../components/Home";
// WORDS
import Words        from "../components/models/Words/index";
import Word         from "../components/models/Words/show";
import NewWord      from "../components/models/Words/create";
// SYLLABLES
import Syllables    from "../components/models/Syllables/index";
import Syllable     from "../components/models/Syllables/show";
import NewSyllable  from "../components/models/Syllables/create";
// CONCEPTS
import Concepts     from "../components/models/Concepts/index";
import Concept      from "../components/models/Concepts/show";
import NewConcept   from "../components/models/Concepts/create";
// RUNES
import Runes        from "../components/models/Runes/index";
import Rune         from "../components/models/Runes/show";
import NewRune      from "../components/models/Runes/create";

export default (
  <Router>
    <Switch>
      {/*ROOT*/}
      <Route path="/"             exact component={Home} />
      {/*WORDS*/}
      <Route path="/words"        exact component={Words} />
      <Route path="/word/:id"     exact component={Word} />
      <Route path="/word"         exact component={NewWord} />
      {/*SYLLABELS*/}
      <Route path="/syllables"    exact component={Syllables} />
      <Route path="/syllable/:id" exact component={Syllable} />
      <Route path="/syllable"     exact component={NewSyllable} />
      {/*CONCEPTS*/}
      <Route path="/concepts"     exact component={Concepts} />
      <Route path="/concept/:id"  exact component={Concept} />
      <Route path="/concept"      exact component={NewConcept} />
      {/*RUNES*/}
      <Route path="/runes"        exact component={Runes} />
      <Route path="/rune/:id"     exact component={Rune} />
      <Route path="/rune"         exact component={NewRune} />
    </Switch>
  </Router>
);
