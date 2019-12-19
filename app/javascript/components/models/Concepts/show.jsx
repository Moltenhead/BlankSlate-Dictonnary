import Show from "../../structuralizers/Show";

class Concept extends Show {
  constructor(props)
  {
    super(props);
    this.modelName = "Concept";
    this.modelTypes = "concepts";
    this.displayingFields = [
      {name: 'short_description', format: 'short'},
      {name: 'long_description', format: 'long'},
      {name: 'roman', format: 'short'},
      {name: 'phonology', format: 'short'}
    ];
  }
}

export default Concept;
