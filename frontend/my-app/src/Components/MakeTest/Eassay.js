import React,{useState,useRef,useEffect} from 'react'
import axios from 'axios'
const Eassay = () => {

    const [essay,setEssay] = useState("")
    const startDate = new Date()
    const [validTest,setValidTest] = useState(true)
    const [currentDate,setCurrentDate] = useState(startDate.getSeconds())
    const [question,setQuestion] = useState("")
    const [idEssay,setIdEssay] = useState("")
    function handleSubmit(e){
        e.preventDefault()

        // const EssayTestText = essay
        const sendResponse = { Id: parseInt(idEssay) , EssayTestText: essay }
        console.log(sendResponse)
        axios.put('http://localhost:5000/v1/essay-tests/'+idEssay,sendResponse)
        .then((response) => {
    
          console.log(response.data)
           
           
    
        });

        console.log("am dat submit")
        console.log(startDate)
        console.log(essay)
    }

    function verifyTime(){

        const endDate = new Date()
        setCurrentDate(endDate.getSeconds())


    }

    const [time, setTime] = useState(new Date().toLocaleTimeString());
  const secondsPassed = useRef(0);

  useEffect(() => {
    const timeout = setTimeout(() => {
      const date = new Date()
      secondsPassed.current = secondsPassed.current + 1;
      setTime(date.toLocaleTimeString());
    }, 1000);
    return () => {
      clearTimeout(timeout);
    }
  }, [time]);

    useEffect(() => {
        verifyTime()
      });


      useEffect(() => {
        getEssay()
      },[]);

      


      
  function getEssay() {


    axios.get('http://localhost:5000/v1/essay-tests/random')
      .then((response) => {

 
        setQuestion(response.data.question)
        
        setIdEssay(response.data.id)

        console.log(response.data)
        console.log(idEssay)
      
      
      });
  }
    function handleInput(e){
        setEssay(e.target.value)
    }
    return (
        <>
        <div className="container">
             <form>

<p>Time : {currentDate}</p>
<div>{time}</div>
      <div>{secondsPassed.current}</div>

<div style={{ textAlign:"center", fontSize:"24px",marginTop:"50px"}}class="form-group">
 { question != "" &&  <label style={{marginBottom:"50px"}} for="exampleFormControlTextarea1"> {question} </label> }
  <textarea onChange={handleInput} style={{ height:"200px"}}class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  <button style={{ width:"200px", marginTop:"20px"}} className="btn btn-success" onClick={handleSubmit}> Submit</button>
</div>

</form>

</div>

        </>
    )
}

export default Eassay
