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
    Statement myStmt5=con.createStatement();
    res=myStmt.executeQuery("SELECT COUNT(username) FROM STUDENT WHERE username='"+name+"'and password='"+pass+"'");
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
    out.println("<center><h3 style='color: blue'>The student details are:</h3></center>");
    int stud_id=0;
    String phone="0";
    String gender="0";
    String status="none";
    String sname="none";
    String batch="none";
    String sports="none";
    String coaches="none";
    String str="0";
    int fee=0;
    ResultSet res2=myStmt.executeQuery("SELECT * FROM STUDENT WHERE USERNAME='"+name+"'");
    //out.println("<center><table><tr><th>ID</th><th>Name</th><th>Gender</th><th>Sports</th><th>Batches</th><th>Coaches</th><th>Parent_phno</th><th>Fee</th><th>Status</th></tr>");
    while(res2.next()){
    	stud_id=res2.getInt("STUDENT_ID");
        sname=res2.getString("STUDENT_NAME");
    	//loc_id=res2.getInt("LOC_ID");
    	gender=res2.getString("GENDER");
    	status=res2.getString("STATUS");
    	fee=res2.getInt("FEE_PER_MONTH");
    	phone=res2.getString("PARENT_PHNO");
    	ResultSet res41=myStmt2.executeQuery("SELECT DISTINCT BATCH_NO FROM BATCH WHERE PERSON_ID="+stud_id);
    	while(res41.next()){
    		str=res41.getString(1);
    		if(batch.equals("none"))
    		batch=str;
    		else
    		batch=batch+", "+str;
    		
    	}
    	//out.println("Hi<br>");
        	
        	//out.println("HIIIIII<br>");
        	
        	
        ResultSet res4=myStmt1.executeQuery("SELECT SPORTS_NAME FROM COACHING_STAFF WHERE STAFF_ID IN(SELECT STAFF_ID FROM COACHES WHERE PERSON_ID="+stud_id+")");	     
        while(res4.next()){
               str=res4.getString(1);
        	    if(sports.equals("none")) 	   
            	sports=str;
                else
                sports=sports+","+str;
               
               }	
        
       
        ResultSet res42=myStmt1.executeQuery("SELECT STAFF_ID FROM COACHES WHERE PERSON_ID="+stud_id);	     
        while(res42.next()){
               str=res42.getString(1);
        	    if(coaches.equals("none")) 	   
            	coaches=str;
                else
                coaches=coaches+","+str;
               }	
      	
        
        out.println("<center><table><tr><th>ID</th><td>"+stud_id+"</td></tr><tr><th>NAME</th><td>"+sname+"</td></tr><tr><th>GENDER</th><td>"+gender+"</td></tr><tr><th>SPORTS</th><td>"+sports+"</td></tr><tr><th>BATCH</th><td>"+batch+"</td></tr><tr><th>COACHES</th><td>"+coaches+"</td></tr><tr><th>PHONE</th><td>"+phone+"</td></tr><tr><th>FEE</th><td>"+fee+"</td></tr><tr><th>STATUS</th><td>"+status+"</td></tr></center></table>");
        coaches="none";
        sports="none";
        batch="none";
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