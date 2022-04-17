import React, { useContext, useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { DiaryStateContext } from "../App";
import DiaryEditor from "../components/DiaryEditor";

function Edit() {
  const navigate = useNavigate();
  const { id } = useParams();
  const [originData, setOriginData] = useState();
  const diaryList = useContext(DiaryStateContext);

  useEffect(() => {
    const titleElement = document.getElementsByTagName("title")[0];
    titleElement.innerHTML = `감정 일기장 - ${id}번 일기 수정`;
  }, []);

  // 수정하려는 글의 번호 찾기
  useEffect(() => {
    if (diaryList.length >= 1) {
      const targetDiary = diaryList.find((it) => parseInt(it.id) === parseInt(id));

      if (targetDiary) {
        setOriginData(targetDiary);
      } else {
        navigate("/", { replace: true });
      }
    }
  }, [diaryList, id]);

  return (
    <div>
      <div>{originData && <DiaryEditor isEdit={true} originData={originData} />}</div>
    </div>
  );
}

export default Edit;
