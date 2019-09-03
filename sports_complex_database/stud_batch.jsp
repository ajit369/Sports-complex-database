<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
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
       

//response.setContentType("text/html;charset=UTF-8");
       String coach=request.getParameter("coach");
       int id=Integer.parseInt(coach);
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
       out.println("<center><h1 style='textDecoration:underline'>Available timings are:</h1><form action='stud_signup_last.jsp'>");
       ResultSet res3=myStmt.executeQuery("SELECT MAX(STUDENT_ID) FROM STUDENT");
       int stud_id=0;
       while(res3.next())
       {
    	   stud_id=res3.getInt(1);
       }
      res3=myStmt.executeQuery("SELECT COUNT(*) FROM COACHES WHERE PERSON_ID="+stud_id+" AND STAFF_ID="+id);
      int cnt=0;
      while(res3.next())
      {
   	   cnt=res3.getInt(1);
      }
      if(cnt==0)
      {
    	  myStmt.executeUpdate("INSERT INTO COACHES VALUES('"+stud_id+"','"+id+"',NOW())");
      } 
      ResultSet res1=myStmt.executeQuery("SELECT * FROM TIME_SLOT WHERE TIME_SLOT_ID IN(SELECT TIME_SLOT_ID FROM BATCH_TIME WHERE STAFF_ID="+id+")");
       while(res1.next())
       {
    	   out.println("<br>");
    	   out.println("<label><input type='radio' value='"+res1.getString("TIME_SLOT_ID")+"' name='start' checked>"+res1.getString("start_time")+"--"+res1.getString("end_time")+"</label>");
    	   
    	   
    	   //out.println("<label><input type='radio' value='"+res1.getString("start_time")+"' name='start'></label>");
    	   //out.println("<label><input type='radio' value='"+res1.getString("start_time")+"' name='start'></label>");
       }
       
       out.println("<button type='text' size='40px' style='float:right' type='submit'>NEXT</button></center>");
       out.println("<input type='text' name='coach_id' value="+id+" style='visibility: hidden' readonly></form>");
       }
       catch(SQLException s)
       {
         out.println("OOPS!");
         out.println(s.toString());
       }
%>

</body>
</html>