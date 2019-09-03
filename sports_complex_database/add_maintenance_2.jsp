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
    String name1=request.getParameter("name1");
      int work=Integer.parseInt(request.getParameter("work"));
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
       String pass=name1+rand.nextInt(6000);
       myStmt.executeUpdate("Insert INTO MAINTENANCE_STAFF(M_NAME,WORKING_HRS_PER_DAY,LOC_ID,USERNAME,PASSWORD) VALUES('"+name1+"',"+work+","+loc_id+",'"+pass+"','"+pass+"')");       
       int count=0;
       ResultSet res22=myStmt.executeQuery("SELECT COUNT(*) FROM MAINTENANCE_STAFF_SAL WHERE WORKING_HRS_PER_DAY="+work+" AND LOC_ID="+loc_id);
       while(res22.next()){
    	   count=res22.getInt(1);
    	   
       }
       if(count==0){
    	   myStmt.executeUpdate("INSERT INTO MAINTENANCE_STAFF_SAL(LOC_ID,WORKING_HRS_PER_DAY) VALUES("+loc_id+","+work+")");
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