import React from "react";
import { RecoilRoot, atom, selector, useRecoilState, useRecoilValue } from "recoil";
import ReactDOM from "react-dom/client";
import "./index.css";

// recoil
import ReadWriteCount from "./ReadWriteCount";
import ReadOnlyCount from "./ReadOnlyCount";
import SelectorCount from "./SelectorCount";
import RecoilStarCount from "./RecoilStarCount";

// react ^18.0.0
const rootNode = document.getElementById("root");

ReactDOM.createRoot(rootNode).render(
  <RecoilRoot>
    {/* <ReadWriteCount />
    <ReadOnlyCount /> */}
    {/* <SelectorCount /> */}
    <React.Suspense fallback={<div>로딩중입니다.</div>}>
      <RecoilStarCount />
    </React.Suspense>
  </RecoilRoot>
);
