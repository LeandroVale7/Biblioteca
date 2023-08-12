<%-- 
    Document   : sair
    Created on : 17/06/2023, 09:14:25
    Author     : Leandro
--%>
<%
    session.removeAttribute("usuario");
    response.sendRedirect("login.jsp");
%>
