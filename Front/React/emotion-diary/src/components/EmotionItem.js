import React from "react";

function EmotionItem({ emotion_id, emotion_img, emotion_descript, onClick, isSelected }) {
  return (
    <div
      className={[
        "EmotionItem",
        isSelected ? `EmotionItem_on_${emotion_id}` : `EmotionItem_off`,
      ].join(" ")}
      onClick={() => onClick(emotion_id)}
    >
      <img src={emotion_img} alt="Emotion" />
      <span>{emotion_descript}</span>
    </div>
  );
}

export default React.memo(EmotionItem);