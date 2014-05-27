<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>



<html>
	<body>
	
	<%
        String content = request.getParameter("content").trim().replaceAll(" +", " ");
        String id = request.getParameter("id");
        String pid = request.getParameter("pid");

	String redirectURL = "";
	String user_id = "";

	int status = 0;


	java.sql.Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://127.0.0.1/zcaldarola";   //location and name of database
        String userid = "gordie";
        String password = "happy95";
        conn = DriverManager.getConnection(url, userid, password);      //connect to database


        java.sql.PreparedStatement ps = conn.prepareStatement("insert into zcaldarola.comment (post_id, c_data, poster, times) values (?,?,?,now())");
		
		ps.setString(1, pid);
        ps.setString (2,content);
        ps.setString(3,id);
        status = ps.executeUpdate();


        if(status > 0)
        {
                redirectURL = "comments.jsp";
  //              response.sendRedirect(redirectURL);

        }
        else
        {
                redirectURL = "comments.jsp";
  //              response.sendRedirect(redirectURL);
        }
        

%>
<form name="myForm" action="<%=redirectURL%>" method="post" accept-charset="utf-8">
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="pid" value="<%=pid%>">
</form>
<SCRIPT LANGUAGE="JavaScript">document.forms[0].submit();</SCRIPT>
