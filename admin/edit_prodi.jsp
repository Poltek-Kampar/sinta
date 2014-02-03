<!DOCTYPE html>
<%@ include file="ceksession.jsp" %>
<%@ page import ="java.io.*" %>
<%@include file='koneksi.jsp' %>
<%
String id = request.getParameter("id");
ResultSet sql1;
sql1 = st.executeQuery("select * from prodi where id='"+ id +"'");
sql1.next();
String nama_prodi = sql1.getString("nama_prodi");
%>
<html>
<head>
    <title>Welcome <%= session.getAttribute("admin") %> - Edit Program Studi <%=id%></title>
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
                <li><a href="home.jsp"><i class="icon icon-home"></i>  Home</a></li>
                <li><a href="dosen.jsp"><i class="icon icon-user"></i>  Dosen</a></li>
                <li><a href="mahasiswa.jsp"><i class="icon icon-user"></i>  Mahasiswa</a></li>
                <li class="active"><a href="prodi.jsp"><i class="icon icon-road"></i>  Program Studi</a></li>
                <li><a href="admin.jsp"><i class="icon icon-wrench"></i>  Admin Configuration</a></li>
                <li><a href="logout.jsp"><i class="icon icon-off"></i>  Logout</a></li>
            </ul>
        </div>
    </div>
    <div class="span9">
                  <div class="well">
            <p style='font-size: 16px;color:red'>Edit Prodi</p>
            <p>
            <form action='prosess.jsp' method="post">
                Nama Prodi :
                <input required type="text" value="<%=nama_prodi%>" name="nama" class="span12"/>
                <input required type="hidden" value="<%=id%>" name="id" class="span12"/>
                <input required type="hidden" name="aksi" value="edit_prodi"/>
                <input type="submit" class="btn btn-primary" value="Edit"/>
            </form>
            </p>
        </div>
    </div>
    <%@include file="footer.jsp" %>                
</div>
</div>
</body>
</html>