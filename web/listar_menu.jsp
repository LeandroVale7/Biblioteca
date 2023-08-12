<%-- 
    Document   : listar_menu
    Created on : 15/06/2023, 21:23:49
    Author     : Leandro
--%>

<%@page import= "model.Menu"%>
<%@page import= "model.MenuDAO"%>
<%@page import= "java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    ArrayList<Menu> lista = new ArrayList<>();
    try {
        MenuDAO mDAO = new MenuDAO();
        lista = mDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/index.css" type="text/css" />
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    
    <script type="text/javascript">
      function excluirMenu(idMenu, nome) {
        if (confirm("Realmente deseja excluir o menu: " + nome + "?")) {
          window.open("excluir_menu.do?idMenu=" + idMenu, "_self");
        }
      }
    </script>
    
  </head>
  <body>
      <%@include file="index.jsp"%>
      <div class="grid-container">
      <div id="layoutSidenav">
        <div id="layoutSidenav_content">
          <main>
            <div class="container-fluid px-4"></div>
            <div class="card mb-4">
              <div class="title-font-style">
                <div class="card-header"> Menus </div>
              </div>
              <div class="card-body">
                <table id="datatablesSimple">
                  <thead>
                    <tr>
                      <th>Id</th>
                      <th>Título</th>
                      <th>Link</th>
                      <th>Opções</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Id</th>
                      <th>Título</th>
                      <th>Link</th>
                      <th>Opções</th>
                    </tr>
                  </tfoot>
                  <tbody><%
                for (Menu m : lista) {
            %> <tr>
                      <td><%= m.getIdMenu()%> </td>
                      <td><%= m.getTitulo()%> </td>
                      <td><%= m.getLink()%> </td>
                      <td align="center">
                        <a href="form_alterar_menu.jsp?idMenu=<%=m.getIdMenu()%>" class="btn btn-primary btn-sm" role="button">Alterar <i class="fa-solid fa-pen-to-square"></i>
                        </a>
                        <a href="#" onclick="excluirMenu(<%= m.getIdMenu() %>, '<%= m.getTitulo() %>')" class="btn btn-danger btn-sm" role="button">Excluir <i class="fas fa-user fa-user-minus"></i>
                        </a>
                      </td>
                    </tr>
                    <% }
                    %>
                  </tbody>
                </table>
                <a href="form_cadastrar_menu.jsp" class="btn btn-success btn-md" role="button">Novo Menu&nbsp; 
                <i class="fas fa-user fa-user-plus"></i>
                </a>
              </div>
            </div>
          </main>
        </div>
      </div>
    </div>
  </body>
</html>