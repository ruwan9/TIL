import React from "react";
import { useRecoilValue } from "recoil";
import { countState } from "./recoil/count";

// atom 을 읽기만 하는 컴포넌트
function ReadOnlyCount() {
  const count = useRecoilValue(countState);

  return (
    <div>
      <h2>읽기 전용 컴포넌트</h2>
      <p>카운트 {count}</p>
    </div>
  );
}

export default ReadOnlyCount;
