import React,{useState} from "react";
import "./Login.css";
import  { Redirect , Link, Route} from 'react-router-dom'
import { render } from "@testing-library/react";
import Navbar from "../Navbar/Navbar"

function Login() {

    const [username,setUsername] = useState("")
    const [password,setPassword] = useState("")
    const [isLogged,setLoggedin] = useState(0)
    function handleEvent(e){
        if(e.target.id === "password")
            setPassword(e.target.value)
        else if(e.target.id === "username")
            setUsername(e.target.value)
            
    }

    function submitHandler(event){
        event.preventDefault();
        console.log("REQUEST");

        if(password !="" && username!="" ){
            setLoggedin(1);
        }
      
       
    }
    if(isLogged === 1)
        return <Redirect to="/profile" />;

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
