import React, {useState} from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
  Redirect
} from "react-router-dom";
import "./NavbarProfile.css"
import fakeAuth from "../../FakeAuth"
import logo from "./LogoB.png"
import { useAuth } from "../../Auth";
const Navbar = () => {

    
    const [isLogged,setIsLogged] = useState(1)
    var isLogged2 = localStorage.getItem('logged')
    const [
      redirectToReferrer,
      setRedirectToReferrer
    ] = React.useState(true)
  
    const loginOut = () => fakeAuth.authenticate(() => {
      setRedirectToReferrer(false)
    })
  
     const { setAuthTokens } = useAuth();
  function logOut() {
    setAuthTokens("");
  }



    return (
        <div>
          <div style={{marginBottom:"50px"}}className="row">
          <nav class="navbar navbar-expand-md navbar-light bg-light">
    <a style={{marginLeft:"25px"}} href="#" class="navbar-brand">
        <img src={logo} height="45" alt="CoolBrand"></img>
      
    </a>
    <div>
      <a style={{fontSize:"25px" , fontFamily:"monospace"}}>  Online Testing</a>
      </div>
 

    <div style={{  justifyContent: "flex-end"}} class="collapse navbar-collapse" id="navbarCollapse">
        <div class="row">
        <div class="col">
        <Link to="/courses">Courses</Link>
          </div>
          
          <div class="col">
          <Link to="/profile">Profile</Link>
          </div>
          
          <div class="col">
          <Link to="/myteachers">Contacts</Link>
          </div>
          
          <div class="col">
           <p  style={{marginRight:"30px", cursor:"pointer"}}  onClick={logOut}>Logout</p>
          </div>
           
            
        </div>
    
    </div>
</nav>
</div>
  
      {/* <div className="navigation-bar">
        <nav>
            <div className="nav-items">

            <li>
              <Link to="/dotest">Tests</Link>
            </li>
            <li>
              <Link to="/grades">Grades</Link>
              </li>

              <li>
              <Link to="/myteachers">Contacts</Link>
              </li>

              <li>
            <Link to="/home">Home</Link>
            </li>
            <li >
              
              <button onClick={loginOut} className="logout-button">Logout</button>
            
            </li>
              </div>
              
        </nav>
      
   
        </div>
    
   */}
        </div>
    )
}

export default Navbar
