import React from 'react'
import fakeAuth from "./FakeAuth"
import { BrowserRouter as Router, Switch, Route, Link, Redirect } from "react-router-dom";

const PrivateRoute = ({ component: Component, ...rest }) => (
    <Route {...rest} render={(props) => (
      fakeAuth.isAuthenticated === true
        ? <Component {...props} />
        : <Redirect to='/login' />
    )} />
  )

export default PrivateRoute
