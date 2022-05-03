import React from "react";
import { useRecoilValue } from "recoil";
import { recoilStarCountState } from "./recoil/recoilStar";

function RecoilStarCount() {
  const recoilStarCount = useRecoilValue(recoilStarCountState);

  return (
    <>
      <p>recoil gitbub star 갯수 </p>
      <p>{recoilStarCount}개</p>
    </>
  );
}

export default RecoilStarCount;
