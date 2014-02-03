<%
if (session.getAttribute("admin") == null){
    response.sendRedirect("index.jsp");
}
%>