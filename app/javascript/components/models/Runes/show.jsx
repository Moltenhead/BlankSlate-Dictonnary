import Show from "../../structuralizers/Show";

class Rune extends Show {
  constructor(props)
  {
    super(props);
    this.modelName = "Rune";
    this.modelTypes = "runes";
    this.modelSingleType = "rune";
    this.displayingFields = [
      {name: 'short_description', format: 'short'},
      {name: 'long_description', format: 'long'},
      {name: 'roman', format: 'short'},
      {name: 'phonology', format: 'short'}
    ];
  }
}

export default Rune;
