import Show from "../../structuralizers/Show";

class Syllable extends Show {
  constructor(props)
  {
    super(props);
    this.modelName = "Syllable";
    this.modelTypes = "syllables";
    this.displayingFields = [
      {name: 'short_description', format: 'short'},
      {name: 'long_description', format: 'long'},
      {name: 'roman', format: 'short'},
      {name: 'phonology', format: 'short'}
    ];
  }
}

export default Syllable;
