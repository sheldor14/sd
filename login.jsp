<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>



<html>
	<body>

<%
        String username = request.getParameter("username");
        String pwd = request.getParameter("password");
        
        
	String redirectURL = "";
	String user_id = "";

	int status = 0;


	java.sql.Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://127.0.0.1/zcaldarola";   //location and name of database
        String userid = "gordie";
        String password = "happy95";
        conn = DriverManager.getConnection(url, userid, password);      //connect to database


        java.sql.PreparedStatement ps = conn.prepareStatement("select user_id from zcaldarola.people where username = ? and password = ?");

        ps.setString (1,username);
        ps.setString (2,pwd);
        java.sql.ResultSet rs = ps.executeQuery();

		while(rs.next()){
		
		user_id = rs.getString(1);
		status++;
		
		}


// 	java.sql.PreparedStatement ps1 = conn.prepareStatement("insert into zcaldarola.follower (follower, following) values (?,?)");
// 	ps1.setString(1, user_id);
// 	ps1.setString(2, user_id);
// 	
// 	boolean up = ps1.execute();
       
        if(status > 0)
        {
                redirectURL = "home.jsp";
  //              response.sendRedirect(redirectURL);

        }
        else
        {
                redirectURL = "signup.jsp";
  //              response.sendRedirect(redirectURL);
        }
        

%>
<form name="myForm" action="<%=redirectURL%>" method="post" accept-charset="utf-8">
<% if(status>0){%>
<input type="hidden" name="id" value="<%=user_id%>">
<input type="hidden" name="reg" value="0"><%}%>
</form>
<SCRIPT LANGUAGE="JavaScript">document.forms[0].submit();</SCRIPT>