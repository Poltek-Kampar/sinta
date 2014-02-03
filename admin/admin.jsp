<!DOCTYPE html>
<%@ include file="ceksession.jsp" %>
<html>
<head>
<title>Welcome <%= session.getAttribute("admin") %> - Admin</title>
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
                <li><a href="prodi.jsp"><i class="icon icon-road"></i>  Prodi</a></li>
                <li class="active"><a href="admin.jsp"><i class="icon icon-wrench"></i>  Admin Configuration</a></li>
                <li><a href="logout.jsp"><i class="icon icon-off"></i>  Logout</a></li>
            </ul>
        </div>
    </div>
    <div class="span9">
        <div class="well">
            <p style='font-size: 16px;color:red'>List Semua Admin</p>
            <p>
            <table class="border">
                <table class="table table-bordered table-striped table-hover">
                  <thead>
                    <tr>
                      <th style="width:30px;">No</th>
                      <th>Nama</th>
                      <th>Action</th>
                    </tr>
                  <tbody>
                      <%@include file="koneksi.jsp" %>
                      <%
                      ResultSet sql1;
                      ResultSet data1;
                      sql1 = st.executeQuery("select * from admin");
                      int no = 1;
                      while(sql1.next()){
                          String nama_admin = sql1.getString("username");
                      %>
                      <tr>
                          <td><%= no %></td>
                          <td><%= nama_admin %></td>
                          <td>
                              <div class="btn-group">
                               <a href="proses.jsp?aksi=delete_am&nama=<%= nama_admin %>" class="btn btn-mini btn-danger" rel="tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Delete Admin"> <i class="icon-remove icon-white"></i> </a>  
                               <a href="edit_admin.jsp?nama=<%= nama_admin %>" class="btn btn-mini btn-info" rel="tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Edit Admin"> <i class="icon-edit icon-white"></i> </a> 
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
            <p style='font-size: 16px;color:red'>Tambah Admin Baru</p>
            <p>
            <form action='proses.jsp' method="post">
                Nama Admin :
                <input required type="text" name="nama" class="span12"/>
                Password Admin :
                <input type="password" required="" name="pass" class="span12"/>
                 <input type="hidden" required="" name="level" value='2' class="span12"/>
                <input type="hidden" required="" name="aksi" value="tambah_am" class="span12"/>
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