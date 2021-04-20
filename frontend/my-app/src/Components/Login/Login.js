import React,{useState} from "react";
import "./Login.css";
import  { Redirect , Link, Route} from 'react-router-dom'
import Navbar from "../Navbar/Navbar"
import fakeAuth from "../../FakeAuth"
import { useAuth } from "../../Auth";
import axios from 'axios'
function Login() {

    const [username,setUsername] = useState("")
    const [password,setPassword] = useState("")
    const [isLogged,setLoggedin] = useState(false)
    const { setAuthTokens } = useAuth();
    function handleEvent(e){
        if(e.target.id === "password")
            setPassword(e.target.value)
        else if(e.target.id === "username")
            setUsername(e.target.value)
            
    }

    function submitHandler(event){
        event.preventDefault();
        console.log("REQUEST");

        axios.post('http://localhost:5000/v1/students/authenticate',[username,password])
        .then((response) => {
    
          console.log(response.data)
          console.log("===================")
          localStorage.setItem("logged",response.data);
        
          setLoggedin(1);
          setAuthTokens("TOKEN")
           
    
        });

        // if(password !="" && username!="" ){
        //     setLoggedin(1);
        //     setAuthTokens("TOKEN")
        //     // localStorage.setItem('logged', username);
       
        // }
      
       
    }

    const [
        redirectToReferrer,
        setRedirectToReferrer
      ] = React.useState(false)
    
      const login = () => fakeAuth.authenticate(() => {
        setRedirectToReferrer(true)
      })
    
      if (isLogged) {
        console.log(isLogged)
        console.log("TOKEN LOGAT ?")
        console.log(localStorage.getItem('tokens'))
        return <Redirect to="/profile" />;
      }

    return (
        <>
           <Navbar />
        <div id="header">
             <div className="form-register">
    
            <form onSubmit={submitHandler} id="loginForm">
            <h1> Welcome back </h1>
                <div className="separator">
                    <label for="name"> <span> Username: </span></label>
                    <input onChange={handleEvent} type="text" id="username" />
                </div>
                <div className="separator" id="separator2">
                    <label for="password"> <span> Password: </span></label>
                    <input onChange={handleEvent} type="password" password="password"  id="password" />
                </div>
                <button id="submitLogin">Login</button>
                
            </form>  
            </div>   
        </div>
        </>
    );
}

export default Login;
