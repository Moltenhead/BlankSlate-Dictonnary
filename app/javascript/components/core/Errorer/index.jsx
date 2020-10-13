import React from "react";
import Modal from "../Modal";

import "./index.scss"

class Errorer extends Modal {
  constructor(props)
  {
    super(props);
    this.timer = null;
    this.state = {
      isShown: false,
      className: "opacity-1",
      errorMessage: ""
    };
  }

  validateError(errorId = null) {
    if (!errorId)
      return false
    if (typeof errorId != String)
      throw new Error("errorId is not a String");
    if (!errorId.match(/[0-9A-Z]{4,}/g))
      throw new Error("errorId is not an hexa char - ");

    return true
  }

  verbalizeError(errorId, options = null)
  {
    if (this.validateError()) {
      switch (errorId) {
        case "0000":
          return "requested page is empty";
      }
    }
  }

  animateAndClose()
  {
    this.setState({className: "opacity-0"})
    clearTimeout(this.timer);
    this.timer = setTimeout(
      this.popOut(),
      334
    )
  }

  popIn()
  {
    const { errorId } = this.props;
    if (this.validateError(errorId)) {
      this.setState({errorMessage: this.verbalizeError(errorId)});
      this.timer = setTimeout(
        this.animateAndClose(),
        3000
      );
    }
  }

  popOut()
  {
    this.setState({ isShown: false });
    this.setErrorId(null);
  }

  componentDidUpdate(prevProps)
  {
    const { isShown } = this.props;
    if (isShown != prevProps.isShown) {
      if (isShown) {
        this.popIn();
      } else {
        this.popOut();
      }
    }
  }

  componentWillUnmount() { clearTimeout(this.timer); }

  defaultRender()
  {
    const { className, errorMessage } = this.state;

    return ReactDOM.createPortal(
      <>
        <aside className={"modal-cover error-modal " + className}>
          <div className="modal-area">
            <button className="_modal-close" onClick={this.closeModal}>
              <span id="close-modal" className="_hide-visual">
                Close
              </span>
              <svg className="_modal-close-icon" viewBox="0 0 40 40">
                <path d="M 10,10 L 30,30 M 30,10 L 10,30" />
              </svg>
            </button>
            <div className="modal-body">
              {errorMessage}
            </div>
          </div>
        </aside>
      </>,
      document.body
    )
  }
}
export default Errorer
