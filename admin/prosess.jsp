<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.Date" %>
<%@include file="ceksession.jsp" %>
<%@include file="koneksi.jsp" %>
<%
String aksi = request.getParameter("aksi");
if (aksi.equalsIgnoreCase("edit_dsn")){
String nama_dsn = request.getParameter("nama");
String nidn_dsn = request.getParameter("nidn");
String nrp_dsn = request.getParameter("nrp");
String alamat_dsn = request.getParameter("alamat");
String email_dsn = request.getParameter("email");
String no_tlp_dsn = request.getParameter("telp");
String id_prodi = request.getParameter("id_prodi");
st.executeUpdate("update dosen set nama_dsn='"+ nama_dsn +"', nidn_dsn='"+ nidn_dsn +"', alamat_dsn='"+ alamat_dsn +"', email_dsn='"+ email_dsn +"', telpon_dsn='"+ no_tlp_dsn +"', id_prodi='"+ id_prodi +"' where nrp_dsn='"+ nrp_dsn +"'");
response.sendRedirect("../DosenControl?action=edit&nrp="+ nrp_dsn);
}

if (aksi.equalsIgnoreCase("edit_prodi")){
String nama_prodi = request.getParameter("nama");
String id = request.getParameter("id");
st.executeUpdate("update prodi set nama_prodi='"+ nama_prodi +"' where id='"+ id +"'");
response.sendRedirect("../ProdiControl?action=edit&id="+ id);
}

if (aksi.equalsIgnoreCase("edit_mhs")){
String nim_mhs = request.getParameter("nim");
String nama_mhs = request.getParameter("nama");
String prodi_mhs = request.getParameter("prodi");
String angkatan = request.getParameter("angkatan");
st.executeUpdate("update mahasiswa set nama_mh='"+ nama_mhs +"', id_prodi='"+ prodi_mhs +"', angkatan='"+ angkatan +"' where nim_mh='"+ nim_mhs +"'");
response.sendRedirect("../MahasiswaControl?action=edit&nim="+ nim_mhs);
}

if (aksi.equalsIgnoreCase("edit_ta")){
String nim_mhs = request.getParameter("nim");
String judul = request.getParameter("judul");
String nrp1 = request.getParameter("nrp1");
String nrp2 = request.getParameter("nrp2");
String abs = request.getParameter("abstrak");
Date tanggal = new Date();
int dd = tanggal.getDate();
int mm = tanggal.getMonth();
int yy = tanggal.getYear();
st.executeUpdate("update tugas_akhir set judul='"+ judul +"', NRP1='"+ nrp1 +"', NRP2='"+ nrp2 +"', abstrak='"+ abs +"' where nim_mh='"+ nim_mhs +"'");
response.sendRedirect("../TAControl?action=edit&nim="+ nim_mhs);
}

if (aksi.equalsIgnoreCase("edit_am")){
String nama = request.getParameter("nama");
String pass = request.getParameter("pass");
st.executeUpdate("update admin set username='"+ nama +"', pass='"+ pass +"' where username='"+ session.getAttribute("admin") +"'");
session.setAttribute("admin", nama);
response.sendRedirect("../AdminControl?action=edit&nama="+ nama);
}
%>