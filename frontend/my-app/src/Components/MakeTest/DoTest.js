import React, { useState } from "react";
import NavbarProfile from "../NavbarProfile/NavbarProfile";

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

  function handleChange(e) {
    const questionNumber = e.target.id;
    const questionResponse = e.target.value;
    const questionDetails = { id: questionNumber, response: [questionResponse] };

    const questionId = responsesArray.filter(
      (question) => question.id == questionNumber
    );

    if (questionId.length == 0) {
      const newList = responsesArray.concat(questionDetails);
      setResponsesArray(newList);
    } else {
      const updateArray = responsesArray;

      updateArray.map((item, index) => {
        if (questionNumber == item.id) {
          const deleteResponse = updateArray[index].response
          const lungime1 = updateArray[index].response.length
          let updateArray2 = deleteResponse.filter(nume => nume != questionResponse)
          const lungime2 = updateArray2.length

          if ( lungime1 == lungime2)      
            updateArray[index].response = updateArray[index].response.concat(questionResponse);
          else
            updateArray[index].response = updateArray2
          
          
          setResponsesArray(updateArray)
        }
      });
    }
  }

  function handleSubmit(e) {
    e.preventDefault();

    console.log("Am dat submit");

    responsesArray.map((item) => console.log(item));
    // console.log("Raspunsurile sunt " + responsesArray )
  }
  return (
    <>
      <NavbarProfile />
      <div className="container">
        <h1 fon className="text-center"> Math test</h1>
        <form>
      
          <div>
            {questions.map((item, index) => (
              <>
                <div key={index} class="form-group">
                  <label style={{ marginBottom:"10px", marginTop:"10px", fontFamily:"cursive"}}class="control-label">
                    {" "}
                    {item.id}. {item.question}
                  </label>
                  <div class="row">
                  <div class="col-sm">
                  <div class="form-check">
  <input    id={item.id} onClick={handleChange}class="form-check-input" type="checkbox" value={item.response1} name={index} id={item.id}></input>
  <label class="form-check-label" for="flexRadioDefault1">
  {item.response1}
  </label>
</div>
                  </div>
                  <div class="col-sm">
                  <div class="form-check">
  <input    id={item.id} onClick={handleChange}class="form-check-input" type="checkbox" value={item.response2} name={index} id={item.id}></input>
  <label class="form-check-label" for="flexRadioDefault1">
  {item.response2}
  </label>
</div>
                  </div>

                  <div class="col-sm">
                  <div class="form-check">
  <input    id={item.id} onClick={handleChange}class="form-check-input" type="checkbox" value={item.response3} name={index} id={item.id}></input>
  <label class="form-check-label" for="flexRadioDefault1">
  {item.response3}
  </label>
</div>
                  </div>
                  </div>
                  

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
