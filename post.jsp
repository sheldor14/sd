<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>



<html>
	<body>

<%
        String title = request.getParameter("title").trim().replaceAll(" +", " ");
        String content = request.getParameter("content").trim().replaceAll(" +", " ");
        String id = request.getParameter("id");
        String reg = request.getParameter("region");
        String[] keywords = request.getParameter("keywords").trim().replaceAll(" +", " ").split(",");
        
        String pid = "";
        
        
	String redirectURL = "";
	String user_id = "";

	int status = 0;


	java.sql.Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://127.0.0.1/zcaldarola";   //location and name of database
        String userid = "gordie";
        String password = "happy95";
        conn = DriverManager.getConnection(url, userid, password);      //connect to database


        java.sql.PreparedStatement ps = conn.prepareStatement("insert into zcaldarola.posts (title, content, poster, times, region) values (?,?,?,now(),?)");

        ps.setString (1,title);
        ps.setString (2,content);
        ps.setString(3,id);
        ps.setString(4,reg);
        status = ps.executeUpdate();

		java.sql.Statement stmt = conn.createStatement();
		java.sql.ResultSet rs = stmt.executeQuery("select max(post_id) from posts");
		
		while(rs.next()) pid = rs.getString(1);


		java.sql.PreparedStatement ps1;
		
		for(int i=0; i<keywords.length; i++){
			ps1 = conn.prepareStatement("insert into zcaldarola.keywords (post_id,keyword) values (?,?)");
			ps1.setString(1, pid);
			ps1.setString(2, keywords[i].toLowerCase());
			
			ps1.executeUpdate();
		}


        if(status > 0)
        {
                redirectURL = "home.jsp";
  //              response.sendRedirect(redirectURL);

        }
        else
        {
                redirectURL = "home.jsp";
  //              response.sendRedirect(redirectURL);
        }
        

%>
<form name="myForm" action="<%=redirectURL%>" method="post" accept-charset="utf-8">
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="reg" value="0">
</form>
<SCRIPT LANGUAGE="JavaScript">document.forms[0].submit();</SCRIPT>
