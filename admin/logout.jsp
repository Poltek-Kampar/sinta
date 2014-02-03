<%
session.setAttribute("admin", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>