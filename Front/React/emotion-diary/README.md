# Emotion-diary

## πΈ To try...

https://udemy-project.web.app/

## useReducer

: λ³΅μ‘ν μν κ΄λ¦¬κ° νμν μ»΄ν¬λνΈμ μ¬μ©λλ hook

```jsx
const [<μν κ°μ²΄>, <dispatch ν¨μ>] = useReducer(<reducer ν¨μ>, <μ΄κΈ° μν>, <μ΄κΈ° ν¨μ>)
```

- νμ¬ μν(state)κ°μ²΄μ νλ(action)κ°μ²΄λ₯Ό μΈμλ‘ λ°μ μλ‘μ΄ μν κ°μ²΄λ₯Ό λ°ννλ€.
- `state`: μμΌλ‘ μ»΄ν¬λνΈμμ μ¬μ© ν  μ μλ μν
- `dispatch`: μ‘μμ λ°μμν€λ ν¨μ
  - `dispatch({ type: 'INCREMENT' })` ννλ‘ μ¬μ©
- `useReducer`μ λ£λ μ²«λ²μ§Έ νλΌλ―Έν°λ `reducer ν¨μ`, λλ²μ§Έ νλΌλ―Έν°λ `μ΄κΈ° μν`

## μκ° / λ μ§ κ΄λ ¨

```jsx
// νμ¬ λ μ§μ μκ°
let time = new Date();
console.log(time); // Thu Apr 14 2022 00:00:00 GMT+0900 (Korean Standard Time)

// μ°λ
let year = time.getFullYear();
console.log(year); // 2022

// λ¬ - 0μλΆν° μμνκΈ° λλ¬Έμ +1 ν΄μ€μΌ νμ¬ λ¬μ΄ λμ¨λ€.
let month = time.getMonth() + 1;
console.log(month); // 4

// λ μ§
let date = time.getDate();
console.log(date); // 14

// μμΌ - μμμΌμ 1, νμμΌμ 2, ...
let day = time.getDay();
console.log(day); // 4(λͺ©μμΌ)

// UNIX νμ
let timestamp = time.getTime();
console.log(timestamp); // 1649939184906
```
