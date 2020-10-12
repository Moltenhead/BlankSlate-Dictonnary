import React from "react";
import Routes from "../routes/Index";
import Errorer from "./core/Errorer";

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      errorId: null,
      showErrorModal: false
    }
  }

  triggerError(errorId)
  {
    this.setState({
      showErrorModal: true,
      errorId: errorId
    })
  }
  setErrorId(errorId)
  {
    this.setState({errorId: errorId})
  }
  
  render() {
    const { showErrorModal, errorId } = this.state;
    return(
      <>
        <Routes triggerError={this.triggerError.bind(this)}/>
        <Errorer isShown={showErrorModal} errorId={errorId} setErrorId={this.setErrorId.bind(this)}/>
      </>
    )
  }
}
export default App;
