import React, { useRef, useState } from "react";
import { add, differenceInHours, format, sub } from "date-fns";
import { ko } from "date-fns/locale";

function DateFnsExample() {
  const dateFnsDate = new Date(); // 오늘
  const newDateFnsDate = add(dateFnsDate, { days: 1 }); // dateFnsDate로부터 1주일 미래
  const cloneNewDateFnsDate = add(newDateFnsDate, { days: 1 }); // newDateFnsDate로부터 1주일 미래

  const [bDay, setBDay] = useState("");
  const birthdayRef = useRef(null);

  const handleBirthdayChange = (e) => {
    setBDay(format(new Date(e.target.value), "EEEE", { locale: ko }));
  };
  return (
    <div>
      <h1>date-fns</h1>
      <div>Immutable Check</div>
      <div>{format(dateFnsDate, "yyyy-MM-dd")}</div>

      <div>{format(newDateFnsDate, "yyyy-MM-dd")}</div>

      <div>{format(cloneNewDateFnsDate, "yyyy-MM-dd")}</div>
      <br />
      <div>Leap Year (Korea)</div>
      <div>
        2017년 1월 1일에 1년 빼기:
        {format(sub(new Date("2017-01-01"), { years: 1 }), "yyyy-MM-dd")}
      </div>
      <div>
        2017년 1월 1일에 365일 빼기:
        {format(sub(new Date("2017-01-01"), { days: 365 }), "yyyy-MM-dd")}
      </div>
      <br />
      <div>한국어로 표기(07-17-2021을 2021년 7월 17일로 표기)</div>
      <div>{format(new Date("07-17-2021"), "yyyy년 M월 d일")}</div>
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
      <div>{`${differenceInHours(
        new Date("2021-07-17 03:00"),
        new Date("2021-07-18 02:00")
      )}시간 차이`}</div>
    </div>
  );
}

export default DateFnsExample;
