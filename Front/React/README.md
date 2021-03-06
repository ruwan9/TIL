# React



## 수정사항 - React ^18.0.0

새로 나온 리액트 18에서는 ReactDOM.render가 아니라, createRoot를 사용해야 한다

```jsx
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

const rootNode = document.getElementById('root');

ReactDOM.createRoot(rootNode).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
);

reportWebVitals();
```





## 개요

react는 UI 제작용 javascript Library. (Framework가 아님) 별도의 분류용 폴더를 생성할때까지는 Framework 폴더에서 관리 >> Language로 이동



## Notation

- Component : 사용자 정의 태그

  - 가독성, 재사용성, 유지보수

  - props : component 내부로 보내는 외부 제어용 data, read-only (수정 불가, 변경 금지)

  - state : props의 영향을 받아 component 내부에서 사용되는 것들, this.setState로 변경 가능

    - state 값이 바뀌면 render 함수가 다시 호출된다.
    - props vs state 요약

    1. props는 스마트폰의 볼륨버튼이라면 사용자가 볼륨버튼을 누르면 state는 스마트폰안에서 스스로의 상태인 볼륨이 바뀌게 해놓은 모든 조치(회로,프로그래밍 등등)라고 할 수 있습니다.
    2. 상위 컴포넌트는 하위 컴포넌트에게 props를 통해 값을 전달해 내부의 state를 바꾸기 때문에 컴포넌트 스스로 외부에서 전달되는 props를 변경하는 것은 금지되어 있습니다. 또한 하위 컴포넌트가 상위 컴포넌트를 동작시키려면 props를 전달하는 것이 아니라 상위 컴포넌트 안에 이벤트를 심고 그 안에 setState로 값을 바꿔야 합니다.

- Functions

  - render : html을 어떻게 그릴지 정하는 함수

  - bind : 함수 내부에 값을 엮어주거나 주입하는 함수

    - 함수 뒤에서 .bind(this) 등으로 사용

    - 변수 증가시 대응

      ```
      .bind(this, id, 10) 
      -> function(id(id에 대응), num(10에 대응), e)
      ```

  - setState : react에서는 component 구성이 끝난 후, 직접 this.title = 'a' 같은 식으로 내용을 바꿀 수 없다. (정확히는 바뀌기는 하는데 render 호출이 안된다.) 그래서 setState로 바꾸면 된다.

- Toolchain : 개발에 필요한 Tool 들을 한번에 제공



## 시작하기

1. 환경 설정

```
npm install -g create-react-app // -g : 어디서든 실행 가능
npm install -g serve // 배포용
```

1. react 환경 조성 원하는 폴더가서 create-react-app .



## 코드 작성

처음 보는 화면 index.html -> 기본 id가 root로 적혀있고, 내용은 src 폴더에서 관리 src폴더 속 index.js에서 확인 가능

```
ReactDOM.render(
    <App />  // App.js 호출
  document.getElementById('root')  // 기본 id
);
```

- 작성방식 : function, class 방식이 존재.

```
// function 방식
import React from 'react';
import './App.css';

function App() {
  return (
    <div className="App">
    </div>
  );
}
// class 방식
import React, {Component} from 'react';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
      </div>
    )
  }
}
```

- css 코딩

```
App.js 내부에
import './App.css';
입력시, App.js import 시점에 css도 함께 로딩함
```

- 배포 & build

```
npm run build  // dist 생성
npx serve -s build  // 배포 (serve 설치 필수), build를 document root로 하겠다.
```



## React hook

리액트가 고평가받는 요소

- useState : state 값을 변경하고, 함수형 컴포넌트에서도 상태를 관리 및 render할 수 있게 해준다.
- useEffect : 우리의 코드가 확실하게 단 한 번만 실행할 수 있도록 보호해줌
  - 정확히는 두번째 argument [] 안에 들어있는 내용(dependency)이 변했을때만 실행함. 내용이 비어있으면 지켜볼 것이 없으니 한번만 실행하는 것

### useMemo





## Router

1. 환경 설정

```
npm install react-router-dom
npm i react-router-dom@5.3.0 (버전 지정 버전, Switch 이)
```

1. App.vue 상단에 hashrouter(#)인지 browserrouter인지 선택해서 맨 위에 가져다 두기

```
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";
```

- Switch : Route(url) 찾기, 한번에 하나의 route만 render하게 해 줌
- Link : 브라우저의 새로고침 없이 페이지를 이동시켜 줌

1. 내용 작성

```
<Router>
  <Switch> 
    <Route path="/hello">
      <h1>Hello</h1>
    </Route>
    <Route path="/movie">
      <Detail />
    </Route>
    <Route path="/">
      <Home />
    </Route>
  </Switch>
</Router>
```

1. 동적 url 보내기와 확인

```
// 라우팅 등록 (App.js)
<Route path="/movie/:id">

// 라우팅 하기 (id props 받기 잊지 말기)
<Link to={`/movie/${id}`}>{title}</Link>

// 라우팅 된 쪽에서 확인, 사용
import { useParams } from "react-router-dom";

const { id } = useParams();
```



## 현재 상태 확인하기

구글 확장프로그램 : React Developer Tools 설치

- 현재 보는 컴포넌트의 내용이나 탭을 보거나 실시간으로 바꿀 수 있음

redux : 데이터를 바깥 store에 저장해두기