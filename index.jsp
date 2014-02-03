<%@include file="admin/koneksi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Welcome To SINTA POLKAM</title>
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
	              <li class="active"><a href="index.jsp">Home</a></li>
	              <li><a href="admin">Admin</a></li>
	            </ul>
	          </div><!--/.nav-collapse -->
	        </div>
	      </div>
</div>
<div class="row-fluid">
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
        <div class="well" style='min-height: 435px'>
            <center>
            <form action="cari.jsp" method="get">
            <div style='margin-top:15%'>
                <div class="input-prepend">
                <dewa class="add-on"><i class="icon icon-search"></i></dewa><input placeholder="Search..." class="tipsy-atas" type="text" required name="q" id="search" title="Search TA here" style='width:525px'>
		</div>
                <button style='margin-top:-10px;height:28px;margin-left: 5px;padding-top: 2px;' class='btn btn-primary'>Cari</button>
            </div>
            </form>
            </center>
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