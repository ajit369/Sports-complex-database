<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
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

String name=request.getParameter("username");
String pass=request.getParameter("pass");
String sec_id=request.getParameter("sec_id");
try{
    Connection con=null;
    ResultSet res=null;
    String url1 = "jdbc:mysql://localhost:3306/sportscomplex"; 
    String user = "root";
    String password = "hitpassword";
    
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sportscomplex","root","hitpassword");
    Statement myStmt=con.createStatement();
    res=myStmt.executeQuery("SELECT COUNT(username) FROM SECURITY WHERE username='"+name+"'and password='"+pass+"' AND SEC_ID<>"+sec_id);
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
    if(count!=0)
    {  
       out.println("<br/><center><h1 style='color: red'>OOPS! This username already exists</h1></center>");
    } 
    else {
    	out.println("sec_id is "+sec_id);
    	out.println("<br>username is"+name);
    	out.println("<br>password is"+pass);
    myStmt.executeUpdate("UPDATE SECURITY SET USERNAME='"+name+"',PASSWORD='"+pass+"' WHERE SEC_ID="+sec_id);
    out.println("<center><h1 style='color:green; font-family:sans-serif'>Successfully updated your data</h1></center>");
    out.println("<br>");
    out.println("<a href='security.jsp'>Go back to home page</a>");
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