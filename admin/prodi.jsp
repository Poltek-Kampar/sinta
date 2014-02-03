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
            List Semua Program Studi
            <table class="table table-bordered table-striped table-hover">
                  <thead>
                    <tr>
                      <th style="width:30px;">No</th>
                      <th>Nama Program Studi</th>
                      <th>Action</th>
                    </tr>
                  <tbody>
                      
                      <%
                      ResultSet sql1;
                      ResultSet data1;
                      sql1 = st.executeQuery("select * from prodi");
                      int no = 1;
                      while(sql1.next()){
                          int id_prodi = sql1.getInt("id");
                          String nama_prodi = sql1.getString("nama_prodi");
                      %>
                      <tr>
                          <td><%= no %></td>
                          <td><%= nama_prodi %></td>
                          <td>
                              <div class="btn-group">
                                <a href="proses.jsp?aksi=delete_prodi&id=<%= id_prodi %>" class="btn btn-mini btn-danger" rel="tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Delete Dosen"> <i class="icon-remove icon-white"></i> </a> 
                                <a href="edit_prodi.jsp?id=<%= id_prodi %>" class="btn btn-mini btn-info" rel="tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Edit Prodi"> <i class="icon-edit icon-white"></i> </a> 
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
            <p style='font-size: 16px;color:red'>Tambah Prodi Baru</p>
            <p>
            <form action='proses.jsp' method="post">
                Nama Prodi :
                <input required type="text" name="nama" class="span12"/>
                <input required type="hidden" name="aksi" value="tambah_prodi"/>
                <input type="submit" class="btn btn-primary" value="Tambah"/>
            </form>
            </p>
        </div>
    </div>
    <%@include file="footer.jsp" %>                
</div>
</div>
</body>
</html>