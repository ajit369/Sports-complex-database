<%@page import="java.sql.SQLException"%>
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
<title>Person signup_final</title>
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
       

//response.setContentType("text/html;charset=UTF-8");

       String name=request.getParameter("username");
       String pass=request.getParameter("pass");
       String repass=request.getParameter("repass");
       String name1=request.getParameter("name1");
       String dob=request.getParameter("dob");
       String gender=request.getParameter("gender");
       String phone1=request.getParameter("ph1");
       String sport=request.getParameter("sport");
       String phone2=request.getParameter("ph2");
       String drink=request.getParameter("drink");
       
       
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
       res=myStmt.executeQuery("SELECT COUNT(username) FROM SPORTS_PERSON WHERE username='"+name+"'");
      
       
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
       ResultSet restemp=myStmt.executeQuery("SELECT MAX(person_id) FROM SPORTS_PERSON");
       int t1=0;
       while(restemp.next()){
    	   t1=restemp.getInt(1);
       }
       t1++;
       out.println(t1);
       myStmt.executeUpdate("INSERT INTO SPORTS_PERSON(PERSON_ID,DOB,USERNAME,PASSWORD,NAME,GENDER,STATUS) VALUES ('"+t1+"','"+dob+"','"+name+"','"+pass+"','"+name1+"','"+gender+"','pending')");
    //  out.println("Hi it is executed");
     myStmt.executeUpdate("insert into sports_person_phno VALUES('"+phone1+"',"+t1+")");
     if(phone2!=null)
     {
    	 myStmt.executeUpdate("insert into sports_person_phno VALUES('"+phone2+"',"+t1+")");
     }
    // out.println(drink);
     if(!drink.equals("none"))
     {
    	 //out.println("Hello");
    	 myStmt.executeUpdate("INSERT INTO SUPPLIES_DRINK VALUES('"+drink+"',"+t1+")");
     }
     int loc_id=0;
     ResultSet resLoc=myStmt.executeQuery("SELECT LOC_ID FROM SPORTS WHERE SPORTS_NAME='"+sport+"'");
     while(resLoc.next()){
    	 loc_id=resLoc.getInt(1);
     }
     String loc_name="0";
     resLoc=myStmt.executeQuery("SELECT LOC_NAME FROM LOCATION WHERE LOC_ID ="+loc_id);
     while(resLoc.next()){
    	 loc_name=resLoc.getString(1);
     }
     int cost=0;
     if(!drink.equals("none")){
     
    	 ResultSet resCost=myStmt.executeQuery("SELECT COST FROM DRINKS WHERE DNAME='"+drink+"'");
     
     
     while(resCost.next()){
    	 cost=resCost.getInt(1);
     }
     }
     myStmt.executeUpdate("INSERT INTO PLAYS VALUES('"+sport+"',"+t1+")");
     //ResultSet res2=myStmt.executeQuery("SELECT Staff_id,NAME FROM COACHING_STAFF WHERE SPORTS_NAME='"+sport+"'");
       //out.println("<center><h1 style='text-decoration:underline'><b>COACHES AVAILABLE(WITH THEIR ID'S) ARE</b></h1></center>");
       //out.println("<form action='stud_batch.jsp'>");
       //hile(res2.next())
       //{
    	   
    	  // out.println("<br>");
    	 //  out.println("<center><label><input type='radio' name='coach' value='"+res2.getString("Staff_id")+"' checked><b>"+res2.getString("NAME")+"</b>&nbsp;&nbsp;"+res2.getString("STAFF_ID")+"</label></center>");
    	   
       //} 
       //out.println("<br><br><br>");
       //out.println("<h2><button style='float:right' type='submit'><i>NEXT</i></button></h2></form>");
       //out.println("<br/>Succesfully created your account<br/>");
       //out.println("<a href='index.html'>Go back to home page</a>");
       out.println("<center><h1 style='color: green'>CONGRATULATIONS! You have successfully signed_up for the sports_complex</h1></center>");
      if(!drink.equals("none"))
       out.println("<center><table><tr><th>Name</th><td>"+name1+"</td></tr><tr><th>Sport</th><td>"+sport+"</td></tr><tr><th>Location</th><td>"+loc_name+"</td></tr><tr><th>Drink</th><td>"+drink+"</td></tr><tr><th>Drink_cost</th><td>"+cost+"</td></tr><tr><th>Fee</th><td>"+a+"</td></tr></table></center>");
       else
    	   out.println("<center><table><tr><th>Name</th><td>"+name1+"</td></tr><tr><th>Sport</th><td>"+sport+"</td></tr><tr><th>Location</th><td>"+loc_name+"</td></tr><tr><th>Drink</th><td>"+drink+"</td></tr><tr><th>Fee</th><td>"+a+"</td></tr></table></center>");	   
    out.println("<br><br><a href='SAMPLE.html'>Go back to home page</a>");
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