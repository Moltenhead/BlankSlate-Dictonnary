import Create from "../../structuralizers/Create";

class NewConcept extends Create {
  constructor(props) {
    super(props);
    this.modelName = "Concept";
    this.modelSingleType = "concept";
    this.modelTypes = "concepts";
    this.mutableFields = [
      {name: "name", required: true},
      {name: "short_descritpion", required: false},
      {name: "long_description", required: false},
      {name: "roman", required: false},
      {name: "phonology", required: false}
    ];
  }
}

export default NewConcept;