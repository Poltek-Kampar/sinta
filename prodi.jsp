<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@include file="admin/koneksi.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
ResultSet sql1 = st.executeQuery("select * from prodi where id='"+ id +"'");
sql1.next();
String nama_prodi = sql1.getString("nama_prodi");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Program Studi <%= nama_prodi %></title>
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
           <h5><%= nama_prodi %></h5>
           <p>
               <%
                      ResultSet sqlcek;
                      sqlcek = st.executeQuery("select * from dosen where id_prodi='"+ id +"'");
                      int no = 1;
                      if(sqlcek.next()){
                 %>
           <table class="table table-bordered table-striped table-hover">
                  <thead>
                    <tr>
                      <th style="width:30px;">No</th>
                      <th>NIDN Dosen</th>
                      <th>NRP Dosen</th>
                      <th>Nama Dosen</th>
                      <th>Alamat</th>
                      <th>Email</th>
                      <th>No Telepon</th>
                    </tr>
                  <tbody>
                      <%
                      }else{
                      out.print("Tidak Ada Dosen Di Program Studi ini");
                      }
                      ResultSet sql2;
                      sql1 = st.executeQuery("select * from dosen where id_prodi='"+ id +"'");
                      while(sql1.next()){
                          String nidn = sql1.getString("nidn_dsn");
                          String nrp = sql1.getString("nrp_dsn");
                          String nama_dsn = sql1.getString("nama_dsn");
                          String alamat_dsn = sql1.getString("alamat_dsn");
                          String email = sql1.getString("email_dsn");
                          String tlp = sql1.getString("telpon_dsn");
                      %>
                      <tr>
                          <td><%= no %></td>
                          <td><%= nidn %></td>
                          <td><%= nrp %></td>
                          <td><a href="dosen.jsp?nrp=<%= nrp %>"><%= nama_dsn %></a></td>
                          <td><%= alamat_dsn %></td>
                          <td><%= email %></td>
                          <td><%= tlp %></td>
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