import Create from "../structuralizers/Create";

class NewWord extends Create {
  constructor(props) {
    super(props);
    this.modelName = "Word";
    this.modelSingleType = "word";
    this.modelTypes = "words";
    this.mutableFields = [
      {name: "name", required: true},
      {name: "short_descritpion", required: false},
      {name: "long_description", required: false},
      {name: "roman", required: false},
      {name: "phonology", required: false}
    ];
  }
}

export default NewWord;