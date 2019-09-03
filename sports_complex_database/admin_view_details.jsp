<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 25%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
<body>
 <%

String name=request.getParameter("uname");
String pass=request.getParameter("psw");
%> 
<div class='container'>
<div class="clearfix">
      <form action='admin_view_details_sports.jsp'>	
		<center><button type="submit" class="signupbtn" >SPORTS</button><br>
        <%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
        </center>
        </form>
      <br>
       <form action='admin_view_details_person.jsp'>	
		<center><button type="submit" class="signupbtn" >SPORTS_MEN</button><br>
        <%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
        </center>
        </form>
      <br>
       <form action='admin_view_details_stud.jsp'>
      <center><button type="submit" class="signupbtn" id="next">STUDENT</button></center>
		<%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
		
		</form>
		<br>
      <form action='admin_view_details_timings.jsp'>
      <center><button type="submit" class="signupbtn" id="next">TIMESLOT</button></center>
		<%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
		
		</form>
		<br>
		 <form action='admin_view_details_staff.jsp'>
      <center><button type="submit" class="signupbtn" id="next">COACHING_STAFF</button></center>
		<%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
		
		</form>
		<br>
		 <form action='admin_view_details_maintenance.jsp'>
      <center><button type="submit" class="signupbtn" id="next">MAINTENANCE_STAFF</button></center>
		<%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
		
		</form>
		<br>   		
		 <form action='admin_view_details_sec.jsp'>
      <center><button type="submit" class="signupbtn" id="next">SECURITY</button></center>
		<%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
		
		</form>
		<br>
    </div></div>
    <%
    out.println("<a href='SAMPLE.html'><h4>Go back to previous page</h4></a>"); 
     %>
 </body>
</html>