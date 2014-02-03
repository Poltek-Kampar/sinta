<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String q = request.getParameter("q");
%>
<%@include file="admin/koneksi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Cari TA Dengan Keyword <%=q%></title>
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
    <div class="span3">       
        <div class="well">
            <ul class="nav nav-list">
		<li class="nav-header">Program Studi</li>
                <ul class="categories">
                <%
                    ResultSet sql2;
                    ResultSet sql3;
                    sql2 = st.executeQuery("select * from prodi");
                    while(sql2.next()){
                        int id_prodi = sql2.getInt("id");
                        String nama_prodi = sql2.getString("nama_prodi");
                        out.print("<li><a href='prodi.jsp?id="+ id_prodi +"'>"+ nama_prodi +"</a></li>");
                     }
                %> 
                </ul>
            </ul>
        </div>
    </div>
    <div class="span9">
        <div class="well" style='min-height: 300px'>
           <h5>Penelusuran TA Berdasarkan keyword <font color="blue"><%= q %></font></h5>
           <p>
               
            <%
             ResultSet sqlcek;
             sqlcek = st.executeQuery("select * from tugas_akhir where abstrak like '%"+ q +"%' or judul like '%"+ q +"%' or nim_mh like '%"+ q +"%'");    
             if(sqlcek.next()){
             out.print("Hasil Pencarian");
            %>    
           <table class="table table-bordered table-striped table-hover">
                  <thead>
                    <tr>
                      <th style="width:30px;">No</th>
                      <th>Nim</th>
                      <th>Nama Mahasiswa</th>
                      <th>Judul</th>
                    </tr>
                  <tbody>
            <%
            }else{
            out.print("Tidak Di Temudakan Data Apapun berdasarkan keyword <font color='red'>"+ q +"</font>");
                                 }
            %>
                      <%
                      ResultSet sql1;
                      int no = 1; 
                      sql1 = st.executeQuery("SELECT t. * , m. * FROM tugas_akhir t, mahasiswa m WHERE t.nim_mh = m.nim_mh AND `judul` LIKE '%"+q+"%'");    
                      while(sql1.next()){
                          String nim = sql1.getString("nim_mh");
                          String judul = sql1.getString("judul");
                          String nrp1 = sql1.getString("nrp1");
                          String nama_mahasiswa = sql1.getString("nama_mh");
                          
                      %>
                      <tr>
                          <td><%= no %></td>
                          <td><%= nim %></td>
                          <td><%= nama_mahasiswa %></td>
                          <td><a href="lihat.jsp?nim=<%= nim %>"><%= judul %></a></td>
                      </tr>
                      <%
                      no++;
                      }
                      %>
                  </tbody>
            </table>
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