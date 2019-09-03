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
table{
		font-size: 200%;
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
    Statement myStmt3=con.createStatement();
    Statement myStmt4=con.createStatement();
    res=myStmt.executeQuery("SELECT COUNT(username) FROM ADMINS WHERE username='"+name+"'and password='"+pass+"'");
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
   // out.println("Welcome: "+name+" ");
    
    //out.println("<center><h2 style='color: green'>You have successfully logged into your account</h2></center>");
    //out.println("<a href='reset_password.jsp'")
    //out.println("<center><a href='SAMPLE.html'><button>LOGOUT</button></a><br><center>");
    out.println("<center><h3 style='color: blue'>The sports details are:</h3></center>");
    int id=0;
    String loc_name=null;
    String coach_names="none";
    int fee=0;
    int loc_id=0;
    int check=0;  
    String sport_name=null;
    String str=null;
    ResultSet res2=myStmt.executeQuery("SELECT * FROM SPORTS ");
    out.println("<center><table><tr><th>Sport_name</th><th>Fee_per_month</th><th>Location</th><th>Coaches</th></tr>");
    while(res2.next()){
    	loc_id=res2.getInt("LOC_ID");
    	fee=res2.getInt("FEE_PER_MONTH");
    	loc_id=res2.getInt("LOC_ID");
    	sport_name=res2.getString("SPORTS_NAME");
    	ResultSet res41=myStmt2.executeQuery("SELECT LOC_NAME FROM LOCATION WHERE LOC_ID="+loc_id);
    	while(res41.next()){
    		loc_name=res41.getString("LOC_NAME");
    	}
    	//out.println("Hi<br>");
    	ResultSet res3=myStmt3.executeQuery("SELECT COUNT(STAFF_ID) FROM COACHING_STAFF WHERE SPORTS_NAME IN(SELECT SPORTS_NAME FROM SPORTS WHERE SPORTS_NAME='"+sport_name+"' )");
        while(res3.next()){
        	int a=res3.getInt(1);
        	//out.println("HIIIIII<br>");
        	if(a!=0){
        ResultSet res4=myStmt1.executeQuery("SELECT NAME FROM COACHING_STAFF WHERE SPORTS_NAME IN(SELECT SPORTS_NAME FROM SPORTS WHERE SPORTS_NAME= '"+sport_name+"') ");	     
        while(res4.next()){
               str=res4.getString(1);
        	    if(coach_names.equals("none")) 	   
            	coach_names=str;
                else
                coach_names=coach_names+","+str;
                check++;
               }	
        
        	}	
        	}
        
        out.println("<tr><td>"+sport_name+"</td><td>"+fee+"</td><td>"+loc_name+"</td><td>"+coach_names+"</td></tr>");
        coach_names="none";
    }
    out.println("</table></center>");
    /*String loc_name="0";
    ResultSet resLoc=myStmt.executeQuery("SELECT LOC_NAME FROM LOCATION WHERE LOC_ID="+loc_id);
    while(resLoc.next()){
    	loc_name=resLoc.getString(1);
    }
    int sal=0;
    ResultSet resSal=myStmt.executeQuery("SELECT SEC_SALARY FROM SECURITY_SALARY WHERE LOC_ID="+loc_id+" AND SHIFT='"+shift+"'");
    while(resSal.next()){
    	sal=resSal.getInt(1);
    }
        out.println("</center><br>");
    out.println("<form action='change_sec_details.jsp'><input type='text' name='sec_id' value='"+id+"' style='visibility: hidden; position:fixed' readonly>");
    out.println("<div class='container'><div class='clearfix'>");
    out.println("<a href='SAMPLE.html'><button type='button' class='cancelbtn' >Logout</button></a>");
    out.println("<button type='submit' class='signupbtn' id='next' style='float: right'>Change_details</button>");
    out.println("</form></div></div>");*/
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