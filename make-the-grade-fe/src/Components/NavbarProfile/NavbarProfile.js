import React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import "./NavbarProfile.css"


const Navbar = () => {
    return (
        <div>

      <div className="navigation-bar">
        <nav>
            <div className="nav-items">

            <li>
              <Link to="/#">Test</Link>
            </li>
            <li>
              <Link to="/login">Grades</Link>
              </li>

              <li>
              <Link to="/contacts">Contacts</Link>
              </li>

              <li>
            <Link to="/home">Home</Link>
            </li>
              </div>
        </nav>
        </div>


        </div>
    )
}

export default Navbar