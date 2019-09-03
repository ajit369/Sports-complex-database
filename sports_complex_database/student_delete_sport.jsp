

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
<%
String name=request.getParameter("uname");
String pass=request.getParameter("psw");

%>
 <div>Sign_up</div>
         <form action="student_delete_sport_2.jsp">
       


  <div class="container">
    <h1>DELETE SPORT</h1>
    <p>deleting a sport</p>
    <hr>

	  <p style='font-family: monospace; font-size: 220%;background-color: cyan; width:40%; margin:'><b>Select a sport to delete:</b></p>
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
	  <%out.println("<input type='text' style='visibility:hidden' value='"+name+"' name='uname' > ");
	  out.println("<input type='text' style='visibility:hidden' value='"+pass+"' name='psw' > ");
	  %>
	  <div class="clearfix">	
		<button type="button" class="cancelbtn" ><a href='index.html'>Cancel</a></button>
      <button type="submit" class="signupbtn" id="next" style='float: right; visibility:visible'>DELETE</button>
		  		
    </div>
  </div>
  
</form>

</body>
</html>
