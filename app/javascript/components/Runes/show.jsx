import Show from "../structuralizers/Show";

class Rune extends Show {
  constructor(props)
  {
    super(props);
    this.modelTypes = "runes";
    this.displayingFields = [
      {name: 'name', type: String},
      {name: 'short_description', type: String},
      {name: 'long_description', type: String},
      {name: 'roman', type: String},
      {name: 'phonology', type: String}
    ];
  }
}

export default Rune;
