<!DOCTYPE html>
<%@ include file="ceksession.jsp" %>
<%@ page import ="java.io.*" %>
<%@include file="koneksi.jsp" %>
<%
String nim = request.getParameter("nim");
ResultSet sql1;
sql1 = st.executeQuery("select * from mahasiswa where nim_mh='"+ nim +"'");
sql1.next();
String nama_mh = sql1.getString("nama_mh");
String id_prodinya = sql1.getString("id_prodi");
int angkatan = sql1.getInt("angkatan");
ResultSet sql5 = st.executeQuery("select * from prodi where id='"+ id_prodinya +"'");
sql5.next();
String nama_prodinya = sql5.getString("nama_prodi");
%>
<html>
<head>
<title>Welcome <%= session.getAttribute("admin") %> - Edit Mahasiswa <%=nim%></title>
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
                <li class="active"><a href="mahasiswa.jsp"><i class="icon icon-user"></i>  Mahasiswa</a></li>
                <li><a href="prodi.jsp"><i class="icon icon-road"></i>  Program Studi</a></li>
                <li><a href="admin.jsp"><i class="icon icon-wrench"></i>  Admin Configuration</a></li>
                <li><a href="logout.jsp"><i class="icon icon-off"></i>  Logout</a></li>
            </ul>
        </div>
    </div>
    <div class="span9">
        
        <div class="well">
            <p style='font-size: 16px;color:red'>Edit Mahasiswa <%=nim%></p>
            <p>
            <form action='prosess.jsp' method="post">
                Nim :
                <input required type="text" value="<%=nim%>" name="nim" class="span12"/>
                Nama :
                <input type="text" required="" value="<%=nama_mh%>" name="nama" class="span12"/>
                Prodi :
                <select name='prodi' style='width:100%'>
                    <option value='<%=id_prodinya%>'><%=nama_prodinya%></option>
                    <%
                    ResultSet sql2;
                    sql2 = st.executeQuery("select * from prodi where id!='"+ id_prodinya +"'");
                    while(sql2.next()){
                        String nama_prodi = sql2.getString("nama_prodi");
                        String id_prodi = sql2.getString("id");
                        out.print("<option value='"+ id_prodi +"'>"+ nama_prodi +"</option>");
                    }
                    %>
                </select>
                Angkatan :
                <select name='angkatan' style='width:100%'>
                    <option><%=angkatan%></option>
                    <%
                    int tahunmulai = 2006;
                    while (tahunmulai <= 2013){
                        out.print("<option>"+ tahunmulai +"</option>");
                        tahunmulai++;
                    }
                    %>
                </select> 
                <input type='hidden' value="edit_mhs" name="aksi"/>
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