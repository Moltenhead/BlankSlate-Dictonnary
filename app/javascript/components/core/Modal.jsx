import React from "react";


class Modal extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      isShown: false
    }
  }

  render()
  {
    const { isShown } = this.state
    return (
      <>
        {isShown ? defaultRender() : <React.Fragment />}
      </>
    )
  }
}
export default Modal
