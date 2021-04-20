import React,{useState,useEffect} from 'react'
import NavbarProfile from "../NavbarProfile/NavbarProfile"
import "./Profile.css"
import axios from 'axios'
function Profile() {
    const user = localStorage.getItem('logged')
    console.log(user)
    

    const [profileData,setProfileData] = useState("")
    useEffect(() => {
        getProfileData()
    
      }, []);


      function getProfileData() {


        axios.get('http://localhost:5000/v1/students/'+user)
          .then((response) => {
    
     
            console.log(response.data)
            setProfileData(response.data)
            
    
          
          });
      }
    return (
        <>
            <NavbarProfile/>
   
            <div class="container">
    <div class="team-single">
        <div class="row">
            <div class="col-lg-4 col-md-5 xs-margin-30px-bottom">
                <div class="team-single-img">
                    <img src="https://www.usr.ro/wp-content/uploads/2021/01/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg" alt=""/>
                </div>
                <div class="bg-light-gray padding-30px-all md-padding-25px-all sm-padding-20px-all text-center">
                    <h4 class="margin-10px-bottom font-size24 md-font-size22 sm-font-size20 font-weight-600">Student</h4>
                    <p class="sm-width-95 sm-margin-auto"></p>
                    <div class="margin-20px-top team-single-icons">
                    </div>
                </div>
            </div>

            <div class="col-lg-8 col-md-7">
                <div class="team-single-text padding-50px-left sm-no-padding-left">
                    <h4 style={{ fontFamily:"-webkit-pictograph"}}class="font-size38 sm-font-size32 xs-font-size30"> Hello,{profileData.username} !</h4>
     
                    <div class="contact-info-section margin-40px-tb">
                        <ul class="list-style9 no-margin">
                            <li>

                                <div class="row">
                                    <div class="col-md-5 col-5">
                                        <i class="fa fa-graduation-cap text-orange"></i>
                                        <strong class="margin-10px-left text-orange">Degree:</strong>
                                    </div>
                                    <div class="col-md-7 col-7">
                                        <p>HighSchool</p>
                                    </div>
                                </div>

                            </li>
                            <li>

                               
                            

                                <div class="row">
                                    <div class="col-md-5 col-5">
                                        <i class="fa fa-heart text-lightred"></i>
                                        <strong class="margin-10px-left text-lightred">Registration number:</strong>
                                    </div>
                                    <div class="col-md-7 col-7">
                                        <p>{profileData.numarMatricol}</p>
                                    </div>
                                </div>

                            </li>
                            <li>

                                <div class="row">
                                    <div class="col-md-5 col-5">
                                        <i class="fa fa-map-marker text-green"></i>
                                        <strong class="margin-10px-left text-green">Address:</strong>
                                    </div>
                                    <div class="col-md-7 col-7">
                                        <p>{profileData.address}</p>
                                    </div>
                                </div>

                            </li>
                            <li>

                                <div class="row">
                                    <div class="col-md-5 col-5">
                                        <i class="fa fa-phone text-purple"></i>
                                        <strong class="margin-10px-left xs-margin-four-left text-purple">Phone:</strong>
                                    </div>
                                    <div class="col-md-7 col-7">
                                        <p>{profileData.phoneNumber}</p>
                                        {/* (+740) 123 456 789 */}
                                    </div>
                                </div>

                            </li>
                            <li>
                                <div class="row">
                                    <div class="col-md-5 col-5">
                                        <i class="fa fa-envelope text-pink"></i>
                                        <strong class="margin-10px-left xs-margin-four-left text-pink">Email:</strong>
                                    </div>
                                    <div class="col-md-7 col-7">
                                        <p><a href="javascript:void(0)">{profileData.email}</a></p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <h5 class="font-size24 sm-font-size22 xs-font-size20">Skills</h5>

                    <div class="sm-no-margin">
                        <div class="progress-text">
                            <div class="row">
                                <div class="col-7">Chemistry</div>
                                <div class="col-5 text-right">40%</div>
                            </div>
                        </div>
                        <div class="custom-progress progress">
                            <div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style={{ width:"40%"}} class="animated custom-bar progress-bar slideInLeft bg-sky"></div>
                        </div>
                        <div class="progress-text">
                            <div class="row">
                                <div class="col-7">Math</div>
                                <div class="col-5 text-right">50%</div>
                            </div>
                        </div>
                        <div class="custom-progress progress">
                            <div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style={{ width:"50%"}} class="animated custom-bar progress-bar slideInLeft bg-orange"></div>
                        </div>
                        <div class="progress-text">
                            <div class="row">
                                <div class="col-7">Biology </div>
                                <div class="col-5 text-right">60%</div>
                            </div>
                        </div>
                        <div class="custom-progress progress">
                            <div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style={{ width:"60%"}} class="animated custom-bar progress-bar slideInLeft bg-green"></div>
                        </div>
                        <div class="progress-text">
                            <div class="row">
                                <div class="col-7">IT</div>
                                <div class="col-5 text-right">80%</div>
                            </div>
                        </div>
                        <div class="custom-progress progress">
                            <div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style={{ width:"80%"}} class="animated custom-bar progress-bar slideInLeft bg-yellow"></div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-md-12">

            </div>
        </div>
    </div>
</div>

            
        </>
    )
}

export default Profile
