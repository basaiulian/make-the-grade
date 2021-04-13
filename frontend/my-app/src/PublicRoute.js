import React from 'react'
import fakeAuth from "./FakeAuth"
import { BrowserRouter as Router, Switch, Route, Link, Redirect } from "react-router-dom";

const PublicRoute = ({ component: Component, ...rest }) => (
    <Route {...rest} render={(props) => (
      fakeAuth.isAuthenticated === false
        ? <Component {...props} /> 
        : <Redirect to='/profile' />
    )} />
  )

export default PublicRoute
