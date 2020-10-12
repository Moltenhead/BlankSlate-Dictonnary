import React from "react";
import _ from "lodash";
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

class Routes extends React.Component {
  constructor(props) {
    super(props)
    this.routeMap = {
      "/":              Home,
      "/words":         Words,
      "/word/:id":      Word,
      "/word":          NewWord,
      "/syllables":     Syllables,
      "/syllable/:id":  Syllable,
      "/syllable":      NewSyllable,
      "/concepts":      Concepts,
      "/concept/:id":   Concept,
      "/concept":       NewConcept,
      "/runes":         Runes,
      "/rune/;id":      Rune,
      "/rune":          NewRune
    }
  }

  generateRoutes()
  {
    return(
      _.map(
        this.routeMap,
        (Component, path) => {
          return <Route key={Component.name} path={path} exact render={(props) => React.createElement(Component, props)}/>
        }
      )
    )
  }

  render()
  {
    const routesMap = this.generateRoutes();
    return(
      <Router>
        <Switch>
          {routesMap}
        </Switch>
      </Router>
    );
  }
}
export default Routes
