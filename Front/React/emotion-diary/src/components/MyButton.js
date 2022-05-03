import React from "react";

function MyButton({ text, type, onClick }) {
  const btnType = ["positive", "negative"].includes(type) ? type : "default";

  return (
    <>
      <button className={["MyButton", `MyButton_${btnType}`].join(" ")} onClick={onClick}>
        {text}
      </button>
    </>
  );
}

// default
MyButton.defaultProps = {
  type: "default",
};

export default MyButton;
