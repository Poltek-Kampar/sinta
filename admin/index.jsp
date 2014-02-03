<!DOCTYPE html>
<%
if (session.getAttribute("admin") != null){
    response.sendRedirect("home.jsp");
}
%>
<html>
<head>
<title>Sistem Informasi - Login To admin</title>
<meta name='author' content='andri'/>
<meta name='description' content='sistem informasi'/>
<link href="../Assets/bootstrap.css" rel="stylesheet">
</head>
<body bgcolor='#dcdcdc'>
<div style='position:relative;float:both;top:10px;'>
<div class="navbar navbar-fixed-top">
	      <div class="navbar-inner">
	        <div class="container-fluid">
	          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </a>
	          
	          <div class="nav-collapse">
	            <ul class="nav">
	              <li><a href="../index.jsp">Home</a></li>
                      <li class='active'><a href="index.jsp">Admin</a></li>
	            </ul>
				<form class="navbar-search pull-right" action="../cari.jsp" method="get">
						<div class="input-prepend">
						<dewa class="add-on"><i class="icon icon-search"></i></dewa><input placeholder="Search..." class="tipsy-atas" type="text" required name="q" id="search" title="Search Article here" style='width:125px'>
						</div>
				</form>
	          </div><!--/.nav-collapse -->
	        </div>
	      </div>
</div>
<div class="container">
	<div class="row-fluid">
			<div style='margin-top:40px;'>
				<div class="row">
					<div style="padding:10px;margin:5px;min-height:400px">
                                            <center>
                                                <div align="center" style='width:300px;'>
                                                    <form action="ceklogin.jsp" method="post">
                                                    <p align='left'>Username :<br>
                                                    <input type="text" name='uname'/>
                                                    <p align='left'>Password :<br>
                                                    <input type="password" name='pass'/><br>
                                                    <input type="submit" class='btn btn-inverse' value='Login'/>
                                                    </form>
                                                </div>
                                            </center>
					</div>
                                    
				</div>
		</div>
	</div>
</div>
    <%@include file="footer.jsp" %> 
</body>
</html>