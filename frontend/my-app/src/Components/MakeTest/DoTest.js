import React, { useState, useEffect } from "react";
import NavbarProfile from "../NavbarProfile/NavbarProfile";
import axios from 'axios'
import "./DoTest.css"
const DoTest = () => {
  const questions = [
    {
      id: 1,
      question: "1+1?",
      response1: "1",
      response2: "2",
      response3: "5",
    },
    {
      id: 2,
      question: "5*5?",
      response1: "55",
      response2: "30",
      response3: "25",
    },
    {
      id: 3,
      question: "2012-1002?",
      response1: "1010",
      response2: "1011",
      response3: "1110",
    },
    {
      id: 4,
      question: "777755+22?",
      response1: "777777",
      response2: "777778",
      response3: "777767",
    }
  ];

  const [responsesArray, setResponsesArray] = useState([]);
  const [dataArray, setDataArray] = useState([])
  const [correctAnswers,setCorrectAnswers] = useState([])

  function getQuestions() {


    axios.get('http://localhost:5000/v1/multiple-choice-tests')
      .then((response) => {

        setDataArray(response.data)

        console.log(responsesArray)

      
      
      });
  }

  useEffect(() => {
    getQuestions()

  }, []);


  const checkAnswer = function(answer){
    // else if (correctAnswers[0].correctButNotCheckedAnswers.includes(answer))
    // {
    //     return 2;

    // console.log(correctAnswers)
    correctAnswers.map( answerlist => {
      console.log(answerlist)
      if (answerlist.correctAnswers.includes(answer))
      {  console.log("return 1")
          return 1;
      
      } else if (answerlist.wrongAnswers.includes(answer))
      {
        console.log("return 2")
          return 2;
      }
    })
    
}




  function handleChange(e) {
    const questionNumber = e.target.id;
    const questionResponse = e.target.value;
    const questionDetails = { QuestionId: questionNumber, UserAnswers: [questionResponse] };

    const questionId = responsesArray.filter(
      (question) => question.QuestionId == questionNumber
    );

    if (questionId.length == 0) {
      const newList = responsesArray.concat(questionDetails);
      setResponsesArray(newList);
    } else {
      const updateArray = responsesArray;

      updateArray.map((item, index) => {
        if (questionNumber == item.QuestionId) {
          const deleteResponse = updateArray[index].UserAnswers
          const lungime1 = updateArray[index].UserAnswers.length
          let updateArray2 = deleteResponse.filter(nume => nume != questionResponse)
          const lungime2 = updateArray2.length

          if (lungime1 == lungime2)
            updateArray[index].UserAnswers = updateArray[index].UserAnswers.concat(questionResponse);
          else
            updateArray[index].UserAnswers = updateArray2


          setResponsesArray(updateArray)
        }
      });
    }
  }

  function handleSubmit(e) {
    e.preventDefault();
    getQuestions()
    console.log("Am dat submit");

    console.log("RESPONSES")
    console.log(responsesArray)  


    // const sendData = responsesArray.map( response =>  )
    console.log("---------------------------------")
    const trimite = [{ QuestionId: 1, UserAnswers:["ab","cd"]}, { QuestionId: 1, UserAnswers:["ab","cd"]}]

    responsesArray.map( response => ( console.log(response)))


    axios.post('http://localhost:5000/v1/multiple-choice-tests/validate',responsesArray)
    .then((response) => {

      console.log(response.data)
      setCorrectAnswers(response.data)
       
       

    });

    // responsesArray.map((item) => console.log(item));
    // console.log("Raspunsurile sunt " + responsesArray )
  }
  return (
    <>
      <NavbarProfile />
      <div className="container">

      
        <h1 fon className="text-center"> Math test</h1>

        { correctAnswers != "" && <p1>{correctAnswers[0].questionId}</p1>}
        { correctAnswers != "" && <p1>{correctAnswers[0].correctAnswers}</p1>}
        {/* { correctAnswers != "" && <p1>{correctAnswers[0].correctButNotCheckedAnswers}</p1>}
        { correctAnswers != "" && <p1>{correctAnswers[0].questionScore}</p1>} */}
         <p1 className="border-normal">
                                  MAMAIA
                                  </p1>
        <form>

          <div>
            {dataArray.map((item, index) => (
              <>
                <div key={index} class="form-group">
                  <label style={{ marginBottom: "10px", marginTop: "10px", fontFamily: "cursive" }} class="control-label">
                    {" "}
                    {item.id} {item.question}
                    {
                      item.possibleAnswers.split(',').map((item2, index2) => (
                        <>
                          <div class="row">
                            <div class="col-sm">
                              <div class="form-check">
                                <input id={item.id} onClick={handleChange} class="form-check-input" type="checkbox" value={item2} name={index} id={item.id}></input>
                                < label class="form-check-label" for="flexRadioDefault1">
                                  <p1 className={ correctAnswers !=[]  && checkAnswer(item2)==1 ? "border-correct" : "border-normal" }>
                                  {item2}
                                  </p1>
                                </label>
                              </div>
                              </div>
                              </div>
                      </>
                    )
                    )
                    }
                 
                  </label>
                          {/* <div class="row">
                            <div class="col-sm">
                              <div class="form-check">
                                <input id={item.id} onClick={handleChange} class="form-check-input" type="checkbox" value={item.response1} name={index} id={item.id}></input>
                                <label class="form-check-label" for="flexRadioDefault1">
                                  {item.response1}
                                </label>
                              </div>
                            </div>
                            <div class="col-sm">
                              <div class="form-check">
                                <input id={item.id} onClick={handleChange} class="form-check-input" type="checkbox" value={item.response2} name={index} id={item.id}></input>
                                <label class="form-check-label" for="flexRadioDefault1">
                                  {item.response2}
                                </label>
                              </div>
                            </div>

                            <div class="col-sm">
                              <div class="form-check">
                                <input id={item.id} onClick={handleChange} class="form-check-input" type="checkbox" value={item.response3} name={index} id={item.id}></input>
                                <label class="form-check-label" for="flexRadioDefault1">
                                  {item.response3}
                                </label>
                              </div>
                            </div>
                          </div> */}


                          {/* <div class="radio">
              <label>
                <input type="radio" name="response3" value="hamburger"></input>
                {item.response3}
              </label>
            </div> */}
                        </div>
              </>
            ))}
          </div>

                <div class="form-group">
                  <button
                    onClick={handleSubmit}
                    class="btn btn-primary "
                    name="submit"
                    type="submit"
                  >
                    Submit
            </button>
                </div>
              </form>
      </div>
    </>
  );
};

export default DoTest;
