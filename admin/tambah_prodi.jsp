<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@include file="koneksi.jsp" %>
<%
String nama_prodi = request.getParameter("nama");
st.executeUpdate("insert into prodi(nama_prodi) values ('"+ nama_prodi +"')");
response.sendRedirect("../ProdiControl?action=tambah&nama="+ nama_prodi);
%>