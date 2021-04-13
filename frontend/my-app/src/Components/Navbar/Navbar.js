import React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import "./Navbar.css"
import Login from "../Login/Login"
import Home from "../Home/Home"
const Navbar = () => {

  
    return (
        <div>
  
      <div className="navigation-bar">
        <nav>
            <div className="nav-items">

            <li>
              <Link to="/register">Register</Link>
            </li>
            <li>
              <Link to="/login">Login</Link>
              </li>

              <li>
              <Link to="/contacts">Contacts</Link>
              </li>

              <li>
        <     Link to="/home">Home</Link>
            </li>
              </div>

              
        </nav>
        </div>
    
  
        </div>
    )
}

export default Navbar
