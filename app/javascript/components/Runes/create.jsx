import Create from "../structuralizers/Create";

class NewRune extends Create {
  constructor(props) {
    super(props);
    this.modelName = "Rune";
    this.modelSingleType = "rune";
    this.modelTypes = "runes";
    this.mutableFields = [
      {name: "name", required: true},
      {name: "short_descritpion", required: false},
      {name: "long_description", required: false},
      {name: "roman", required: false},
      {name: "phonology", required: false}
    ];
  }
}

export default NewRune;