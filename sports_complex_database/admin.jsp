<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

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
  width: 20%;
}

</style>
</head>
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
    con = DriverManager.getConnection(url1, user, password);
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sportscomplex","root","hitpassword");
    Statement myStmt=con.createStatement();
    res=myStmt.executeQuery("SELECT COUNT(username) FROM ADMINS WHERE username='"+name+"'and password='"+pass+"'");
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
       out.println("<br/><h1 style='color: red'>Wrong Password </h1>");    
    } 
    
    else {
    out.println("Welcome: "+name+" "+pass);
    
    out.println("<br/><h1 style='color:green'>Succesfully logged in into your account</h1>");
    out.println("<center><h3><style='font-family:monospace'><i>What do you want to do?</i></h3></center>");
    %>
    <div class="clearfix">
      <form action='admin_view_details.jsp'>	
		<center><button type="submit" class="cancelbtn" >SHOW DATA</button><br>
        <%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
        </center>
        </form>
      <br>
      
      <form action='admin_change_details.jsp'>
      <center><button type="submit" class="signupbtn" id="next">CHANGE DATA</button></center>
		<%
        out.println("<input type='text' name='uname' value='"+name+"' style='visibility:hidden'>");
        out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
        %>
		
		</form>   		
    </div>
    <%
    out.println("<h4><a href='SAMPLE.html' style='color:purple'>Go back to home page</a></h4>");
   con.close();
    }}
    catch(SQLException s)
    {
      out.println("OOPS!");
      out.println(s.getMessage());
    }
    


%>

</body>
</html>
