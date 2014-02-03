<!DOCTYPE html>
<%@ include file="ceksession.jsp" %>
<%@ include file="koneksi.jsp" %>
<html>
<head>
<title>Welcome <%= session.getAttribute("admin") %> - TA</title>
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
            LIST SEMUA TA
                <table class="table table-bordered table-striped table-hover">
                  <thead>
                    <tr>
                      <th style="width:30px;">No</th>
                      <th>Nim</th>
                      <th>Judul</th>
                      <th>NRP1</th>
                      <th>Action</th>
                    </tr>
                  <tbody>
                      <%
                      ResultSet sql1;
                      ResultSet data1;
                      sql1 = st.executeQuery("select * from tugas_akhir");
                      int no = 1;
                      while(sql1.next()){
                          String nim = sql1.getString("nim_mh");
                          String judul = sql1.getString("judul");
                          String nrp1 = sql1.getString("nrp1");
                      %>
                      <tr>
                          <td><%= no %></td>
                          <td><%= nim %></td>
                          <td><%= judul %></td>
                          <td><%= nrp1 %></td>
                          <td>
                              <div class="btn-group">
                               <a href="proses.jsp?aksi=delete_ta&nim=<%= nim %>" class="btn btn-mini btn-danger" rel="tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Delete TA"> <i class="icon-remove icon-white"></i> </a>
                                <a href="edit_ta.jsp?nim=<%= nim %>" class="btn btn-mini btn-info" rel="tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Edit TA"> <i class="icon-edit icon-white"></i> </a> 
                               <a href="../lihat.jsp?nim=<%= nim %>" class="btn btn-mini btn-primary" rel="tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Lihat TA"> <i class="icon-search icon-white"></i> </a> 
                              </div>
                           </td>
                      </tr>
                      <%
                      no++;
                      }
                      %>
                  </tbody>
            </table>
        </div>
        <div class="well">
            <p style='font-size: 16px;color:red'>Tambah TA Baru</p>
            <p>
            <form action='proses.jsp' method="post">
                Nim Mahasiswa :
                <input placeholder="Masukan Berupa Angka" type="text" required="" name="nim" class="span12"/>
                Judul TA :
                <input type="text" required="" name="judul" class="span12"/>
                Dosen Pembimbing 1 :
                <select name='nrp1' style='width:100%'>
                    <option value="0">-</option>
                    <%
                    ResultSet sql2;
                    sql2 = st.executeQuery("select * from dosen");
                    while(sql2.next()){
                        String nama_dosen = sql2.getString("nama_dsn");
                        String nrp = sql2.getString("nrp_dsn");
                        out.print("<option value='"+ nrp +"'>"+ nama_dosen +"</option>");
                    }
                    %>
                </select>
                Dosen Pembimbing 2 :
                <select name='nrp2' style='width:100%'>
                    <option value="0">-</option>
                    <%
                    ResultSet sql3;
                    sql3 = st.executeQuery("select * from dosen");
                    while(sql3.next()){
                        String nama_dosen = sql3.getString("nama_dsn");
                        String nrp = sql3.getString("nrp_dsn");
                        out.print("<option value='"+ nrp +"'>"+ nama_dosen +"</option>");
                    }
                    %>
                </select>
                Abstrak :<p>
                <textarea class="ckeditor" name="abstrak"></textarea> <p>
                <input type='hidden' value="tambah_ta" name="aksi"/>
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