# Emotion-diary



## useReducer

: 복잡한 상태 관리가 필요한 컴포넌트에 사용되는 hook

```jsx
const [<상태 객체>, <dispatch 함수>] = useReducer(<reducer 함수>, <초기 상태>, <초기 함수>)
```

- 현재 상태(state)객체와 행동(action)객체를 인자로 받아 새로운 상태 객체를 반환한다.
- `state`: 앞으로 컴포넌트에서 사용 할 수 있는 상태
- `dispatch`: 액션을 발생시키는 함수
  - `dispatch({ type: 'INCREMENT' })` 형태로 사용
- `useReducer`에 넣는 첫번째 파라미터는 `reducer 함수`, 두번째 파라미터는 `초기 상태`



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

