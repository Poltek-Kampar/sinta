<!DOCTYPE html>
<%@ include file="ceksession.jsp" %>
<%@ page import ="java.io.*" %>
<%@include file='koneksi.jsp' %>

<html>
<head>
<title>Welcome <%= session.getAttribute("admin") %></title>
<meta name='author' content='andri'/>
<meta name='description' content='sistem informasi'/>
<link href="../Assets/bootstrap.css" rel="stylesheet">
</head>
<body bgcolor='#dcdcdc'>
<div class='container-fluid' style='margin-top:60px;'>
<%@include file="header.jsp" %>
<div class="row-fluid">
    <div class="span3">
        <div class="well" style="padding: 8px 0;">
            <ul class="nav nav-list">
                <li class='nav-header'>Menu</li>
                <li class="active"><a href="home.jsp"><i class="icon icon-home"></i>  Home</a></li>
                <li><a href="dosen.jsp"><i class="icon icon-user"></i>  Dosen</a></li>
                <li><a href="mahasiswa.jsp"><i class="icon icon-user"></i>  Mahasiswa</a></li>
                <li><a href="prodi.jsp"><i class="icon icon-road"></i>  Program Studi</a></li>
                <li><a href="admin.jsp"><i class="icon icon-wrench"></i>  Admin Configuration</a></li>
                <li><a href="logout.jsp"><i class="icon icon-off"></i>  Logout</a></li>
            </ul>
        </div>
    </div>
    <div class="span9">
        <div class="well" style='height: 440px'>
          <!-- isikan tentang program aku ne cuyzzz --> 
          
        </div>
    </div>
    <%@include file="footer.jsp" %>
</div>
</div>
</body>
</html>