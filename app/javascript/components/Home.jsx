import React from "react";
import { Link } from "react-router-dom";
import AlbumCardLink from "./AlbumCardLink";

import { chunkArray } from "../utilities/array_utils";

const _mainLinksData = [
  {name: 'word', modelTypes: 'words'},
  {name: 'syllable', modelTypes: 'syllables'},
  {name: 'concept', modelTypes: 'concepts'},
  {name: 'rune', modelTypes: 'runes'}
];

const _rowCols = 3;

const _mainLinksMap = chunkArray(_mainLinksData, _rowCols).map((dataRow, i) => {
  return (
    <div key={i} className="row my-4">
      {dataRow.map((mainLinkData, j) => {
        return <AlbumCardLink key={j} name={mainLinkData.name} modelTypes={mainLinkData.modelTypes} history={[]}/>
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
