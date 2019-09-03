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
      <%
      String name=request.getParameter("uname");
      String pass=request.getParameter("psw");
      String sport=request.getParameter("sport");
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
       ResultSet res3=myStmt.executeQuery("SELECT STUDENT_ID FROM STUDENT WHERE USERNAME='"+name+"'");
       while(res3.next()){
    	   id=res3.getInt(1);
       }
       String str1="none";
       int track=0;
       ResultSet res4=myStmt.executeQuery("select DISTINCT SPORTS_NAME FROM COACHING_STAFF WHERE STAFF_ID IN(SELECT STAFF_ID FROM BATCH WHERE PERSON_ID="+id+")" );
    	while(res4.next()){
    		str1=res4.getString(1);
    		if(str1.equals(sport)){
    			count=1;
    		}
    		track++;
    	}
    	if(count==0){
    		out.println("<center><h1>YOUU ARE NOT REGISTERED TO THAT SPORT</h1></center>");
    	}
    	else{
    	
    		myStmt.executeUpdate("DELETE FROM BATCH WHERE PERSON_ID="+id+" AND STAFF_ID IN(SELECT STAFF_ID FROM COACHING_STAFF WHERE SPORTS_NAME='"+sport+"')");	
    	 out.println("<center><h1 id='suc'><center>Successfully updated your data</center></h1></center>");
    	}
    	
    	if(track<=1){
    		myStmt.executeUpdate("DELETE FROM STUDENT WHERE STUDENT_ID="+id);
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