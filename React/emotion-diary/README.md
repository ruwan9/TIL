# Emotion-diary



## 시간 / 날짜 관련

```jsx
// 현재 날짜와 시간
let time = new Date()
console.log(time) // Thu Apr 14 2022 00:00:00 GMT+0900 (Korean Standard Time)

// 연도
let year = time.getFullYear()
console.log(year) // 2022

// 달 - 0월부터 시작하기 때문에 +1 해줘야 현재 달이 나온다.
let month = time.getMonth() + 1 
console.log(month) // 4

// 날짜
let date = time.getDate()
console.log(date) // 14

// 요일 - 월요일은 1, 화요일은 2, ...
let day = time.getDay()
console.log(day) // 4(목요일)

// UNIX 타임
let timestamp = time.getTime()
console.log(timestamp) // 1649939184906
```

