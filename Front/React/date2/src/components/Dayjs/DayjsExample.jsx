import React, { useRef, useState } from "react";
import dayjs from "dayjs";
// 한글 요일
import "dayjs/locale/ko";
dayjs.locale("ko");

function DayjsExample() {
  const dayJsDate = dayjs(); // 오늘
  const newDayJsDate = dayJsDate.add(1, "week"); // dayJsDate로부터 1주일 미래
  const cloneNewDayJsDate = newDayJsDate.add(1, "week"); // newDayJsDate로부터 1주일 미래

  const [bDay, setBDay] = useState("");
  const birthdayRef = useRef(null);

  const handleBirthdayChange = (e) => {
    setBDay(dayjs(e.target.value, "YYYY-MM-DD").format("dddd"));
  };
  return (
    <div>
      <h1>DayJs</h1>
      <div>Immutable Check</div>
      <div>{dayJsDate.format()}</div>

      <div>{newDayJsDate.format()}</div>

      <div>{cloneNewDayJsDate.format()}</div>
      <br />
      <div>Leap Year (Korea)</div>
      <div>
        2017년 1월 1일에 1년 빼기:
        {dayjs("2017-01-01").subtract(1, "year").format()}
      </div>
      <div>
        2017년 1월 1일에 365일 빼기:
        {dayjs("2017-01-01").subtract(365, "day").format()}
      </div>
      <br />
      <div>한국어로 표기(07-17-2021을 2021년 7월 17일로 표기)</div>
      <div>{dayjs("07-17-2021").format("YYYY년 M월 D일")}</div>
      <br />
      <div>내 생일 찾기</div>
      <div>
        <input type="date" ref={birthdayRef} onChange={handleBirthdayChange} />
        <div>내 생일은 무슨 요일일까?</div>
        <div>{bDay}</div>
      </div>
      <br />
      <div>두 날짜 비교</div>
      <div>2021-07-17 03:00과 2021-07-18 02:00는 몇 시간 차이일까?</div>
      <div>{`${dayjs("2021-07-17 03:00").diff(dayjs("2021-07-18 02:00"), "hours")}시간 차이`}</div>
    </div>
  );
}

export default DayjsExample;
