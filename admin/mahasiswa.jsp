<!DOCTYPE html>
<%@ include file="ceksession.jsp" %>
<html>
<head>
<title>Welcome <%= session.getAttribute("admin") %> - Mahasiswa</title>
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
            <p style='font-size: 16px;color:red'>List Semua Mahasiswa</p>
            <p>
                <a href="tambah_ta.jsp" class="btn">Tambah TA Baru</a>
            <table class="border">
                <table class="table table-bordered table-striped table-hover">
                  <thead>
                    <tr>
                      <th style="width:30px;">No</th>
                      <th>Nim</th>
                      <th>Nama</th>
                      <th>Prodi</th>
                      <th>Angkatan</th>
                    </tr>
                  <tbody>
                      <%@include file="koneksi.jsp" %>
                      <%
                      ResultSet sql1;
                      ResultSet data1;
                      sql1 = st.executeQuery("SELECT p.*, m.* from prodi p, mahasiswa m where p.id=m.id_prodi");
                      int no = 1;
                      while(sql1.next()){
                          String nim_mh = sql1.getString("nim_mh");
                          String nama_mh = sql1.getString("nama_mh");
                          String prodi_mh = sql1.getString("id_prodi");
                          String nama_prodi = sql1.getString("nama_prodi");
                          int akt_mh = sql1.getInt("angkatan");
                      %>
                      <tr>
                          <td><%= no %></td>
                          <td><%= nim_mh %></td>
                          <td><%= nama_mh %></td>
                          <td><%= nama_prodi %></td>
                          <td><%= akt_mh %></td>
                          <td>
                              <div class="btn-group">  
                                <a href="proses.jsp?aksi=delete_mhs&nim=<%= nim_mh %>" class="btn btn-mini btn-danger" rel="tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Delete Admin"> <i class="icon-remove icon-white"></i> </a> 
                                <a href="edit_mahasiswa.jsp?nim=<%= nim_mh %>" class="btn btn-mini btn-info" rel="tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Edit Mahasiswa"> <i class="icon-edit icon-white"></i> </a>
                              </div>
                          </td>
                      </tr>
                      <%
                      no++;
                      }
                      %>
                  </tbody>
            </table>
            </p>
        </div>
        
        <div class="well">
            <p style='font-size: 16px;color:red'>Tambah Mahasiswa Baru</p>
            <p>
            <form action='proses.jsp' method="post">
                Nim :
                <input placeholder="Masukan Berupa Angka" required type="text" name="nim" class="span12"/>
                Nama :
                <input type="text" required="" name="nama" class="span12"/>
                Prodi :
                <select name='prodi' style='width:100%'>
                    <%
                    ResultSet sql2;
                    sql2 = st.executeQuery("select * from prodi");
                    while(sql2.next()){
                        String nama_prodi = sql2.getString("nama_prodi");
                        String id_prodi = sql2.getString("id");
                        out.print("<option value='"+ id_prodi +"'>"+ nama_prodi +"</option>");
                    }
                    %>
                </select>
                Angkatan :
                <select name='angkatan' style='width:100%'>
                    <%
                    int tahunmulai = 2006;
                    while (tahunmulai <= 2013){
                        out.print("<option>"+ tahunmulai +"</option>");
                        tahunmulai++;
                    }
                    %>
                </select> 
                <input type='hidden' value="tambah_mhs" name="aksi"/>
                <input type="submit"  class="btn btn-primary" value="Tambah"/>
            </form>
            </p>
        </div>
    </div>   
<%@include file="footer.jsp" %>                
</div>               
</div>               
</body>
</html>