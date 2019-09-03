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
       

//response.setContentType("text/html;charset=UTF-8");

       String name=request.getParameter("username");
       String pass=request.getParameter("pass");
       String repass=request.getParameter("repass");
       String name1=request.getParameter("name1");
       String dob=request.getParameter("dob");
       String gender=request.getParameter("gender");
       String phone=request.getParameter("phone");
       String sport=request.getParameter("sport");
      //  out.println("Phone is "+phone);
       //out.println("<br/><br/>");
       try{
       Connection con=null;
       ResultSet res=null;
       String url1 = "jdbc:mysql://localhost:3306/sportscomplex"; 
       String user = "root";
       String password = "hitpassword";
       con = DriverManager.getConnection(url1, user, password);
       con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sportscomplex","root","hitpassword");
       Statement myStmt=con.createStatement();
       res=myStmt.executeQuery("SELECT COUNT(username) FROM STUDENT WHERE username='"+name+"'");
       ResultSetMetaData metadata=res.getMetaData();
       int columnCount=metadata.getColumnCount();
       
       int count=0;
      while(res.next())
       {
         int i=1;  
        count=res.getInt(i);
       }  
//       out.println();
//       while(!res.next())
//       {
//        out.println("Hi<br/>");
//       }
       if(count!=0||!pass.equals(repass))
       {
          
          if(count!=0)
          out.println("<br/><center><h1 style='color: red;font-size:200%'>A person with that particular username already exists..</h1> + <br><br> <h3><a href='stud_signup.html'>Go back to login page</a></h3></center>");
          
          else
          out.println("<br/><h3 style='color: red'>Password mismatch</h3>");    
       } 
       
       else {
       out.println("Welcome: "+name);
       ResultSet res1=myStmt.executeQuery("SELECT FEE_PER_MONTH FROM SPORTS WHERE SPORTS_NAME='"+sport+"'");
       int a=0;
       while(res1.next())
       {
    	   a=Integer.parseInt(res1.getString(1));
       }
       ResultSet restemp=myStmt.executeQuery("SELECT MAX(STUDENT_ID) FROM STUDENT");
       int t1=0;
       while(restemp.next()){
    	   t1=restemp.getInt(1);
       }
       t1++;
       out.println(t1);
       myStmt.executeUpdate("INSERT INTO STUDENT(STUDENT_ID,PARENT_PHNO,DOB,FEE_PER_MONTH,USERNAME,PASSWORD,STUDENT_NAME,GENDER) VALUES ('"+t1+"','"+phone+"','"+dob+"','"+a+"','"+name+"','"+pass+"','"+name1+"','"+gender+"')");
     //  out.println("Hi it is executed");
       ResultSet res2=myStmt.executeQuery("SELECT Staff_id,NAME FROM COACHING_STAFF WHERE SPORTS_NAME='"+sport+"'");
       out.println("<center><h1 style='text-decoration:underline'><b>COACHES AVAILABLE(WITH THEIR ID'S) ARE</b></h1></center>");
       out.println("<form action='stud_batch.jsp'>");
       while(res2.next())
       {
    	   
    	   out.println("<br>");
    	   out.println("<center><label><input type='radio' name='coach' value='"+res2.getString("Staff_id")+"' checked><b>"+res2.getString("NAME")+"</b>&nbsp;&nbsp;"+res2.getString("STAFF_ID")+"</label></center>");
    	   
       } 
       out.println("<br><br><br>");
       out.println("<h2><button style='float:right' type='submit'><i>NEXT</i></button></h2></form>");
       out.println("<br/>Succesfully created your account<br/>");
       out.println("<a href='index.html'>Go back to home page</a>");
      con.close();
       }}
       catch(SQLException s)
       {
         out.println("OOPS!");
         out.println(s.toString());
       }
       
%>
</body>
</html>