<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
</style>

</head>
<body>
 <div>ADD BATCH</div>
         <form action="add_batch_2.jsp" >
       


  <div class="container">
    <h1>ADD BATCH</h1>
    
    <hr>

    <!--  <label for="username"><b>UserName</b></label>
    <input type="text" placeholder="Enter UserName" name="username" id="username" maxlength="16" required>
    <br>
    <label for="pass"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pass" id="pass" maxlength="12" onfocus="check()" required><span id="good"></span><span id="error"></span>
    <br>
    <label for="repass"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="repass" id="repass" required>
    <br> -->
	 <label for="coach_id"><b>Coach_id</b></label>
    <input type="text" placeholder="Enter id" name="coach_id" id="coach_id" required>
    <br> 
	  <label for="time" style='font-weight: bold'>Time</label>
        <input type="text" placeholder="Enter time_slot_id" name="time" id="time" required>     
 <br>
	  
	  <div class="clearfix">	
		<a href='SAMPLE.html'><button type="button" class="cancelbtn" >Cancel</button></a>
      <button type="submit" class="signupbtn" id="next" style='float: right; visibility:visible'  >Next</button>
		  		
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
