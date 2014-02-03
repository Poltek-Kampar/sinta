<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@include file="admin/koneksi.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String nrp = request.getParameter("nrp");
ResultSet sql1 = st.executeQuery("select * from dosen where nrp_dsn='"+ nrp +"'");
sql1.next();
String nama_dsn = sql1.getString("nama_dsn");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Dosen <%= nama_dsn %></title>
<meta name='author' content='andri'/>
<meta name='description' content='sistem informasi'/>
<link href="Assets/bootstrap.css" rel="stylesheet">
</head>
<body bgcolor='#dcdcdc'>
<div class='container-fluid' style='margin-top:60px;'>
<div class="navbar navbar-fixed-top">
	      <div class="navbar-inner">
	        <div class="container-fluid">
	          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </a>
	          
	          <div class="nav-collapse">
	            <ul class="nav">
	              <li><a href="index.jsp">Home</a></li>
	              <li><a href="admin">Admin</a></li>
	            </ul>
				<form class="navbar-search pull-right" action="cari.jsp" method="get">
						<div class="input-prepend">
						<div class="add-on"><i class="icon icon-search"></i></div><input placeholder="Search..." class="tipsy-atas" type="text" required name="q" id="search" title="Search Article here" style='width:125px'>
						</div>
				</form>
	          </div><!--/.nav-collapse -->
	        </div>
	      </div>
</div>
<div class="row-fluid">
    <div class="span12">
        <div class="well" style='min-height: 300px'>
           <h5><%= nama_dsn %></h5>
           <p>
               <%
                      ResultSet sqlcek;
                      sqlcek = st.executeQuery("SELECT t. * , m. * FROM tugas_akhir t, mahasiswa m WHERE t.NRP1 = '"+ nrp +"' OR t.NRP2 = '"+ nrp +"' AND m.nim_mh = t.nim_mh");
                      if(sqlcek.next()){
                      out.print("Siswa Yang Di Bimbing");
                      %>
           <table class="table table-bordered table-striped table-hover">
                  <thead>
                    <tr>
                      <th style="width:30px;">No</th>
                      <th>Nim Mahasiswa</th>
                      <th>Nama Mahasiswa</th>
                      <th>Judul TA</th>

                    </tr>
                  <tbody>
                      <%
                                           }else{ out.print("Tidak Ada Siswa Yang Di Bimbing");
                                            }
                      ResultSet sql2;
                      sql1 = st.executeQuery("SELECT t. * , m. * FROM tugas_akhir t, mahasiswa m WHERE  t.NRP1 = '"+ nrp +"' and m.nim_mh = t.nim_mh OR t.NRP2 = '"+ nrp +"' and m.nim_mh = t.nim_mh");
                      int no = 1;
                      while(sql1.next()){
                          String nim_mh = sql1.getString("nim_mh");
                          String judul = sql1.getString("judul");
                          String nama_mahasiswa = sql1.getString("nama_mh");
                      %>
                      <tr>
                          <td><%= no %></td>
                          <td><%= nim_mh %></td>
                          <td><%= nama_mahasiswa %></td>
                          <td><a href="lihat.jsp?nim=<%= nim_mh %>"><%= judul %></a></td>
                      </tr>
                      <%
                      no++;
                      }
                      %>
                  </tbody>
            </table>
                  <a href='javascript:history.back()' class='pull-right btn btn-primary'>Back</a>
           </p> 
        </div>
    </div>
    
    <footer>
	<div class="row-fluid" align='center'>
	
		<div class="span12">
			<div class="well">
				<div class="row">
					&copy;  Andri Nofiar.AM
				</div>
			</div>
		</div>
	</div>
    </footer>
</div>
</div>
</body>
</html>