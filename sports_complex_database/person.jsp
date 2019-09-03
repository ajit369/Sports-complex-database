<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
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
try{
    Connection con=null;
    ResultSet res=null;
    String url1 = "jdbc:mysql://localhost:3306/sportscomplex"; 
    String user = "root";
    String password = "hitpassword";
    out.println(name);
    out.println(pass);
    
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sportscomplex","root","hitpassword");
    Statement myStmt=con.createStatement();
    Statement myStmt1=con.createStatement();
    Statement myStmt2=con.createStatement();
    res=myStmt.executeQuery("SELECT COUNT(username) FROM SPORTS_PERSON WHERE username='"+name+"' and password='"+pass+"'");
    ResultSetMetaData metadata=res.getMetaData();
    int columnCount=metadata.getColumnCount();
    
    int count=0;
   while(res.next())
    {
      int i=1;  
     count=res.getInt(i);
    }  
//    out.println();
//    while(!res.next())
//    {
//     out.println("Hi<br/>");
//    }
    if(count==0)
    {  
       out.println("<br/><h3 style='color: red'>Wrong username/password </h3>");    
    } 
    
    else {
    out.println("Welcome: "+name+" ");
    
    out.println("<center><h2 style='color: green'>You have successfully logged into your account</h2></center>");
    }}
catch(SQLException s)
{
  out.println("OOPS!");
  out.println(s.getMessage());
}


%> 
<div class='container'>
<div class="clearfix">
      
       <form action='person_add_sport.jsp'>
      <center><button type="submit" class="signupbtn" id="next" style='background-color: blue'>ADD SPORT</button></center>
		<%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
		
		</form>
		
		<br>
      
       <form action='person_delete_sport.jsp'>	
		<center><button type="submit" class="cancelbtn">DELETE SPORT</button><br>
        <%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
        </center>
        </form>
      <br>
      
		<br>   		
		 <form action='person_add_drink.jsp'>
      <center><button type="submit" class="signupbtn" id="next" style='background-color:blue'>ADD DRINK</button></center>
		<%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
		
		</form>
		<br>   		
		 <form action='person_delete_drink.jsp'>
      <center><button type="submit" class="cancelbtn" id="next">DELETE DRINK</button></center>
		<%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
		
		</form>
		<br>
		 <form action='person_see_details.jsp'>
      <center><button type="submit" class="signupbtn" id="next" style='background-color:blue'>DETAILS</button></center>
		<%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
		
		</form>
		<br>
    </div></div>
    <%
    out.println("<a href='SAMPLE.html'><h4>Go back to home page</h4></a>"); 
     %>
 </body>
</html>