<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.Date" %>
<%@include file="ceksession.jsp" %>
<%@include file="koneksi.jsp" %>
<%
String aksi = request.getParameter("aksi");
if (aksi.equalsIgnoreCase("tambah_prodi")){
String nama_prodi = request.getParameter("nama");
ResultSet sql_cek_prodi = st.executeQuery("select * from prodi where nama_prodi='"+ nama_prodi +"'");
if (sql_cek_prodi.next()){
response.sendRedirect("../ProdiControl?action=error&nama="+ nama_prodi);    
}else{
st.executeUpdate("insert into prodi(nama_prodi) values ('"+ nama_prodi +"')");
response.sendRedirect("../ProdiControl?action=tambah&nama="+ nama_prodi);
}}

if (aksi.equalsIgnoreCase("delete_prodi")){
String id = request.getParameter("id");
st.execute("delete from prodi where id='"+ id +"'");
response.sendRedirect("../ProdiControl?action=delete&id="+ id);
}

if (aksi.equalsIgnoreCase("tambah_mhs")){
String nim_mhs = request.getParameter("nim");
String nama_mhs = request.getParameter("nama");
String prodi_mhs = request.getParameter("prodi");
String angkatan = request.getParameter("angkatan");
ResultSet sql_cek_tambah_mhs = st.executeQuery("select * from mahasiswa where nim_mh='"+ nim_mhs +"'");
if (sql_cek_tambah_mhs.next()){
response.sendRedirect("../MahasiswaControl?action=error&nim="+ nim_mhs);  
}else{
st.executeUpdate("insert into mahasiswa values ('"+ nim_mhs +"', '"+ nama_mhs +"', '"+ prodi_mhs +"', '"+ angkatan +"')");
response.sendRedirect("../MahasiswaControl?action=tambah&nim="+ nim_mhs);
}}

if (aksi.equalsIgnoreCase("delete_mhs")){
String nim = request.getParameter("nim");
st.execute("delete from mahasiswa where nim_mh='"+ nim +"'");
st.execute("delete from tugas_akhir where nim_mh='"+ nim +"'");
response.sendRedirect("../MahasiswaControl?action=delete&nim="+ nim);
}

if (aksi.equalsIgnoreCase("tambah_dsn")){
String nama_dsn = request.getParameter("nama");
String nidn_dsn = request.getParameter("nidn");
String nrp_dsn = request.getParameter("nrp");
String alamat_dsn = request.getParameter("alamat");
String email_dsn = request.getParameter("email");
String no_tlp_dsn = request.getParameter("telp");
String id_prodi = request.getParameter("id_prodi");
String lanjut = "nol";
if (nidn_dsn.equalsIgnoreCase("-")){
    lanjut = "satu";
}
if (lanjut.equalsIgnoreCase("nol")){
ResultSet sql_cek_tambah_dsn_nidn = st.executeQuery("select * from dosen where nidn_dsn='"+ nidn_dsn +"'");
if (sql_cek_tambah_dsn_nidn.next()){
response.sendRedirect("../DosenControl?action=error2&nidn="+ nidn_dsn);  
}else{
ResultSet sql_cek_tambah_dsn = st.executeQuery("select * from dosen where nrp_dsn='"+ nrp_dsn +"'");
if (sql_cek_tambah_dsn.next()){
response.sendRedirect("../DosenControl?action=error&nrp="+ nrp_dsn);  
}else{
st.executeUpdate("insert into dosen(nrp_dsn, nama_dsn, nidn_dsn, alamat_dsn, email_dsn, telpon_dsn, id_prodi) values ('"+ nrp_dsn +"', '"+ nama_dsn +"', '"+ nidn_dsn +"', '"+ alamat_dsn +"', '"+ email_dsn +"', '"+ no_tlp_dsn +"', '"+ id_prodi +"')");
response.sendRedirect("../DosenControl?action=tambah&nama="+ nama_dsn);
}}}
else{
st.executeUpdate("insert into dosen(nrp_dsn, nama_dsn, nidn_dsn, alamat_dsn, email_dsn, telpon_dsn, id_prodi) values ('"+ nrp_dsn +"', '"+ nama_dsn +"', '"+ nidn_dsn +"', '"+ alamat_dsn +"', '"+ email_dsn +"', '"+ no_tlp_dsn +"', '"+ id_prodi +"')");
response.sendRedirect("../DosenControl?action=tambah&nama="+ nama_dsn);   
}
}

if (aksi.equalsIgnoreCase("delete_dsn")){
String id = request.getParameter("id");
st.execute("delete from dosen where nrp_dsn='"+ id +"'");
response.sendRedirect("../DosenControl?action=delete&nrp="+ id);
}
if (aksi.equalsIgnoreCase("tambah_ta")){
String nim_mhs = request.getParameter("nim");
String judul = request.getParameter("judul");
String nrp1 = request.getParameter("nrp1");
String nrp2 = request.getParameter("nrp2");
String abs = request.getParameter("abstrak");
Date tanggal = new Date();
ResultSet sql_cek_ta = st.executeQuery("select * from tugas_akhir where nim_mh='"+ nim_mhs +"'");
if (sql_cek_ta.next()){
response.sendRedirect("../TAControl?action=error&nim="+ nim_mhs);    
}else{
st.executeUpdate("insert into tugas_akhir values ('"+ nim_mhs +"', '"+ judul +"', '"+ nrp1 +"', '"+ nrp2 +"', '"+ abs +"')");
response.sendRedirect("../TAControl?action=tambah&nim="+ nim_mhs);
}}

if (aksi.equalsIgnoreCase("delete_ta")){
String nim = request.getParameter("nim");
st.execute("delete from tugas_akhir where nim_mh='"+ nim +"'");
response.sendRedirect("../TAControl?action=delete&nim="+ nim);
}

if (aksi.equalsIgnoreCase("tambah_am")){
String nama_admin = request.getParameter("nama");
String pass = request.getParameter("pass");
ResultSet sql_cek_admin = st.executeQuery("select * from admin where username='"+ nama_admin +"'");
if (sql_cek_admin.next()){
response.sendRedirect("../AdminControl?action=error&nama="+ nama_admin);    
}else{
st.executeUpdate("insert into admin(username, pass) values ('"+ nama_admin +"', '"+ pass +"')");
response.sendRedirect("../AdminControl?action=tambah&nama="+ nama_admin);
}}

if (aksi.equalsIgnoreCase("delete_am")){
String nama_admin = request.getParameter("nama");
        st.execute("delete from admin where username='"+ nama_admin +"'");
        response.sendRedirect("../AdminControl?action=delete&nama="+ nama_admin +"");
}
%>