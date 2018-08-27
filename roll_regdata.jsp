<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ include file="index3.html" %>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >

<title>REG DATA</title>

</HEAD>
<BODY>
<% 
try 
{
	 ResultSet rs=null;
  Class.forName("oracle.jdbc.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","HARRYPOTTER","oracle123");
  int cid=1;
  int contact=0;
  session=request.getSession();
  String user = request.getParameter("username");
  String pwd = request.getParameter("password");
 // String areacode = request.getParameter("user_area");
  String nuser = request.getParameter("usernamesignup");
  String add=request.getParameter("address");
  String email = request.getParameter("emailsignup");
  String pwd2 = request.getParameter("password2");
  String cpwd = request.getParameter("password_confirm");
  Statement stat = con.createStatement();
  Statement stat1 = con.createStatement();
  Statement stat2 = con.createStatement();
  if(user==null)
  {
	  if(!request.getParameter("contact").equals(null))
	  {
		  contact = Integer.parseInt(request.getParameter("contact"));
	  }
	  if(!pwd2.equals(cpwd))
	  { %><script type="text/javascript">
		  alert("Password not match!");
		  </script><%}
		  else
		  {
			  rs=stat1.executeQuery("select * from Customer");
			  if(rs!=null)
			  {	  
			  while(rs.next())
			  {
				  cid++;
			  }
			  }
			  cid++;
			  session.setAttribute("cid",cid);
			  stat.executeUpdate("insert into Customer values('"+cid+"','"+nuser+"','"+add+"','"+email+"','"+contact+"','"+pwd2+"')");
			  RequestDispatcher rd=request.getRequestDispatcher("Roll_over_Slide.jsp");
			  rd.forward(request, response);
		  }
			  
  }
  else
  {
	  rs=stat1.executeQuery("select * from Customer where c_name='"+user+"' and Password='"+pwd+"'");
	  if(rs.next())
	  {
		  if(pwd.equals(rs.getString(6)))
		  {
			  //System.out.print("hi");
			  cid=rs.getInt(1);
			  session.setAttribute("cid",cid);
			  RequestDispatcher rd=request.getRequestDispatcher("Roll_over_Slide.jsp");
			  rd.forward(request, response);
		  }
		  else
		  {
			  %>
			  <script type="text/javascript">
		  alert("Password not match!");
		  </script><%
		  }
	  }
  }
 }catch(java.sql.SQLIntegrityConstraintViolationException e)
{
    %>
    <script>
    alert("Please enter unique team name!!!");
    </script>
    
    <%
}%>


</body>


</html>