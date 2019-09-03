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
select{
transform: translate(200px);
}
.d1{
transform: scale(1.5);
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
     out.println("<center><form action='admin_change_status_person_2.jsp'>");
     out.println("<h1 style='color: purple'><b>Type a person_id to change status</b></h1>");
     out.println("<div name='d1'><br><input type='text' name='change_id'>");
     out.println("<h1 style='color: purple'><b>STATUS:</b></h1>");
     out.println("<select name='status'>");
     out.println("<option value='Paid'>Paid</option>");
     out.println("<option value='pending'>Pending</option>");
     out.println("</select>");
     out.println("<input type='text' name='uname' value='"+name+"'style='visibility:hidden'>");
     out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
     out.println("<br><br><br><button type='submit' style='background-color: blue; color:white' width='30 px'><b>SUBMIT</b></button>");
     out.println("</div></form></center>");
     con.close();
}
    catch(SQLException s)
    {
      out.println("OOPS!");
      out.println(s.getMessage());
    }
    

%>
  
</body>
</html>