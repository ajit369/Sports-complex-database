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
      int time=Integer.parseInt(request.getParameter("time"));
      String sport=request.getParameter("sport");
      String ph1=request.getParameter("ph1");
      String ph2=request.getParameter("ph2");
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
       myStmt.executeUpdate("Insert INTO COACHING_STAFF(NAME,SPORTS_NAME,WORKING_HRS_PER_DAY,USERNAME,PASSWORD) VALUES ('"+name1+"','"+sport+"',"+work+",'"+pass+"','"+pass+"')");       
       int batch=1;
       int staff_id=0;
       ResultSet res1=myStmt.executeQuery("SELECT STAFF_ID FROM COACHING_STAFF WHERE USERNAME='"+pass+"'");
       while(res1.next()){
    	   staff_id=res1.getInt(1);
       }
       out.println(staff_id);
       myStmt.executeUpdate("INSERT INTO BATCH_TIME VALUES ("+batch+","+staff_id+","+time+")");
       int count=0;
       ResultSet res5=myStmt.executeQuery("SELECT COUNT(*) FROM COACHING_STAFF_SAL WHERE WORKING_HRS_PER_DAY="+work+" AND SPORTS_NAME='"+sport+"'");
       while(res5.next()){
    	   count=res5.getInt(1);
       }
       if(count==0){
    	   myStmt.executeUpdate("INSERT INTO COACHING_STAFF_SAL(SPORTS_NAME,WORKING_HRS_PER_DAY) VALUES('"+sport+"',"+work+")");
       }
       myStmt.executeUpdate("insert into COACHING_STAFF_PHNO VALUES('"+ph1+"',"+staff_id+")");
       if(ph2!=null)
       {
      	 myStmt.executeUpdate("insert into COACHING_STAFF_PHNO VALUES('"+ph2+"',"+staff_id+")");
       }
      // out.println("<center><h1 style='color:green'><i>SUCCESSFULLY ADDED COACHING_STAFF!!!</i></h1></center>");
       out.println("<br><br><a href='SAMPLE.html'><h4>Go back to home page</h4></a>"); 
       }
       catch(SQLException s)
       {
         out.println("OOPS!");
         out.println(s.toString());
       }
%>

      
</body>
</html>