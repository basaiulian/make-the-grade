import React, { useState } from "react";
import "./Register.css"
import axios from "axios"
import Navbar from '../Navbar/Navbar'

function Register() {
    const [username, setUsername] = useState("")
    const [password, setPassword] = useState("")
    const [firstName, setFirstName] = useState("")
    const [lastName, setLastName] = useState("")
    const [email, setEmail] = useState("")
    const [age, setAge] = useState("")
    const [address, setAddress] = useState("")

    function handleEvent(e) {
        if (e.target.id === "password")
            setPassword(e.target.value)
        else if (e.target.id === "username")
            setUsername(e.target.value)
        else if (e.target.id === "firstname")
            setFirstName(e.target.value)
        else if (e.target.id === "lastname")
            setLastName(e.target.value)
        else if (e.target.id === "email")
            setEmail(e.target.value)
        else if (e.target.id === "age")
            setAge(e.target.value)
        else if (e.target.id === "address")
            setAddress(e.target.value)

    }

    function submitHandler(event) {
        event.preventDefault();
        if (password != "" && username != "" && email != "" && address != "") {
            const requestBody = [username, password, email, address];
            axios.post('http://localhost:5000/add-student', requestBody)
                .then(response => console.log(response));
        }
    }

    return (
        <>
        <Navbar />
        <div id="header">
            <div className="form-register">

                <form onSubmit={submitHandler} id="loginForm">
                    <h1> Register </h1>
                    <div className="separator">
                        <label for="name"> <span> Username: </span></label>
                        <input onChange={handleEvent} type="text" id="username" />
                    </div>
                    <div className="separator" >
                        <label for="password"> <span> Password: </span></label>
                        <input onChange={handleEvent} type="password" password="password" id="password" />
                    </div>
                    {/* <div className="separator">
                    <label for="password"> <span> ConfirmPas: </span></label>
                    <input onChange={handleEvent} type="text" password="password"  id="password" />
                </div> */}
                    <div className="separator">
                        <label for="name"> <span> FirstName: </span></label>
                        <input onChange={handleEvent} type="text" id="firstname" />
                    </div>
                    <div className="separator">
                        <label for="name"> <span> LastName: </span></label>
                        <input onChange={handleEvent} type="text" id="lastname" />
                    </div>

                    <div className="separator">
                        <label for="name"> <span> Email: </span></label>
                        <input onChange={handleEvent} type="email" id="email" />
                    </div>
                    <div className="separator">
                        <label for="name"> <span> Age: </span></label>
                        <input onChange={handleEvent} type="text" id="age" />
                    </div>
                    <div className="separator">
                        <label for="name"> <span> Address: </span></label>
                        <input onChange={handleEvent} type="text" id="address" />
                    </div>
                    <div className="validation">
                        <button id="submitLogin">Register</button>
                    </div>
                </form>
            </div>
        </div>
        </>
    );
}

export default Register
