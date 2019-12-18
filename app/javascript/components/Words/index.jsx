import Index from "../structuralizers/Index";

class Words extends Index {
  constructor(props) {
    super(props);
    this.modelName = "Word";
    this.modelSingleType = "word";
    this.modelTypes = "words";
  }
}

export default Words;
