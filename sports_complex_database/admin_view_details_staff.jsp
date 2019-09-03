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
    out.println("<center><h3 style='color: blue'>The sports_person details are:</h3></center>");
    int sal=0;
    int staff_id=0;
    String sname="0";
    String sport="0";
    String batch="none";
    String students="none";
    String phone="none";
    int hrs=0;
    int salary=0;
    String str="none";
    ResultSet res2=myStmt.executeQuery("SELECT * FROM COACHING_STAFF");
    out.println("<center><table><tr><th>ID</th><th>Name</th><th>Sport</th><th>Batches</th><th>Students</th><th>Phone Numbers</th><th>Working_hrs_per_day</th><th>Salary</th></tr>");
    while(res2.next()){
    	staff_id=res2.getInt("STAFF_ID");
        sname=res2.getString("name");
    	//loc_id=res2.getInt("LOC_ID");
    	sport=res2.getString("SPORTS_NAME");
    	hrs=res2.getInt("WORKING_HRS_PER_DAY");
    	
    	ResultSet res41=myStmt2.executeQuery("SELECT DISTINCT BATCH_NO FROM BATCH_TIME WHERE STAFF_ID="+staff_id);
    	while(res41.next()){
    		str=res41.getString(1);
    		if(batch.equals("none"))
    		batch=str;
    		else
    		batch=batch+", "+str;
    		
    	}
    	//out.println("Hi<br>");
    	ResultSet res5=myStmt2.executeQuery("SELECT SALARY FROM COACHING_STAFF_SAL WHERE WORKING_HRS_PER_DAY="+hrs+" AND SPORTS_NAME='"+sport+"'");
        while(res5.next())
        {
        	sal=res5.getInt(1);
        }	
        	
        	//out.println("HIIIIII<br>");
        	
        ResultSet res4=myStmt1.executeQuery("SELECT PHNO FROM COACHING_STAFF_PHNO WHERE STAFF_ID ="+staff_id);	     
        while(res4.next()){
               str=res4.getString(1);
        	    if(phone.equals("none")) 	   
            	phone=str;
                else
                phone=phone+","+str;
               
               }	
        
        ResultSet res11=myStmt2.executeQuery("SELECT COUNT( DISTINCT STUDENT_NAME) FROM STUDENT WHERE STUDENT_ID IN(SELECT PERSON_ID FROM BATCH WHERE STAFF_ID='"+staff_id+"')");
        while(res11.next()){
        int a=res11.getInt(1);
        if(a!=0){
        ResultSet res42=myStmt1.executeQuery("SELECT DISTINCT STUDENT_NAME FROM STUDENT WHERE STUDENT_ID IN(SELECT PERSON_ID FROM BATCH WHERE STAFF_ID='"+staff_id+"')");	     
        while(res42.next()){
               str=res42.getString(1);
        	    if(students.equals("none")) 	   
            	students=str;
                else
                students=students+","+str;
               }	
        }
        }	
        
        out.println("<tr><td>"+staff_id+"</td><td>"+sname+"</td><td>"+sport+"</td><td>"+batch+"</td><td>"+students+"</td><td>"+phone+"</td><td>"+hrs+"</td><td>"+sal+"</td></tr>");
        students="none";
        phone="none";
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