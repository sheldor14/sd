<!DOCTYPE html>
<html lang="en">
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.*" %>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <title>SD.com</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
        
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" type="text/css" rel="stylesheet">




		<style>
		body {background-image:url("img/mt-rushmore.jpg");
		background-repeat:no-repeat;
		background-size:100% 100%;
		background-attachment:fixed;}
		</style>




        <!-- CSS code from Bootply.com editor -->
        
        <style type="text/css">
            .navbar-form input, .form-inline input {
  width:auto;
}

body {
  padding-top:50px;
}

footer {
  margin-top:40px;
  padding-top:40px;
  padding-bottom:40px;
  background-color:#ededed;
}


#masthead {
  min-height:199px;
}

#masthead h1 {
  font-size: 55px;
  line-height: 1;
  margin-top:50px;
}

#masthead .well {
  margin-top:31px;
  min-height:127px;
}

.navbar.affix {
  position:fixed;
  top:0;
  width:100%;
}
.link:hover {
	text-decoration:underline;
	color:blue;
}
.story-img {
  margin-top:25%;
  display:block;
}

.1:hover{
	background:#0000F0;
}

.2:hover{
	background:#000F00;
}

.3:hover{
	background:#00F000;
}

.4:hover{
	background:#0F0000;
}

.navbar-brand:hover, .top{
	cursor:pointer;
}

.forms:hover {
	text-decoration:underline;
	color:#0000FF;
	cursor:pointer;
}

a,a:hover {
  color:#223344;
  text-decoration:none;
}

.icon-bar {
  background-color:#fff;
}

@media screen and (min-width: 768px) {
  #masthead h1 {
    font-size: 80px;
  }
}

.dropdown-menu {
  min-width: 250px;
}

.panel {
  border-color:transparent;
  border-radius:0;
}

.thumbnail {
  margin-bottom:8px;
}

.img-container {
  overflow:hidden;
  height:170px;
}

.img-container img {
  min-width:280px;
  min-height:180px;
  max-width:380px;
  max-height:280px;
}

.txt-container {
  overflow:hidden;
  height:100px;
}

.panel .lead {
  overflow:hidden;
  height:90px;
}

.label-float{
  margin:0 auto;
  position: absolute;
  top: 0;
  z-index: 1;
  width:100%;
  opacity:.9;
  padding:6px;
  color:#fff;
}

.top:hover.key:hover {
	cursor:poitner;
}
    
