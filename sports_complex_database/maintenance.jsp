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
try{
    Connection con=null;
    ResultSet res=null;
    String url1 = "jdbc:mysql://localhost:3306/sportscomplex"; 
    String user = "root";
    String password = "hitpassword";
    
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sportscomplex","root","hitpassword");
    Statement myStmt=con.createStatement();
    res=myStmt.executeQuery("SELECT COUNT(username) FROM MAINTENANCE_STAFF WHERE username='"+name+"'and password='"+pass+"'");
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
    String sec_name="0";
    int working_hrs=0;
    int loc_id=0;
    ResultSet res2=myStmt.executeQuery("SELECT * FROM MAINTENANCE_STAFF WHERE USERNAME='"+name+"' AND PASSWORD='"+pass+"'");
    while(res2.next()){
    	id=res2.getInt("M_ID");
    	sec_name=res2.getString("M_NAME");
    	loc_id=res2.getInt("LOC_ID");
    	working_hrs=res2.getInt("working_hrs_per_day");
    }
    String loc_name="0";
    ResultSet resLoc=myStmt.executeQuery("SELECT LOC_NAME FROM LOCATION WHERE LOC_ID="+loc_id);
    while(resLoc.next()){
    	loc_name=resLoc.getString(1);
    }
    int sal=0;
    ResultSet resSal=myStmt.executeQuery("SELECT M_SALARY FROM maintenance_staff_sal WHERE LOC_ID="+loc_id+" AND WORKING_HRS_PER_DAY='"+working_hrs+"'");
    while(resSal.next()){
    	sal=resSal.getInt(1);
    }
    out.println("<center><table><tr><th>ID</th><td>"+id+"</td></tr><tr><th>Name</th><td>"+sec_name+"</td></tr><tr><th>Location ID</th><td>"+loc_id+"</td></tr><tr><th>Location</th><td>"+loc_name+"</td></tr><tr><th>Working Hrs</th><td>"+working_hrs+"</td></tr><tr><th>Salary</th><td>"+sal+"</td></tr></table>");
    out.println("</center><br>");
    out.println("<form action='change_maintenance.jsp'><input type='text' name='sec_id' value='"+id+"' style='visibility: hidden; position:fixed' readonly>");
    out.println("<div class='container'><div class='clearfix'>");
    out.println("<a href='SAMPLE.html'><button type='button' class='cancelbtn' >Logout</button></a>");
    out.println("<button type='submit' class='signupbtn' id='next' style='float: right'>Change_details</button>");
    out.println("</form></div></div>");
    con.close();
    }}
    catch(SQLException s)
    {
      out.println("OOPS!");
      out.println(s.getMessage());
    }
    
   

%>
		

</body>
</html>