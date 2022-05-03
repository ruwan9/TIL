import { selector } from "recoil";

// 비동기 처리 셀렉터
export const recoilStarCountState = selector({
  key: "asyncState",
  get: async () => {
    // const response = await fetch(`https://api.github.com/repos/facebookexperimental/Recoil`);
    const response = await fetch(process.env.REACT_APP_STARS_URL);
    const recoilProjectInfo = await response.json();
    // stargazers_count 반환
    return recoilProjectInfo["stargazers_count"];
  },
});