.btn-twitter {background-color:#4099FF;color:#fff;}
.btn-facebook {background-color:#3B5998;color:#fff;}
.btn-google-plus {background-color:#d34836;color:#fff;}

.btn-twitter:hover {background-color:#3088FF;color:#62BBFF;}
.btn-facebook:hover {background-color:#2A4998;color:#4C6BBA;}
.btn-google-plus:hover {background-color:#C23836;color:#E45A58;}

        </style>
    </head>
    <%
    
    
    String id = request.getParameter("id");
    String region = request.getParameter("reg");
    String search = request.getParameter("keyword");
    String real = "";

	String name = "";
	String user = "";
	
        java.sql.Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://127.0.0.1/zcaldarola";   //location and name of database
        String userid = "gordie";
        String password = "happy95";
	conn = DriverManager.getConnection(url, userid, password);  

    
    
    java.sql.PreparedStatement ps1 = conn.prepareStatement("select * from zcaldarola.people where user_id = " + id);

	java.sql.ResultSet rs1 = ps1.executeQuery();

    while(rs1.next()){
    
    name = rs1.getString("fullname");
    user = rs1.getString("username");
    
    }
    
    if(search != null) search = search.toLowerCase();
    
    	if(region == null) region = "0";
    
    	switch (Integer.parseInt(region)) {
		case 1: real="North"; break;
		case 2: real="South"; break;
		case 3: real="East"; break;
		case 4: real="West"; break;
	
	}
    
    
    %>
    <!-- HTML code from Bootply.com editor -->
    
    <body>
        
        <header class="navbar navbar-default navbar-fixed-top" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <form id="home" action="home.jsp" method="post"><input type="hidden" name="id" value="<%=id%>"><input type="hidden" name="reg" value="0"></form><a class="navbar-brand" onclick= "document.getElementById('home').submit()">Home</a>
    </div>
    <nav class="collapse navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
        <li>
          <form id="North" action="home.jsp" method="post"><input type="hidden" name="id" value="<%=id%>"><input type="hidden" name="reg" value="1"></form><a class="top" onclick= "document.getElementById('North').submit()">North</a>
        </li>
        <li>
          <form id="South" action="home.jsp" method="post"><input type="hidden" name="id" value="<%=id%>"><input type="hidden" name="reg" value="2"></form><a class="top" onclick= "document.getElementById('South').submit()">South</a>
        </li>
        <li>
          <form id="East" action="home.jsp" method="post"><input type="hidden" name="id" value="<%=id%>"><input type="hidden" name="reg" value="3"></form><a class="top" onclick= "document.getElementById('East').submit()">East</a>
        </li>
        <li>
          <form id="West" action="home.jsp" method="post"><input type="hidden" name="id" value="<%=id%>"><input type="hidden" name="reg" value="4"></form><a class="top" onclick= "document.getElementById('West').submit()">West</a>
        </li>
      </ul>
      <ul class="nav navbar-right navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-search"></i></a>
          <ul class="dropdown-menu" style="padding:12px;">
            <form class="form-inline" action="home.jsp" method="post">
              <input type="hidden" name="id" value="<%=id%>"></input>
              <button type="submit" class="btn btn-default pull-right"><i class="glyphicon glyphicon-search"></i></button><input type="text" class="form-control pull-left" name="keyword" placeholder="Search Keywords">
            </form>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</header>

<div id="masthead">  
  <div class="container">
    <div class="row">
      <div class="col-md-7">
        <h1 style="color:#0000FF; background-color:rgba(255,255,255,.7)" >South Dakota
          <p class="lead" style="color:red">The Mount Rushmore State</p>
          <%if(!region.equals("0")){%>
          <p class="lead" style="color:red">The <%=real%>ern Region</p><%}%>
        </h1>
      </div>
      <div class="col-md-5">
        <div class="well well-lg"> 
          <div class="row">
            <div class="col-sm-12">
              Welcome <%=name%>		
            </div>
          </div>
         <a href="index.jsp"><button class="btn btn-default">Sign out?</button></a>
        </div>
      </div>
    </div> 
  </div><!-- /cont -->
  
 
</div>


<div class="container">
  <div class="row">
    
    <div class="col-md-12"> 
      
      <div class="panel">
        <div class="panel-body">
        
          
          <!--/stories-->
		  <div class="row">    
            <br>
            <div class="col-md-2 col-sm-3 text-center">
              <a class="story-img" href="#"><img src="img/mt-rushmore.jpg" style="width:100px;height:100px" class="img-circle"></a>
<!--            <form enctype="multipart/form-data" action="upload_img.jsp?user=" method=post>
				<input name="file" type="file">
				<input class="tweet-box" type="submit" value="Change Picture">
			</form> -->
			</div>

            <div class="col-md-10 col-sm-9">
              <form id="posting" action="post.jsp" method="get" accept-charset="utf-8">
              <input placeholder="Title" name="title" maxlength="50"></input>

              <br><br>
                   <a>Region: </a><select name="region" form="posting">
					 <option value="1">North</option>
			 		 <option value="2">South</option>
			 		 <option value="3">East</option>
			 		 <option value="4">West</option>
					</select>
					<br>
              <input type="hidden" name="id" value="<%=id%>"></input>
              <div class="row">
                <div class="col-xs-9">
                  <textarea rows="10" cols="120" name="content" placeholder="Post Your Thoughts Here" maxlength="500"></textarea>
                  <br><br>
                 <p class="pull-right"> <input type="text" name="keywords" placeholder="Keywords, separate by commas" size="30"></input></p>
                  <p class="lead"><button class="btn btn-default" type="submit">Post</button></p>
                 <!--  <p class="pull-right"><span class="label label-default">keyword</span> <span class="label label-default">tag</span> <span class="label label-default">post</span></p>
                   <ul class="list-inline"><li><a href="#">2 Days Ago</a></li><li><a href="#"><i class="glyphicon glyphicon-comment"></i> 4 Comments</a></li><li><a href="#"><i class="glyphicon glyphicon-share"></i> 34 Shares</a></li></ul> -->
                  </div>              
                  </form>

                <div class="col-xs-3"></div>

					</div>
            </div>
          </div>

          <hr>
          
          
          <%
    		// String count = ""; 
//     		if(search != null){
//           	java.sql.PreparedStatement ps10 = conn.prepareStatement("select count(*) from people a, posts b, keywords c where (c.keyword = ? and c.post_id = b.post_id and a.user_id = b.poster)");
//         	java.sql.ResultSet rs10 = ps10.executeQuery();
//         	
//         	while(rs10.next()) count = rs10.getString(1);
          %>
          
         
<%
	String content = "";
	String title = "";
	String poster = "";
	String time = "";
	String pid = "";
	String comment = "";
	int reg = 0;
	String place = "";
	int num = 0;
    String query="";
    String keyword="";
    String hold = "";

    
    if(search != null){
    query = "select a.fullname, b.title, b.content, date(b.times), b.post_id, b.region from people a, posts b, keywords c where (c.keyword like ? and c.post_id = b.post_id and a.user_id = b.poster) order by b.post_id DESC";
    }
	else if(region.equals("0")){
    query = "select a.fullname, b.title, b.content, date(b.times), b.post_id, b.region from people a, posts b where (a.user_id = b.poster) order by b.post_id DESC";
    }
    else{
     query = "select a.fullname, b.title, b.content, date(b.times), b.post_id, b.region from people a, posts b where (a.user_id = b.poster and b.region =?) order by b.post_id DESC";
    }
    
    java.sql.PreparedStatement ps2 = conn.prepareStatement(query);
    if(!region.equals("0")) ps2.setString(1, region);
    else if(search != null){ search = "%" + search + "%"; ps2.setString(1, search);}

	java.sql.ResultSet rs2 = ps2.executeQuery();

	java.sql.PreparedStatement ps3 = conn.prepareStatement("select count(*) from comment where post_id = ?");
    

    while(rs2.next()){
    hold = "";
    poster = rs2.getString(1);
	content = rs2.getString(3);
	title = rs2.getString(2);
	time = rs2.getString(4);
	pid = rs2.getString(5);
	reg = Integer.parseInt(rs2.getString(6));
	//count = rs2.getString(7);

	switch (reg) {
	
		case 1: place="North"; break;
		case 2: place="South"; break;
		case 3: place="East"; break;
		case 4: place="West"; break;
	
	}

	ps3.setString(1, pid);
	
	java.sql.ResultSet rs3 = ps3.executeQuery();
	
	while(rs3.next()){
		comment = rs3.getString(1);
	}
	for(int i=0; i<content.split(" ").length; i++){
	
		if(content.split(" ")[i].contains("http")){
		hold= hold + "<a class='link' href ="+content.split(" ")[i]+">"+content.split(" ")[i]+"</a>" + " ";
		}
		else if(content.split(" ")[i].contains("www.") && !content.split(" ")[i].contains("http")){
		hold= hold + "<a class='link' href =http://"+content.split(" ")[i]+">"+content.split(" ")[i]+"</a>" + " ";
		}
		else hold+= content.split(" ")[i] +" ";
	
	}
	content = hold;
%>         
		  <div class="row">    
            <br>
            <div class="col-md-2 col-sm-3 text-center">
              <a class="story-img" href="#"><img src="img/mt-rushmore.jpg" style="width:100px;height:100px" class="img-circle"></a>
            </div>
            <div class="col-md-10 col-sm-9">
              <h3><%=title%></h3>
              <div class="row">
                <div class="col-xs-9">
                  <p><%=content%></p>
                  <!--<p class="lead"><button class="btn btn-default">Read More</button></p>-->
                  <p class="pull-right">
                  <%
                  java.sql.PreparedStatement ps4 = conn.prepareStatement("select keyword from keywords where post_id = ?");
                  
                  ps4.setString(1, pid);
                  java.sql.ResultSet rs4 = ps4.executeQuery();
                  
                  while(rs4.next()){
                  keyword = rs4.getString(1);
                  %>
                  <form class="label label-default" id="keyword<%=keyword%>" action="home.jsp" method="post"><input type="hidden" name="id" value="<%=id%>"><input type="hidden" name="keyword" value="<%=keyword%>"><span class="key" onclick="document.getElementById('keyword<%=keyword%>').submit()"><%=keyword%></span></form><%}%> </p>
                  <ul class="list-inline"><li><a href="#">by <b><%=poster%></b></a></li><li><a><%=time%></a></li>
                  <li><form id="comment<%=num%>" action="comments.jsp" method="post"><input type="hidden" name="key" value="<%=id%>"><input type="hidden" name="pid" value="<%=pid%>"></form><a class="forms" onclick= "document.getElementById('comment<%=num%>').submit()"><i class="glyphicon glyphicon-comment"></i> <%=comment%> Comments</a></li></form>
                  <!--<li><a href="#"><i class="glyphicon glyphicon-share"></i> 34 Shares</a></li>-->
                  <li><b><%=place%></b></li></ul>
                  </div>
                <div class="col-xs-3"></div>
              </div>
              <br><br>
            </div>
          </div>
          <hr>
        
          <%num++;}%>
          <!--/stories-->
          
          
         <!-- <a href="/" class="btn btn-primary pull-right btnNext">More <i class="glyphicon glyphicon-chevron-right"></i></a> -->
        

        </div>
      </div>
                                                                                       
	                                                
                                                      
   	</div><!--/col-12-->
  </div>
</div>
                                                
                                                                                
<hr>

<div class="container" id="footer" style="background-color:rgba(255,255,255,.7)">
  <div class="row">
    <div class="col col-sm-12">
      
      <h1>Follow Us</h1>
      <div class="btn-group">
       <a class="btn btn-twitter btn-lg" href="http://compsci.dalton.org:8080/zcaldarola/twitter_dir/twitter-signin.jsp"><i class="icon-twitter icon-large"></i> Twitter</a>
	   <a class="btn btn-facebook btn-lg" href="http://www.facebook.com"><i class="icon-facebook icon-large"></i> Facebook</a>
	   <a class="btn btn-google-plus btn-lg" href="http://plus.google.com"><i class="icon-google-plus icon-large"></i> Google+</a>
      </div>
      
    </div>
  </div>
</div>

<hr>

<footer>
  <div class="container" >
    <div class="row">
      <div class="col-sm-6">
        <ul class="list-inline" >
       <!---   <li><i class="icon-facebook icon-2x"></i></li>
          <li><i class="icon-twitter icon-2x"></i></li>
          <li><i class="icon-google-plus icon-2x"></i></li>
          <li><i class="icon-pinterest icon-2x"></i></li> --->
        </ul>
        
      </div>
      <div class="col-sm-6">
         <!--- <p class="pull-right">Built with <i class="icon-heart-empty"></i> at <a href="http://www.bootply.com">Bootply</a></p>     --->
      </div>
    </div>
  </div>
</footer>   
        <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


        <script type='text/javascript' src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>





        
        <!-- JavaScript jQuery code from Bootply.com editor -->
        
        <script type='text/javascript'>
        
        $(document).ready(function() { 
        
        });
        
        </script>
    </body>
</html>