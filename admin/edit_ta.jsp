<!DOCTYPE html>
<%@ include file="ceksession.jsp" %>
<%@ include file="koneksi.jsp" %>
<%
String nim = request.getParameter("nim");
ResultSet sql1;
sql1 = st.executeQuery("select * from tugas_akhir where nim_mh='"+ nim +"'");
sql1.next();
String judul = sql1.getString("judul");
String nrp_satu = sql1.getString("NRP1");
String nrp_dua = sql1.getString("NRP2");
String abstrak = sql1.getString("abstrak");
%>
<html>
<head>
<title>Welcome <%= session.getAttribute("admin") %> - Edit TA <%=nim%></title>
<meta name='author' content='andri'/>
<meta name='description' content='sistem informasi'/>
<link href="../Assets/bootstrap.css" rel="stylesheet">
</head>
<body bgcolor='#dcdcdc'>
    <script src="ckeditor/ckeditor.js"></script>
<div class='container-fluid' style='margin-top:60px;'>
<%@include file="header.jsp" %>
<div class="row-fluid">
    <div class="span3">
        <div class="well" style="padding: 8px 0;">
            <ul class="nav nav-list">
                <li class='nav-header'>Menu</li>
                <li><a href="home.jsp"><i class="icon icon-home"></i>  Home</a></li>
                <li><a href="dosen.jsp"><i class="icon icon-user"></i>  Dosen</a></li>
                <li class="active"><a href="mahasiswa.jsp"><i class="icon icon-user"></i>  Mahasiswa</a></li>
                <li><a href="prodi.jsp"><i class="icon icon-road"></i>  Program Studi</a></li>
                <li><a href="admin.jsp"><i class="icon icon-wrench"></i>  Admin Configuration</a></li>
                <li><a href="logout.jsp"><i class="icon icon-off"></i>  Logout</a></li>
            </ul>
        </div>
    </div>
    <div class="span9">
        <div class="well">
            <p style='font-size: 16px;color:red'>Edit TA <%=nim%></p>
            <p>
            <form action='prosess.jsp' method="post">
                Nim Mahasiswa :
                <input type="text" required="" value="<%=nim%>" name="nim" class="span12"/>
                Judul TA :
                <input type="text" required="" value="<%=judul%>" name="judul" class="span12"/>
                Dosen Pembimbing 1 :
                <select name='nrp1' style='width:100%'>
                    <%
                    ResultSet sql2_;
                    sql2_ = st.executeQuery("select * from dosen where nrp_dsn='"+ nrp_satu +"'");
                    if (sql2_.next()){
                        String nama_dosen_satu = sql2_.getString("nama_dsn");
                        out.print("<option value='"+ nrp_satu +"'>"+ nama_dosen_satu +"</option>");
                    }
                    ResultSet sql2;
                    sql2 = st.executeQuery("select * from dosen where nrp_dsn!='"+ nrp_satu +"'");
                    while(sql2.next()){
                        String nama_dosen = sql2.getString("nama_dsn");
                        String nrp = sql2.getString("nrp_dsn");
                        out.print("<option value='"+ nrp +"'>"+ nama_dosen +"</option>");
                    }
                    %>
                </select>
                Dosen Pembimbing 2 :
                <select name='nrp2' style='width:100%'>
                    <%
                    ResultSet sql3_;
                    sql3_ = st.executeQuery("select * from dosen where nrp_dsn='"+ nrp_dua +"'");
                    if (sql3_.next()){
                        String nama_dosen_dua = sql3_.getString("nama_dsn");
                        out.print("<option value='"+ nrp_dua +"'>"+ nama_dosen_dua +"</option>");
                    }
                    ResultSet sql3;
                    sql3 = st.executeQuery("select * from dosen where nrp_dsn!='"+ nrp_dua +"'");
                    while(sql3.next()){
                        String nama_dosen = sql3.getString("nama_dsn");
                        String nrp = sql3.getString("nrp_dsn");
                        out.print("<option value='"+ nrp +"'>"+ nama_dosen +"</option>");
                    }
                    %>
                </select>
                Abstrak :<p>
                <textarea class="ckeditor" name="abstrak"><%=abstrak%></textarea> <p>
                <input type='hidden' value="edit_ta" name="aksi"/>
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