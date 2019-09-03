<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	#suc{
		color: green;
		font-family: monospace;
		font-size: 300% ;
	}
	body{
		
		background: linear-gradient(to right,cyan,azure 60%);
	}
	table{
		font-size: 250%;
	}
	table,tr,th{
		
		border-color: darkblue;
		border-style: double;
		border-collapse: collapse;
	}
	td{
	color: purple;
	}
	
	</style>

</head>
<body>
<center>
	<h1 id='suc'><center>You have successfully signed a security_staff!!!</center></h1>
	
</center>
      <%
    String name1=request.getParameter("name1");
      String work=request.getParameter("work");
      int loc_id=Integer.parseInt(request.getParameter("loc_id"));
//response.setContentType("text/html;charset=UTF-8");
       //out.println("<br/><br/>");
       try{
       Connection con=null;
       ResultSet res=null;
       String url1 = "jdbc:mysql://localhost:3306/sportscomplex"; 
       String user = "root";
       String password = "hitpassword";
       con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sportscomplex","root","hitpassword");
       Statement myStmt=con.createStatement();
       Random rand=new Random(); 
       String pass=name1+rand.nextInt(7000);
       out.println(pass);
       myStmt.executeUpdate("Insert INTO SECURITY(SEC_NAME,SHIFT,LOC_ID,USERNAME,PASSWORD) VALUES('"+name1+"','"+work+"',"+loc_id+",'"+pass+"','"+pass+"')");       
      
       int count=0;      
       }
       catch(SQLException s)
       {
         out.println("OOPS!");
         out.println(s.toString());
       }
%>      
</body>
</html>