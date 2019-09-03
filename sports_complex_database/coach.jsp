<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}
	a {
		color: aliceblue;
		text-decoration: none;
		
	}	

button:hover {
    opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 20%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

table{
		font-size: 250%;
	}
	table,tr,th,td{
		
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
try{
    Connection con=null;
    ResultSet res=null;
    String url1 = "jdbc:mysql://localhost:3306/sportscomplex"; 
    String user = "root";
    String password = "hitpassword";
    
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sportscomplex","root","hitpassword");
    Statement myStmt=con.createStatement();
    Statement myStmt1=con.createStatement();
    Statement myStmt2=con.createStatement();
    res=myStmt.executeQuery("SELECT COUNT(username) FROM COACHING_STAFF WHERE username='"+name+"'and password='"+pass+"'");
    ResultSetMetaData metadata=res.getMetaData();
    int columnCount=metadata.getColumnCount();
    
    int count=0;
   while(res.next())
    {
      int i=1;  
     count=res.getInt(i);
    }  
//    out.println();
//    while(!res.next())
//    {
//     out.println("Hi<br/>");
//    }
    if(count==0)
    {  
       out.println("<br/><h3 style='color: red'>Wrong username/password </h3>");    
    } 
    
    else {
    out.println("Welcome: "+name+" ");
    
    out.println("<center><h2 style='color: green'>You have successfully logged into your account</h2></center>");
    //out.println("<a href='reset_password.jsp'")
    //out.println("<center><a href='SAMPLE.html'><button>LOGOUT</button></a><br><center>");
    out.println("<center><h3 style='color: blue'>Your details are:</h3></center>");
    int id=0;
    String coach_name="0";
    String sport="0";
   // String batch="0";
   int batch=0;
    String stud="none";
    int hrs=0;
    int tslot_id=0;
    int count1=0;
    String str="none";
    String time="0";
    ResultSet res2=myStmt.executeQuery("SELECT * FROM COACHING_STAFF WHERE USERNAME='"+name+"' AND PASSWORD='"+pass+"'");
    while(res2.next()){
    	id=res2.getInt("STAFF_ID");
    	coach_name=res2.getString("NAME");
    	hrs=res2.getInt("WORKING_HRS_PER_DAY");
    	sport=res2.getString("SPORTS_NAME");
    }
   /* String loc_name="0";
    ResultSet resLoc=myStmt.executeQuery("SELECT LOC_NAME FROM LOCATION WHERE LOC_ID="+loc_id);
    while(resLoc.next()){
    	loc_name=resLoc.getString(1);
    }*/
    int sal=0;
   // out.println("hkhiuh");
    ResultSet resSal=myStmt.executeQuery("SELECT SALARY FROM COACHING_STAFF_SAL WHERE SPORTS_NAME='"+sport+"' AND working_hrs_per_day='"+hrs+"'");
    while(resSal.next()){
    	sal=resSal.getInt(1);
    }
    out.println("<center><table><tr><th>ID</th><td>"+id+"</td></tr><tr><th>Name</th><td>"+coach_name+"</td></tr><tr><th>SPORT</th><td>"+sport+"</td></tr><tr><th>Working_hrs</th><td>"+hrs+"</td></tr><tr><th>SALARY</th><td>"+sal+"</td></tr></table>");
    out.println("</center><br>");
    out.println("<center><h3 style='color: blue'>Your batches details are:</h3></center>");
    out.println("<br><center><table><tr><th>Batch</th><th>Students</th><th>Timings</th></tr>");
    ResultSet res4=myStmt.executeQuery("SELECT DISTINCT BATCH_NO FROM BATCH_TIME WHERE STAFF_ID="+id);
    while(res4.next()){
    batch=res4.getInt(1);
    ResultSet res7=myStmt2.executeQuery("SELECT COUNT(STUDENT_NAME) FROM STUDENT WHERE STUDENT_ID IN(SELECT PERSON_ID FROM BATCH WHERE BATCH_NO="+batch+" AND STAFF_ID="+id+")");
    while(res7.next()){
    	count1=res7.getInt(1);
    }
    if(count1!=0){
    ResultSet res6=myStmt1.executeQuery("SELECT STUDENT_NAME FROM STUDENT WHERE STUDENT_ID IN(SELECT PERSON_ID FROM BATCH WHERE BATCH_NO="+batch+" AND STAFF_ID="+id+")");
    while(res6.next()){
    	str=res6.getString(1);
    	if(stud.equals("none")){
    		stud=str;
    	}
    	else
    	stud=stud+", "+str;	
    }
    }
    ResultSet res77=myStmt2.executeQuery("SELECT CONCAT(START_TIME,'--',END_TIME) FROM TIME_SLOT WHERE TIME_SLOT_ID IN(SELECT TIME_SLOT_ID FROM BATCH_TIME WHERE STAFF_ID="+id+" AND BATCH_NO="+batch+")");
    while(res77.next()){
    	time=res77.getString(1);
    }
    out.println("<tr><td>"+batch+"</td><td>"+stud+"</td><td>"+time+"</td></tr>");
    stud="none";
    }
    out.println("</table></center>");
    out.println("<form action='change_coach_details.jsp'><input type='text' name='sec_id' value='"+id+"' style='visibility: hidden; position:fixed' readonly>");
    out.println("<div class='container'><div class='clearfix'>");
    out.println("<a href='SAMPLE.html'><button type='button' class='cancelbtn' >Logout</button></a>");
    out.println("<button type='submit' class='signupbtn' id='next' style='float: right'>Change_details</button>");
    out.println("</form></div></div>");
    
    con.close();
    }
    
}
    catch(SQLException s)
    {
      out.println("OOPS!");
      out.println(s.getMessage());
    }
    
   

%>
		
      
		  		

</body>
</html>