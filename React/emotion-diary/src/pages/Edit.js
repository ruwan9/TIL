import React from "react";
import { useNavigate, useSearchParams } from "react-router-dom";

function Edit() {
  const [searchParams, setSearchParams] = useSearchParams();
  const navigate = useNavigate();
  const id = searchParams.get("id");
  // console.log(id);

  return (
    <div>
      <h1>Edit</h1>
      <p>이곳은 일기 수정 페이지 입니다.</p>
      <div>
        <button onClick={() => setSearchParams({ say: "bello" })}>QS 바꾸기</button>
      </div>
      <div>
        <button onClick={() => navigate("/home")}>HOME으로 이동</button>
      </div>
      <div>
        <button onClick={() => navigate(-1)}>뒤로 가기</button>
      </div>
    </div>
  );
}

export default Edit;
