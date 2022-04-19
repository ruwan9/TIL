import "./App.css";
import DateFnsExample from "./components/DateFns/DateFnsExample";
import DayjsExample from "./components/Dayjs/DayjsExample";
import MomentExample from "./components/Moment/MomentExample";

function App() {
  return (
    <div className="App">
      <MomentExample />
      <DayjsExample />
      <DateFnsExample />
    </div>
  );
}

export default App;
