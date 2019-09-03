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
input[type=text], input[type=password] {
    width: 20%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
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
    width: 20%;
    opacity: 0.9;
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
  width: 50%;
}
.signupbtn{
float: right;
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

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
span{
		transform: translateX(40%) translateY(-150%);
		position: fixed;
	}
	#good{
		transform: translateX(50%);
		color: green;
	}
	#error{
	transform: translateX(80%);
		color: red;
	}
	#next{
		visibility: hidden;
	}
</style>

</head>
<body>

         <form action="change_sec_details_last.jsp">
  <div class="container">
    <h1>Change details</h1>
    <p>Please type the new username/password</p><span id="error"></span>
    <hr>

    <label for="username"><b>UserName</b></label>
    <input type="text" placeholder="Enter UserName" name="username" required>
      <br>
    <label for="pass"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pass" id="pass" onfocus="check()" required>
    <span id="good"></span>
    <br>
    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="repass" id="repass" required>
     <br>
     <br>
     <br>
    <div class="clearfix">
      <button type="button" class="cancelbtn">Cancel</button>
      <button type="submit" class="signupbtn" id="next">Sign Up</button>
    </div>
  </div>
<%
int sec_id=Integer.parseInt(request.getParameter("sec_id"));
//out.println("<label for='sec_id'>Changing details for security with security_id </label>");
out.println("<input type='text' name='sec_id' value='"+sec_id+"' style='visibility:hidden;position:fixed' readonly>");    		

%>
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