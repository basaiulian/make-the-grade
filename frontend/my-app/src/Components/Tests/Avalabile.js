import React,{useState} from 'react'
import "./Avalabile.css"
import NavbarProfile from "../NavbarProfile/NavbarProfile";
import  { Redirect} from 'react-router-dom'

const quizNumbers = [{
    materie:"Math",
    dificultate:"Hard",
    questions: 17
    
},
{
    materie:"IT",
    dificultate:"Medium",
    questions: 15
    
},
{
    materie:"English",
    dificultate:"Easy",
    questions: 25
    
}
,
{
    materie:"Biology",
    dificultate:"Medium",
    questions: 30
    
}
]
const Avalabile = () => {
   
    const [quizState,setQuizState] = useState(false)
    const [essayState,setEssayState] = useState(false)
    const [thinkState,setThinkState] = useState(false)

    function handleQuiz(e){
        setQuizState(true);
    }
    
    function handleEssay(e){
        setEssayState(true);
    }

    
    function handleThink(e){
        setThinkState(true);
    }


    if (quizState === true) {
        return <Redirect to='/test' />
      }

      if (essayState === true) {
        return <Redirect to='/essay' />
      }
      
      if (thinkState === true) {
        return <Redirect to='/word' />
      }
    return (
      <>
       <NavbarProfile/>
    
       <div class="container">
       <h1 style={{ fontFamily:"FontAwesome" , fontFamily:"oblique" }}>Quiz Tests</h1>
       <div class="row">
       {quizNumbers.map((item, index) => (
              <>
              <div key={index} class="col-md-4 col-xl-3">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h6 class="m-b-20">{item.materie} Questions</h6>
                    <h2 class="text-right"><i class="fa fa-check-circle-o"></i><span>{item.questions} questions</span></h2>
              
                    <p class="m-b-0">Difficulty <span class="f-right">{item.dificultate}</span></p>
                    <button onClick={handleQuiz}type="button" class="btn btn-secondary">Start Quiz</button>
                </div>
            </div>
        </div>
                
              </>
            ))}

            </div>
            </div>
            <div class="container">
       <h1 style={{ fontFamily:"FontAwesome" , fontFamily:"oblique" }}>ThinkWords Tests </h1>
       <div class="row">
       {quizNumbers.map((item, index) => (
              <>
              <div key={index} class="col-md-4 col-xl-3">
            <div class="card bg-c-green order-card">
                <div class="card-block">
                    <h6 class="m-b-20">{item.materie} </h6>
                    <h2 class="text-right"><i class="fa fa-check-circle-o"></i><span>{item.questions} words </span></h2>
              
                    <p class="m-b-0">Difficulty <span class="f-right">{item.dificultate}</span></p>
                    <button onClick={handleThink}type="button" class="btn btn-secondary">Start Think</button>
                </div>
            </div>
        </div>
                
              </>
            ))}

            </div>
            </div>


            <div class="container">
       <h1 style={{ fontFamily:"FontAwesome" , fontFamily:"oblique" }}>Essay Tests</h1>
       <div class="row">
       {quizNumbers.map((item, index) => (
              <>
              <div key={index} class="col-md-4 col-xl-3">
            <div class="card bg-c-yellow order-card">
                <div class="card-block">
                    <h6 class="m-b-20">{item.materie} minutes</h6>
                    <h2 class="text-right"><i class="fa fa-check-circle-o"></i><span>{item.questions} minutes</span></h2>
              
                    <p class="m-b-0">Difficulty <span class="f-right">{item.dificultate}</span></p>
                    <button onClick={handleEssay}type="button" class="btn btn-secondary">Start Write</button>
                </div>
            </div>
        </div>
                
              </>
            ))}

            </div>
            </div>
      {/* <div class="container">
    <div class="row">
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Math Questions</h6>
                    <h2 class="text-right"><i class="fa fa-check-circle-o"></i><span>486</span></h2>
              
                    <p class="m-b-0">Difficulty <span class="f-right">Medium</span></p>
                    <button type="button" class="btn btn-secondary">Start Quiz</button>
                </div>
            </div>
        </div>
        
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-green order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Math Questions</h6>
                    <h2 class="text-right"><i class="fa fa-check-circle-o"></i><span>486</span></h2>
              
                    <p class="m-b-0">Difficulty <span class="f-right">Medium</span></p>
                    <button type="button" class="btn btn-secondary">Start Quiz</button>
                </div>
            </div>
        </div>
        
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Math Questions</h6>
                    <h2 class="text-right"><i class="fa fa-check-circle-o"></i><span>486</span></h2>
              
                    <p class="m-b-0">Difficulty <span class="f-right">Easy</span></p>
                    <button type="button" class="btn btn-secondary">Start Quiz</button>
                </div>
            </div>
        </div>
        
        
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h6 class="m-b-20">Math Questions</h6>
                    <h2 class="text-right"><i class="fa fa-check-circle-o"></i><span>486</span></h2>
              
                    <p class="m-b-0">Difficulty <span class="f-right">Hard</span></p>
                    <button type="button" class="btn btn-secondary">Start Quiz</button>
                </div>
            </div>
        </div>
        
	</div>
</div> */}

      </>
    )
}

export default Avalabile
