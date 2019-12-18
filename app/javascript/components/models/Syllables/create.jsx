import Create from "../structuralizers/Create";

class NewSyllable extends Create {
  constructor(props) {
    super(props);
    this.modelName = "Syllable";
    this.modelSingleType = "syllable";
    this.modelTypes = "syllables";
    this.mutableFields = [
      {name: "name", required: true},
      {name: "short_descritpion", required: false},
      {name: "long_description", required: false},
      {name: "roman", required: false},
      {name: "phonology", required: false}
    ];
  }
}

export default NewSyllable;