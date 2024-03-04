import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import {
  MSLFlutterComponent,
  MSLFlutterEvents,
  MSLFlutterModule,
} from "@interaction-gaming/msl-flutter-modules";

function App() {
  const [count, setCount] = useState(0);
  const eventHandlers = {
    [MSLFlutterEvents.Error]: () => {},
    [MSLFlutterEvents.OpenTicketChecker]: () => {},
    [MSLFlutterEvents.PrizeSent]: () => {},
  };

  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>

      <MSLFlutterComponent
        module={MSLFlutterModule.CashPop}
        gameConfig={{ apiUrl: "https://igao-qa.michiganlottery.com/api" }}
        eventHandlers={eventHandlers}
        flutterBuildDirectory=""
      ></MSLFlutterComponent>
    </>
  );
}

export default App;
