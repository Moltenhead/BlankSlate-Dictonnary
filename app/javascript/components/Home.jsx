import React from "react";
import { Link } from "react-router-dom";
import MainLink from "./MainLink";

import { chunkArray } from "../utilities/array_utils";

const _mainLinksData = [
  {name: 'word'},
  {name: 'syllable'},
  {name: 'concept'},
  {name: 'rune'}
];

const _rowCols = 3;

const _mainLinksMap = chunkArray(_mainLinksData, _rowCols).map((dataRow, i) => {
  return (
    <div className="row">
      {dataRow.map((mainLinkData, j) => {
        const k = (i * _rowCols) + j
        console.log(k)
        return <MainLink name={mainLinkData.name} key={k}/>
      })}
    </div>
  );
});

export default () => (
  <main role="main">
    <section className="jumbotron text-center">
      <div className="container">
        <h1>Blank Slate - Dictionnary</h1>
        <p className="lead text-muted">
          Words and concepts from the stretching lands.
        </p>
        <p>
          <Link
            to="/"
            className="btn btn-primary my-2"
            role="button"
          >
            Main
          </Link>
        </p>
      </div>
    </section>
    <div className="album bg-transparent">
      <div className="container secondary-color">
        {_mainLinksMap}
      </div>
    </div>
  </main>
);
