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
	<h1 id='suc'><center>You have successfully signed a maintenance_staff!!!</center></h1>
	
</center>
      <%
      int batch=Integer.parseInt(request.getParameter("batch"));
      int time=Integer.parseInt(request.getParameter("time"));
      int coach_id=Integer.parseInt(request.getParameter("coach_id"));
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
      // String pass=name1+rand.nextInt(6000);
       int check1=0;
       int check2=0;
       ResultSet res11=myStmt.executeQuery("SELECT COUNT(STAFF_ID) FROM BATCH_TIME WHERE STAFF_ID="+coach_id+" AND  TIME_SLOT_ID="+time);
       while(res11.next()){
    	   check1=res11.getInt(1);
       }
        res11=myStmt.executeQuery("SELECT COUNT(STAFF_ID) FROM BATCH_TIME WHERE STAFF_ID="+coach_id+" AND  BATCH_NO="+batch);
       while(res11.next()){
    	   check2=res11.getInt(1);
       }
       if(check1!=0||check2==0)
       {
    	   out.println("<center><h1 style='color:red'>The coach is not there (or) the batch is not there (or) he/she has a batch already in that timing</h1></center>");
       } 
       else{
    	myStmt.executeUpdate("UPDATE BATCH_TIME SET TIME_SLOT_ID="+time+" WHERE BATCH_NO="+batch+" AND STAFF_ID="+coach_id);   
       }}
       catch(SQLException s)
       {
         out.println("OOPS!");
         out.println(s.toString());
       }
%>

      
</body>
</html>