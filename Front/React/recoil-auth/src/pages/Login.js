import React, { useEffect, useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

// Recoil
import { useRecoilState } from "recoil";
import { LoginState } from "../states/LoginState";
import { Token } from "../states/Token";

// styled
import styled from "styled-components";
import { Button, TextField } from "@mui/material";

const InputForm = styled.form`
  display: flex;
  flex-direction: column;
  justify-conent: center;
  align-items: center;
`;

function Login() {
  const navigate = useNavigate();
  const [isLoggedIn, setIsLoggedIn] = useRecoilState(LoginState);
  const [token, setToken] = useRecoilState(Token);
  const [userInfo, setUserInfo] = useState({ email: "", password: "" });
  const handleChangeUserInfo = (e) => {
    setUserInfo({ ...userInfo, [e.target.name]: e.target.value });
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    // console.log("로그인");
    console.log(userInfo);
    axios
      // .post(`https://k6a102.p.ssafy.io/api/v1/user-service/account/login`, {
      .post(`https://csafy.com/api/v1/user-service/account/login`, {
        email: userInfo.email,
        password: userInfo.password,
      })
      // 일단 회원가입 후 메인 페이지로 이동
      .then((res) => {
        console.log(res);

        localStorage.setItem("jwt", res.data.token);
        setIsLoggedIn(true);
        setToken(res.data.token);
        // 초기화
        setUserInfo({
          email: "",
          password: "",
        });
        // navigate
        navigate("/");
      })
      .catch((err) => console.error(err));
  };

  const handleLogOut = () => {
    localStorage.removeItem("jwt");
    setIsLoggedIn(false);
    setToken("");
    navigate("/");
  };

  return (
    <>
      <InputForm>
        <TextField
          name="email"
          id="outlined-basic"
          label="이메일"
          variant="outlined"
          sx={{ width: "352px", height: "57px", mt: "1rem" }}
          onChange={handleChangeUserInfo}
        />
        <TextField
          name="password"
          id="outlined-basic"
          label="비밀번호"
          type="password"
          variant="outlined"
          sx={{ width: "352px", height: "57px", mt: "1rem" }}
          onChange={handleChangeUserInfo}
        />
        {isLoggedIn ? (
          <Button
            variant="dark"
            sx={{
              width: "352px",
              height: "57px",
              textAlign: "center",
              display: "block",
              mt: "1rem",
              mb: "1rem",
              bgcolor: "#D5F2FC",
              ":hover": {
                color: "#fff",
                bgcolor: "#D5F2FC",
              },

              fontSize: "16px",
              fontWeight: "bold",
              color: "#000",
            }}
            onClick={handleLogOut}
          >
            로그아웃
          </Button>
        ) : (
          <Button
            variant="dark"
            sx={{
              width: "352px",
              height: "57px",
              textAlign: "center",
              display: "block",
              mt: "1rem",
              mb: "1rem",
              bgcolor: "#008ED0",
              ":hover": {
                color: "#006D9F",
                bgcolor: "#D5F2FC",
              },

              fontSize: "16px",
              fontWeight: "bold",
              color: "#fff",
            }}
            onClick={handleSubmit}
          >
            로그인
          </Button>
        )}
      </InputForm>
    </>
  );
}

export default Login;
