import Show from "../../structuralizers/Show";

class Word extends Show {
  constructor(props)
  {
    super(props);
    this.modelName = "Word";
    this.modelTypes = "words";
    this.displayingFields = [
      {name: 'short_description', format: 'short'},
      {name: 'long_description', format: 'long'},
      {name: 'roman', format: 'short'},
      {name: 'phonology', format: 'short'}
    ];
  }
}

export default Word;
