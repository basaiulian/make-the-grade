import React from "react";
import { Route, Redirect } from "react-router-dom";
import { useAuth } from "./Auth";
/* eslint-disable */
function PrivateRoute({ component: Component, ...rest }) {
    const { authTokens } = useAuth();

    return (
      <Route
        {...rest}
        render={props =>
          !authTokens ? (
            <Component {...props} />
          ) : (
            <Redirect to="/profile" />
          )
        }
      />
    );
}
/* eslint-disable */
export default PrivateRoute;