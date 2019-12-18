import Index from "../structuralizers/Index";

class Concepts extends Index {
  constructor(props) {
    super(props);
    this.modelName = "Concept";
    this.modelSingleType = "concept";
    this.modelTypes = "concepts";
  }
}

export default Concepts;
