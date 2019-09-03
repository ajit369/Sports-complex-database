

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password],input[type=date] {
    width: 30%;
    padding: 15px;
    margin: 5px 0px 22px 0;
/*    display: inline-block;*/
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus, input[type=date]:focus  {
    background-color: #ddd;
    outline: none;
}

hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}
	a {
		color: aliceblue;
		text-decoration: none;
		
	}	

button:hover {
    opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 20%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}
	select{
		font-size: 150%;
		font-family: fantasy;
		color: blueviolet
	}
	span{
		transform: translateX(40%) translateY(-150%);
		position: fixed;
	}
	#good{
		transform: translateX(40%);
		color: green;
	}
	#error{
		color: red;
	}
	#next{
		visibility: hidden;
	}
	#drink{
		color: maroon;
	}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
</style>

</head>
<body>
 <div>Sign_up</div>
         <form action="add_coach_2.jsp">
       


  <div class="container">
    <h1>COACH SIGNING UP</h1>
    <p>Adding a coach</p>
    <hr>

     <label for="name1"><b>Name</b></label>
    <input type="text" placeholder="Enter UserName" name="name1" id="name1" required>
    <br> 
	  <label for="work" style='font-weight: bold'>Working hrs</label>
      <input type="text" name="work" id="work" required>
	  <br>
	   <label for="ph"><b>Phone numbers &nbsp;</b></label>
    <input type="text" placeholder="Phone number" name="ph1" id="ph1" required>
	<input type="text" placeholder="Alternate number(optional)" name="ph2" id="ph2">  
	  <br>
	  <p style='font-family: monospace; font-size: 220%;background-color: cyan; width:40%; margin:'><b>Sport taught by coach:</b></p>
	  <select name="sport" id="sport">
		  <option value='Cricket'>Cricket</option>
		  <option value='Football'>Football</option>
	      <option value='Badminton'>Badminton</option>
		  <option value='Tennis'>Tennis</option>
		  <option value='Volleyball'>Volleyball</option>
		  <option value='Chess'>Chess</option>
		  <option value='Carroms'>Carroms</option>
		  <option value='TT'>Table-Tennis</option>
		  <option value='Basketball'>Basketball</option>
	  </select>
	  <br>
	  <br>
	    <p style='font-family: monospace; font-size: 220%;background-color:cyan; width:40%; margin:'><b>Choose time-slot:</b></p>
	     <select name="time" id="time">
	  <option value='1'>1</option>
	  <option value='2'>2</option>
	  <option value='3'>3</option>
	  <option value='4'>4</option>
	  <option value='5'>5</option>
	  <option value='6'>6</option>
	  <option value='7'>7</option>
	  <option value='8'>8</option>
	  </select>
	  <br>
	  <br>
	  <div class="clearfix">	
		<button type="button" class="cancelbtn" ><a href='index.html'>Cancel</a></button>
      <button type="submit" class="signupbtn" id="next" style='float: right; visibility:visible'>Sign_up</button>
		  		
    </div>
  </div>
</form>
<script>
//      try{  
//       sum(3,4); 
//      }
//        catch(err){
//           document.getElementById("error").innerHTML=err.message; 
//        }
	
        function check(){
			
       
        document.getElementById('pass').onmouseout=function(){
			
			document.getElementById('repass').onmouseout=function(){
				document.getElementById("next").style.visibility="hidden";
			 var errorMessage= document.getElementById("error");
            errorMessage.innerHTML="";
             document.getElementById("good").innerHTML="";
            var errorToThrow="";
        
			var password=document.getElementById("pass").value;  
        var password2=document.getElementById("repass").value;
			try{
				
                if(password.length<6){
                errorToThrow+="<br> &period; Password too short";
               
                }
                    
            if(/[A-Z]/g.test(password)==false){
                errorToThrow+="<br/> &period;  Password should include atleast one capital letter";
                
            }
                  if(/\d/g.test(password)==false){
                errorToThrow+="<br/> &period;  Password should include atleast one digit";
                      
            }
                if(password!=password2)
                    {errorToThrow+="<br> &period;  Passwords should match.";
                
                    }
                if(errorToThrow!="")    
                {throw errorToThrow;}
                errorToThrow="";
             document.getElementById("good").innerHTML="<br> &period; password is good";
				document.getElementById("next").style.visibility="visible";
            }
            catch(err){
				
                errorMessage.innerHTML=err;
            }
			};
				
		}
		
		}
	function check1(){
		document.getElementById("next").style.visibility="hidden";
			 var errorMessage= document.getElementById("error");
            errorMessage.innerHTML="";
             document.getElementById("good").innerHTML="";
            var errorToThrow="";
        
			var password=document.getElementById("pass").value;  
        var password2=document.getElementById("repass").value;
			try{
				
                if(password.length<6){
                errorToThrow+="<br> &period; Password too short";
               
                }
                    
            if(/[A-Z]/g.test(password)==false){
                errorToThrow+="<br/> &period;  Password should include atleast one capital letter";
                
            }
                  if(/\d/g.test(password)==false){
                errorToThrow+="<br/> &period;  Password should include atleast one digit";
                      
            }
                if(password!=password2)
                    {errorToThrow+="<br> &period;  Passwords should match.";
                
                    }
                if(errorToThrow!="")    
                {throw errorToThrow;}
                errorToThrow="";
             document.getElementById("good").innerHTML="<br> &period; password is good";
				document.getElementById("next").style.visibility="visible";
            }
            catch(err){
				
                errorMessage.innerHTML=err;
            }
	}
    </script>

</body>
</html>
