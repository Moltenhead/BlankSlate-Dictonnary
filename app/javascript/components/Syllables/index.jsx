import Index from "../structuralizers/Index";

class Syllables extends Index {
  constructor(props) {
    super(props);
    this.modelName = "Syllable";
    this.modelSingleType = "syllable";
    this.modelTypes = "syllables";
  }
}

export default Syllables;
