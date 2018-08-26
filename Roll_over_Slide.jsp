<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try 
{
	//String str=(String)session.getAttribute("C_Id");
   int cid=(int)session.getAttribute("cid");
	Integer i1=0,i2=0;
	 ResultSet rs,rs1,rs2;
	 String s1="",s2="",s3="";
	 Double f=0.0;
	 //Integer O_Id=0;
	// int teamno=1;
  Class.forName("oracle.jdbc.OracleDriver");
 // out.print(7);
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HARRYPOTTER","oracle123");
  Statement stat = con.createStatement();
  rs=stat.executeQuery("select * from Customer where C_Id='"+cid+"' ");
  if(rs.next())
  {
	  s1=rs.getString(2);
	  s2=rs.getString(3);	  
  }
  rs1=stat.executeQuery("select * from D_Order where C_Id='"+cid+"' ");
  if(rs1.next())
  {
	  i1=rs1.getInt(1);
	  i2=rs1.getInt(2);
  }
 
  rs2=stat.executeQuery("select * from Items where I_Id='"+i1+"' ");
  if(rs2.next())
  {
	 s3=rs2.getString(2);
	 f=rs2.getDouble(3);
  }
 %>
    <h1><%out.print(s1); %>'s Orders</h1>
    <br><br>
    <h2 align="right">Delivery Address:</h2>
    <br>
    <p align="right"><%out.print(s2); %></p>
    <div>
    <h1>Order ID: <%out.print(i1+""+i2);%></h1>
    <br>
    <h2><%out.print(s3);%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<% out.print(f); %></h2>
    <button >View Details</button>
    </div>
    <%}catch(ClassNotFoundException e)
{
    out.println(e.getLocalizedMessage());
}%>
    </body>
</html>