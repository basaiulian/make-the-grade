import React from "react";
import { BrowserRouter as Router, Switch, Route, Link, Redirect } from "react-router-dom";

import Register from "./Components/Register/Register"
import Login from "./Components/Login/Login";
import Home from "./Components/Home/Home";
import Profile from "./Components/Profile/Profile"

function App() {
  return (
    <div className="App">
      <Router>

      <Route exact path="/">
      <Redirect to="/home" />
      </Route>

      <Route exact path="/home">
          <Home />
        </Route>

      <Switch>

      <Route exact path="/register">
          <Register />
        </Route>

        <Route exact path="/login">
          <Login />
        </Route>

        
        <Route exact path="/profile">
          <Profile />
        </Route>

        </Switch>
        




      </Router>
    </div>
  );
}

export default App;
