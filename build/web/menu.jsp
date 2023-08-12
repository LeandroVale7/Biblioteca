<%@page import="model.Menu"%>
<%@page import="model.Usuario"%>
<%--
    Usuario uLogado = new Usuario();
    try {
        uLogado = (Usuario) session.getAttribute("usuario");
 {
%>
<%  
    }
    out.print(uLogado.getNome());
    }catch (Exception e) {
        response.sendRedirect("index.jsp");
    }
--%>


<%
    Usuario uLogado = new Usuario();
    try {
        uLogado = (Usuario) session.getAttribute("usuario");

        for (Menu mu : uLogado.getPerfil().getMenus()) {
%>
    <div class="menu">
        <ul>
            <a class="nav-link" href="<%=mu.getLink()%>"/><%=mu.getTitulo()%></a>
        </ul>
    </div>
<%  
    }
    }catch (Exception e) {
        response.sendRedirect("login.jsp");
    }
%>
