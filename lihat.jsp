<%@include file="admin/koneksi.jsp" %>
<%
String nim = request.getParameter("nim");
ResultSet sql1;
sql1 = st.executeQuery("select * from tugas_akhir where nim_mh='"+ nim +"'");
sql1.next();
String judul = sql1.getString("judul");
String nrp1 = sql1.getString("nrp1");
String nrp2 = sql1.getString("nrp2");
String abs = sql1.getString("abstrak");
ResultSet sql2;
sql2 = st.executeQuery("SELECT p.*, m.* from prodi p, mahasiswa m where p.id=m.id_prodi AND nim_mh='"+ nim +"'");
sql2.next();
String nama_mh = sql2.getString("nama_mh");
String prodi_mh = sql2.getString("nama_prodi");
String angkatan = sql2.getString("angkatan");
ResultSet sql3;
String dosen_a;
sql3 = st.executeQuery("select * from dosen where nrp_dsn='"+ nrp1 +"'");
if (sql3.next()){
dosen_a = sql3.getString("nama_dsn");
}else{
dosen_a = "-";
}
ResultSet sql4;
String dosen_b;
sql4 = st.executeQuery("select * from dosen where nrp_dsn='"+ nrp2 +"'");
if (sql4.next()){
dosen_b = sql4.getString("nama_dsn");
}else{
dosen_b = "-";
}
%>
<!DOCTYPE html>
<html>
<head>
<title>SINTA POLKAM - Lihat Detail <%= judul %></title>
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
        <div class="well">
            <table>
                <tr>
                    <td width='200px'>Nama Mahasiswa</td>
                    <td width='100px;'> : </td>
                    <td><%=nama_mh%></td>
                </tr>
                <tr>
                    <td>Nim Mahasiswa</td>
                    <td> : </td>
                    <td><%=nim%></td>
                </tr>
                <tr>
                    <td>Program Studi Mahasiswa</td>
                    <td>:</td>
                    <td><%=prodi_mh%></td>
                </tr>
                <tr>
                    <td>Dosen Pembimbing 1</td>
                    <td>:</td>
                    <td><%=dosen_a%></td>
                </tr>
                <tr>
                    <td>Dosen Pembimbing 2</td>
                    <td>:</td>
                    <td><%=dosen_b%></td>
                </tr>
            </table>
            
        </div>
        <div class="well" style="min-height: 200px"> 
            <h3><%= judul %></h3>
            
            <p><%= abs %>
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