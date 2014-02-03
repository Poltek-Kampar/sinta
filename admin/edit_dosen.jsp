<!DOCTYPE html>
<%@ include file="ceksession.jsp" %>
<%@include file="koneksi.jsp" %>
<%
String nrp = request.getParameter("id");
ResultSet sql1;
sql1 = st.executeQuery("select * from dosen where nrp_dsn='"+ nrp +"'");
if (sql1.next() == false){
    response.sendRedirect("dosen.jsp");
}
String nama_dsn = sql1.getString("nama_dsn");
String nidn_dsn = sql1.getString("nidn_dsn");
String alamat_dsn = sql1.getString("alamat_dsn");
String email_dsn = sql1.getString("email_dsn");
String telpon_dsn = sql1.getString("telpon_dsn");
String id_prodi = sql1.getString("id_prodi");
%>
<html>
<head>
<title>Welcome <%= session.getAttribute("admin") %> - Edit Dosen <%=nrp%></title>
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
                <li class="active"><a href="dosen.jsp"><i class="icon icon-user"></i>  Dosen</a></li>
                <li><a href="mahasiswa.jsp"><i class="icon icon-user"></i>  Mahasiswa</a></li>
                <li><a href="prodi.jsp"><i class="icon icon-road"></i>  Program Studi</a></li>
                <li><a href="admin.jsp"><i class="icon icon-wrench"></i>  Admin Configuration</a></li>
                <li><a href="logout.jsp"><i class="icon icon-off"></i>  Logout</a></li>
            </ul>
        </div>
    </div>
    <div class="span9">
       
        <div class="well">
            <p style='font-size: 16px;color:red'>Edit Dosen Dengan Nrp <%=nrp%></p>
            <p>
            <form action='prosess.jsp' method="post">
                Nama Dosen :
                <input required type="text" value="<%=nama_dsn%>" name="nama" class="span12"/>
                NIDN :
                <input required type="text" value="<%=nidn_dsn%>" name="nidn" class="span12"/>
                NRP Dosen :
                <input required type="text" value="<%=nrp%>" name="nrp" class="span12"/>
                Alamat :
                <input type="text" value="<%=alamat_dsn%>" name="alamat" class="span12"/>
                Email :
                <input type="text" value="<%=email_dsn%>" name="email" class="span12"/>
                No Telp :
                <input type="text" value="<%=telpon_dsn%>" name="telp" class="span12"/>
                Prodi :
                <select name='id_prodi' style='width:100%'>
                    <%
                    ResultSet sql3;
                    sql3 = st.executeQuery("select * from prodi where id='"+ id_prodi +"'");
                    if (sql3.next()){
                    String nama_prodi_def = sql3.getString("nama_prodi");
                    out.print("<option value='"+ id_prodi +"'>"+ nama_prodi_def +"</option>");
                    }
                    %>
                    <%
                    ResultSet sql2;
                    sql2 = st.executeQuery("select * from prodi where id!='"+ id_prodi +"'");
                    while(sql2.next()){
                        String nama_prodi = sql2.getString("nama_prodi");
                        String id_prodi_me = sql2.getString("id");
                        out.print("<option value='"+ id_prodi_me +"'>"+ nama_prodi +"</option>");
                    }
                    %>
                </select>
                <input type='hidden' name='aksi' value='edit_dsn'/>
                <input type="submit" class="btn btn-primary" value="Simpan"/>
            </form>
            </p>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</div>
</div>
</body>
</html>