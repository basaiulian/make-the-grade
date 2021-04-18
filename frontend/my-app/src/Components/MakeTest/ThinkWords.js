import React,{useEffect,useState} from 'react'
import axios from 'axios'

const ThinkWords = () => {


  const [questionsArray,setQuestionsArray] = useState([])
  const [responseData,setResponseData] = useState("")
  useEffect(() => {
    getWords()

  }, []);

  function handleSubmit(){
    console.log(questionsArray)

    questionsArray.map( item => console.log(item.Id))
  }

  function handleChange(e){
    console.log(e.target.value)
    console.log(e.target.id)
    console.log(e.target.name)

    const questionNumber = e.target.id;
    const questionId= e.target.name;
    const questionValue = e.target.value;

    const questionDetails = { QuestionId: questionNumber, UserAnswers: [] };

    const questionId2 = responseData.filter(
      (question) => question.QuestionId == questionNumber
    );

    if (questionId.length == 0) {
      const newList = responseData.concat(questionDetails);
      setResponseData(newList);
    } else {
      const updateArray = responseData;

    }
  }

  function getWords() {


    axios.get('http://localhost:5000/v1/short-answer-tests/random')
      .then((response) => {

 
        console.log(response.data)

        const listAnswers = response.data

        listAnswers.map( item => {
          // console.log(item)
          const question = { Id: item.id , ShortAnswerText : item.question.split('*')}
          // const addItem = questionsArray.concat(question)
          // console.log(addItem)
          // setQuestionsArray(addItem)
          const questionId = questionsArray.filter(
            (question) => question.Id == item.id
          );
         
          if ( questionId.length === questionsArray.length)
              setQuestionsArray(oldArray => [...oldArray, question]);

          console.log(questionsArray)
        })
        // const question = { Id: response.data.id , ShortAnswerText : response.data.question.split('*')}
        // const addItem = questions.concat(question)
        
        // console.log(addItem)
        // setQuestions(addItem)
        // console.log(response.data)
     
      
      
      });
  }
    return (
        <>
        
        <h4>{questionsArray[0] == undefined ? "None" : questionsArray[0].ShortAnswerText[0]}</h4>

       
         {questionsArray.map(item => {
           return(
             <>

           <h1>{item.Id}</h1>
           <div style={{display:'flex'}} >
           {item.ShortAnswerText.map((item2,index) => 
          <p> {item2}     <input name={index+1} id={item.Id}onChange={handleChange} type="text"  /></p>
          // {index}   {item.ShortAnswerText.length-1}
          //  {item.ShortAnswerText.length != index &&    <p> {item2}  {index}       <input type="text"  /></p>}
             
          
            
           
            )}
          
            </div>
</>
           )
         })}
       
        {/* questionsArray.map(item =>       
            {
            
              <h4>{item.Id == undefined ? "None" : item.Id} </h4>
              // <h1>{item.Id}</h1>
              // {item.ShortAnswerText.map( answers =>{
              //  <h1> answers </h1>
              // })
            }

        }) */}
          

          <button style={{ width:"200px", marginTop:"20px"}} className="btn btn-success" onClick={handleSubmit}> Finish Test</button>

        </>
    )
}

export default ThinkWords
