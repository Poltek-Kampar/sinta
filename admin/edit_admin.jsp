<!DOCTYPE html>
<%@ include file="ceksession.jsp" %>
<%@include file="koneksi.jsp" %>
<%
String nama = request.getParameter("nama");
ResultSet sql1;
sql1 = st.executeQuery("select * from admin where username='"+ nama +"'");
if (sql1.next() == false){
    response.sendRedirect("admin.jsp");
}
String nama_admin = sql1.getString("username");
String pass_admin = sql1.getString("pass");
if (nama_admin.equals(session.getAttribute("admin"))){
    
}else{
    response.sendRedirect("../AdminControl?action=error4&nama="+nama_admin+"");
}
%>
<html>
<head>
<title>Welcome <%= session.getAttribute("admin") %> - Edit Admin</title>
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
                <li><a href="prodi.jsp"><i class="icon icon-road"></i>  Program Studi</a></li>
                <li class="active"><a href="admin.jsp"><i class="icon icon-wrench"></i>  Admin Configuration</a></li>
                <li><a href="logout.jsp"><i class="icon icon-off"></i>  Logout</a></li>
            </ul>
        </div>
    </div>
    <div class="span9">
       
        
        <div class="well">
            <p style='font-size: 16px;color:red'>Edit Admin <%=nama_admin%></p>
            <p>
            <form action='prosess.jsp' method="post">
                Nama Admin :
                <input required type="text" name="nama" class="span12" value="<%=nama_admin%>"/>
                Password Admin :
                <input type="password" required="" name="pass" class="span12" value="<%=pass_admin%>"/>
                <input type="hidden" required="" name="aksi" value="edit_am" class="span12"/>
                <input type="submit"  class="btn btn-primary" value="Simpan"/>
            </form>
            </p>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</div>
</div>
</body>
</html>