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
     out.println("<form action='admin_change_details_sec_delete_last.jsp'>");
     out.println("<h1 style='color: purple'><b>Type a security staff_id to delete</b></h1>");
     out.println("<br><input type='text' name='change_id'>");
     out.println("<input type='text' name='uname' value='"+name+"'style='visibility:hidden'>");
     out.println("<input type='text' name='psw' value='"+pass+"' style='visibility:hidden'>");
     out.println("<br><button type='submit' style='background-color: green'><b>SUBMIT</b></button>");
     out.println("</form>");
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