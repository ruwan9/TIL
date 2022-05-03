import React, { useCallback, useContext, useEffect, useRef, useState } from "react";
import { useNavigate } from "react-router-dom";
import { DiaryDispatchContext } from "../App";
import { getStringDate } from "../util/date";
import { EmotionList } from "../util/emotion";
import EmotionItem from "./EmotionItem";
import MyButton from "./MyButton";
import MyHeader from "./MyHeader";

// utils 폴더로 넘기고 import 해서 사용
// const EmotionList = [
//   {
//     emotion_id: 1,
//     emotion_img: process.env.PUBLIC_URL + `/assets/emotion1.png`,
//     emotion_descript: "완전 좋음",
//   },
//   {
//     emotion_id: 2,
//     emotion_img: process.env.PUBLIC_URL + `/assets/emotion2.png`,
//     emotion_descript: "좋음",
//   },
//   {
//     emotion_id: 3,
//     emotion_img: process.env.PUBLIC_URL + `/assets/emotion3.png`,
//     emotion_descript: "그럭저럭",
//   },
//   {
//     emotion_id: 4,
//     emotion_img: process.env.PUBLIC_URL + `/assets/emotion4.png`,
//     emotion_descript: "나쁨",
//   },
//   {
//     emotion_id: 5,
//     emotion_img: process.env.PUBLIC_URL + `/assets/emotion5.png`,
//     emotion_descript: "끔찍함",
//   },
// ];

// utils 폴더로 넘기고 import 받아 사용
// const getStringDate = (date) => {
//   return date.toISOString().slice(0, 10); // ISO형식의 문자열을 반환 (0부터 9까지 -> yyyy/mm/dd)
// };

function DiaryEditor({ isEdit, originData }) {
  const navigate = useNavigate();
  const [date, setDate] = useState(getStringDate(new Date()));
  // DiaryDispatchContext로부터 onCreate 함수 받아오기
  const { onCreate, onEdit, onRemove } = useContext(DiaryDispatchContext);
  // 기본 감정 선택
  const [emotion, setEmotion] = useState(3);
  const [content, setContent] = useState("");
  const contentRef = useRef();

  const handleClickEmote = useCallback((emotion) => {
    setEmotion(emotion);
  }, []);
  const handleSubmit = () => {
    if (content.length < 1) {
      contentRef.current.focus();
      return;
    }

    if (window.confirm(isEdit ? "일기를 수정하시겠습니까?" : "새로운 일기를 작성하시겠습니까?")) {
      if (!isEdit) {
        onCreate(date, content, emotion);
      } else {
        onEdit(originData.id, date, content, emotion);
      }
    }

    navigate("/", { replace: true });
  };
  const handleRemove = () => {
    if (window.confirm("정말 삭제하시겠습니까?")) {
      onRemove(originData.id);
      navigate("/", { replace: true });
    }
  };

  useEffect(() => {
    if (isEdit) {
      setDate(getStringDate(new Date(parseInt(originData.date))));
      setEmotion(originData.emotion);
      setContent(originData.content);
    }
  }, [isEdit, originData]);

  return (
    <div className="DiaryEditor">
      <MyHeader
        headText={isEdit ? "일기 수정하기" : "새 일기쓰기"}
        leftChild={<MyButton text={"< 뒤로가기"} onClick={() => navigate(-1)} />}
        rightChild={
          isEdit && <MyButton text={"삭제하기"} type={"negative"} onClick={handleRemove} />
        }
      />
      <div>
        <section>
          <h4>오늘은 언제인가요?</h4>
          <div className="input_box">
            <input
              className="input_date"
              type="date"
              value={date}
              onChange={(e) => setDate(e.target.value)}
            />
          </div>
        </section>
        <section>
          <h4>오늘의 감정</h4>
          <div className="input_box emotion_list_wrapper">
            {EmotionList.map((it) => (
              <EmotionItem
                key={it.emotion_id}
                {...it}
                onClick={handleClickEmote}
                isSelected={it.emotion_id === emotion}
              />
            ))}
          </div>
        </section>
        <section>
          <h4>오늘의 일기</h4>
          <div className="input_box text_wrapper">
            <textarea
              ref={contentRef}
              value={content}
              onChange={(e) => setContent(e.target.value)}
              placeholder="오늘은 어땠나요?"
            ></textarea>
          </div>
        </section>
        <section>
          <div className="control_box">
            <MyButton text={"취소하기"} onClick={() => navigate(-1)} />
            <MyButton text={"작성완료"} type={"positive"} onClick={handleSubmit} />
          </div>
        </section>
      </div>
    </div>
  );
}

export default DiaryEditor;
