import Index from "../../structuralizers/Index";

class Runes extends Index {
  constructor(props) {
    super(props);
    this.modelName = "Rune";
    this.modelSingleType = "rune";
    this.modelTypes = "runes";
  }
}

export default Runes;
