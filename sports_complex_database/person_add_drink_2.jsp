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
	
	
</center>
      <%
      String name=request.getParameter("uname");
      String pass=request.getParameter("psw");
      String drink=request.getParameter("drink");
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
       int id=0,count=0,fee=0;
       ResultSet res3=myStmt.executeQuery("SELECT PERSON_ID FROM SPORTS_PERSON WHERE USERNAME='"+name+"'");
       while(res3.next()){
    	   id=res3.getInt(1);
       }
       ResultSet res4=myStmt.executeQuery("select count(*) from SUPPLIES_DRINK where person_id="+id+" AND DNAME='"+drink+"'");
    	while(res4.next()){
    		count=res4.getInt(1);
    	}
    	if(count!=0){
    		out.println("<center><h1>YOU HAVE ALREADY ADDED THAT DRINK</h1></center>");
    	}
    	else{
    		myStmt.executeUpdate("insert into SUPPLIES_DRINK values ('"+drink+"',"+id+")");
    		//ResultSet res5=myStmt.executeQuery("SELECT SUM(FEE_PER_MONTH) FROM SPORTS WHERE SPORTS_NAME IN(SELECT SPORTS_NAME FROM PLAYS WHERE PERSON_ID="+id+")");
    	//	while(res5.next()){
    		//	fee=res5.getInt(1);
    		//}
    		//myStmt.executeUpdate("update sports_person set status='pending' where person_id="+id);
    		 out.println("<center><h1 id='suc'><center>Successfully updated your data</center></h1></center>");
    	}
    	
       }
       catch(SQLException s)
       {
         out.println("OOPS!");
         out.println(s.toString());
       }
%>

      
</body>
</html>