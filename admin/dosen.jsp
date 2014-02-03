<!DOCTYPE html>
<%@ include file="ceksession.jsp" %>
<%@include file="koneksi.jsp" %>
<%
ResultSet sql_dosen;
sql_dosen = st.executeQuery("select * from dosen");
while (sql_dosen.next()){
int jumlah = sql_dosen.getRow() + 1;
jumlah = jumlah - 1;
request.setAttribute("jumlah_dosen", jumlah);
}
//out.print(request.getAttribute("jumlah_dosen"));
int data_perpage = 5;
String laman = request.getParameter("page");
%>
<html>
<head>
<title>Welcome <%= session.getAttribute("admin") %> - Dosen</title>
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
            <p style='font-size: 16px;color:red'>List Semua Dosen</p>
            <p>    
            <table class="border">
                <table class="table table-bordered table-striped table-hover">
                  <thead>
                    <tr>
                      <th style="width:30px;">No</th>
                      <th>Nama</th>
                      <th>NIDN</th>
                      <th>NRP</th>
                      <th>Alamat</th>
                      <th>Email</th>
                      <th>Telepon</th>
                      <th>Action</th>
                    </tr>
                  <tbody>
                      <%
                      ResultSet sql1;
                      ResultSet data1;
                      sql1 = st.executeQuery("select * from dosen");
                      int no = 1;
                      while(sql1.next()){
                          int id_dosen = sql1.getInt("nrp_dsn");
                          String nama_dosen = sql1.getString("nama_dsn");
                          String nidn_dosen = sql1.getString("nidn_dsn");
                          String nrp_dosen = sql1.getString("nrp_dsn");
                          String alamat_dosen = sql1.getString("alamat_dsn");
                          String email_dosen = sql1.getString("email_dsn");
                          String telp_dosen = sql1.getString("telpon_dsn");
                      %>
                      <tr>
                          <td><%= no %></td>
                          <td><%= nama_dosen %></td>
                          <td><%= nidn_dosen %></td>
                          <td><%= nrp_dosen %></td>
                          <td><%= alamat_dosen %></td>
                          <td><%= email_dosen %></td>
                          <td><%= telp_dosen %></td>
                          <td>
                              <div class="btn-group">
                                <a href="proses.jsp?aksi=delete_dsn&id=<%= id_dosen %>" class="btn btn-mini btn-danger" rel="tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Delete Dosen"> <i class="icon-remove icon-white"></i> </a>
                                <a href="edit_dosen.jsp?id=<%= id_dosen %>" class="btn btn-mini btn-info" rel="tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Edit Dosen"> <i class="icon-edit icon-white"></i> </a> 
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
            <p style='font-size: 16px;color:red'>Tambah Dosen Baru</p>
            <p>
            <form action='proses.jsp' method="post">
                Nama :
                <input required type="text" name="nama" class="span12"/>
                NIDN :
                <input placeholder="Masukan Berupa Angka" required type="text" name="nidn" class="span12"/>
                NRP :
                <input placeholder="Masukan Berupa Angka" required type="text" name="nrp" class="span12"/>
                Alamat :
                <input type="text" name="alamat" class="span12"/>
                Email :
                <input type="text" name="email" class="span12"/>
                No Telepon :
                <input placeholder="Masukan Berupa Angka" type="text" name="telp" class="span12"/>
                Prodi :
                <select name='id_prodi' style='width:100%'>
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
                <input type='hidden' name='aksi' value='tambah_dsn'/>
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