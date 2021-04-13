import React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
  Redirect,
} from "react-router-dom";

import Navbar from "./Components/Navbar/Navbar";
import Register from "./Components/Register/Register";
import Login from "./Components/Login/Login";
import Home from "./Components/Home/Home";
import Profile from "./Components/Profile/Profile";
import TestQuiz from "./Components/MakeTest/DoTest";
import PrivateRoute from "./PrivateRoute";
import PublicRoute from "./PublicRoute";
import fakeAuth from "./FakeAuth";
import SeeTests from "./Components/Tests/Avalabile";
import EssayTest from "./Components/MakeTest/Eassay";
import ThinkWords from "./Components/MakeTest/ThinkWords";
function App() {
  const loggedIn = localStorage.getItem("logged");

  const autentificat = localStorage.getItem("logged");
  console.log("Estem logati ??" + loggedIn);

  console.log(fakeAuth.isAuthenticated);

  return (
    <div className="App">
      <Router>
        <Route exact path="/">
          <Home />
        </Route>

        <Switch>
          <PublicRoute path="/register" component={Register} />
          <PublicRoute path="/login" component={Login} />

          <PrivateRoute path="/essay" component={EssayTest} />

          <PrivateRoute path="/profile" component={Profile} />

          <PrivateRoute path="/test" component={TestQuiz} />

          <PrivateRoute path="/dotest" component={SeeTests} />
          <PrivateRoute path="/word" component={ThinkWords} />
        </Switch>
      </Router>
    </div>
  );
}

export default App;
