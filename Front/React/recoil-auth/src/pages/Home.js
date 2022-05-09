import React from "react";
import { useNavigate } from "react-router-dom";
import { useRecoilState } from "recoil";

import { Token } from "../states/Token";

function Home() {
  const [token, setToken] = useRecoilState(Token);
  const navigate = useNavigate();
  return (
    <div>
      <h1>Home</h1>
      <button onClick={() => navigate("/login")}>LOGIN</button>
      <div>{token}</div>
    </div>
  );
}

export default Home;
