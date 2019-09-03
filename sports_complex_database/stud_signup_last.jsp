<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
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
	<h1 id='suc'> You have succesfully signed up!!!</h1>
	<h1>Here are your details:</h1>
</center>
      <%
       

//response.setContentType("text/html;charset=UTF-8");
       int tslot_id=Integer.parseInt(request.getParameter("start"));
       int coach_id=Integer.parseInt(request.getParameter("coach_id"));
       //out.println("<br/><br/>");
       try{
       Connection con=null;
       ResultSet res=null;
       String url1 = "jdbc:mysql://localhost:3306/sportscomplex"; 
       String user = "root";
       String password = "hitpassword";
       /*con = DriverManager.getConnection(url1, user, password);*/
       con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sportscomplex","root","hitpassword");
       Statement myStmt=con.createStatement();
    //   res=myStmt.executeQuery("SELECT COUNT(username) FROM STUDENT WHERE username='"+name+"'");
      // ResultSetMetaData metadata=res.getMetaData();
       //int columnCount=metadata.getColumnCount();
       ResultSet res3=myStmt.executeQuery("SELECT MAX(STUDENT_ID) FROM STUDENT");
       int stud_id=0;
       while(res3.next())
       {
    	   stud_id=res3.getInt(1);
       }
       int b_no=0;
       String name="0";
       ResultSet resName=myStmt.executeQuery("SELECT STUDENT_NAME FROM STUDENT WHERE STUDENT_ID="+stud_id);
       while(resName.next()){
    	   name=resName.getString(1);
       }
       String loc_name="0";
       ResultSet resLoc=myStmt.executeQuery("SELECT LOC_NAME FROM LOCATION WHERE LOC_ID IN(SELECT LOC_ID FROM SPORTS WHERE SPORTS_NAME IN(SELECT SPORTS_NAME FROM COACHING_STAFF WHERE STAFF_ID="+coach_id+"))");
       while(resLoc.next()){
    	   loc_name=resLoc.getString(1);
       }
       String sports_name="0";
       ResultSet resSport=myStmt.executeQuery("SELECT SPORTS_NAME FROM COACHING_STAFF WHERE STAFF_ID="+coach_id);
       while(resSport.next()){
    	   sports_name=resSport.getString(1);
       }
       String coach_name="0";
       ResultSet resCoach=myStmt.executeQuery("SELECT NAME FROM COACHING_STAFF WHERE STAFF_ID="+coach_id);
       while(resCoach.next()){
    	   coach_name=resCoach.getString(1);
       }
       res3=myStmt.executeQuery("SELECT BATCH_NO FROM BATCH_TIME WHERE STAFF_ID="+coach_id+" AND TIME_SLOT_ID="+tslot_id);
       while(res3.next())
       {
    	   b_no=res3.getInt(1);
       }
              myStmt.executeUpdate("INSERT INTO BATCH VALUES ("+stud_id+","+b_no+","+coach_id+")");
       out.println("<center><h1 style='color: green'>CONGRATULATIONS! You have successfully signed_up for the sports_complex</h1></center>");
       String time="0";
    		   ResultSet res4=myStmt.executeQuery("SELECT * FROM TIME_SLOT WHERE TIME_SLOT_ID="+tslot_id);
      while(res4.next()){
    	  time=res4.getString("START_TIME")+"--"+res4.getString("END_TIME");
    	  
      }
      int fee=0;
      ResultSet myRes=myStmt.executeQuery("SELECT FEE_PER_MONTH FROM SPORTS WHERE SPORTS_NAME='"+sports_name+"'");
      while(myRes.next()){
    	  fee=myRes.getInt(1);
      }
      myStmt.executeUpdate("UPDATE STUDENT SET STATUS='Pending' WHERE STUDENT_ID="+stud_id);
      res3=myStmt.executeQuery("SELECT BATCH_NO FROM BATCH_TIME WHERE STAFF_ID="+coach_id+" AND TIME_SLOT_ID="+tslot_id);
      
      while(res3.next())
      {
   	   b_no=res3.getInt(1);
   	   out.println("<center><table><tr><th>Student_name</th><td>"+name+"</td></tr><tr><th>Sport</th><td>"+sports_name+"</td></tr><tr><th>Location</th><td>"+loc_name+"</td></tr><tr><th>Coach</th><td>"+coach_name+"</td></tr><tr><th>Batch no</th><td>"+b_no+"</td></tr><tr><th>Timings</th><td>"+time+"</td></tr><tr><th>Fee</th><td>"+fee+"</td></tr></table></center>");
   	   		
      }
            out.println("<br><br><a href='SAMPLE.html'>Go back to home page</a>");
       }
       catch(SQLException s)
       {
         out.println("OOPS!");
         out.println(s.toString());
       }
%>

      
</body>
</html>