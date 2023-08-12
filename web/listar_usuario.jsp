<%-- 
    Document   : Listar_Usuario
    Created on : 03/06/2023, 15:58:39
    Author     : Leandro
--%>

<%@page import= "model.Usuario"%>
<%@page import= "model.UsuarioDAO"%>
<%@page import= "java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    ArrayList<Usuario> lista = new ArrayList<>();
    try {
        UsuarioDAO uDAO = new UsuarioDAO();
        lista = uDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/index.css" type="text/css" />
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <script type="text/javascript">
      function desativarUsuario(idUsuario, nome) {
        if (confirm("Realmente deseja desativar o usuario: " + nome + "?")) {
          window.open("desativar_usuario.do?idUsuario=" + idUsuario, "_self");
        }
      }

      function ativarUsuario(idUsuario, nome) {
        if (confirm("Realmente deseja ativar o usuario: " + nome + "?")) {
          window.open("ativar_usuario.do?idUsuario=" + idUsuario, "_self");
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
                <div class="card-header"> Usuarios </div>
              </div>
              <div class="card-body">
                <table id="datatablesSimple">
                  <thead>
                    <tr>
                      <th>Id</th>
                      <th>Nome</th>
                      <th>Login</th>
                      <th>Perfil</th>
                      <th>Email</th>
                      <th>CPF</th>
                      <th>Status</th>
                      <th>Opções</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Id</th>
                      <th>Nome</th>
                      <th>Login</th>
                      <th>Perfil</th>
                      <th>Email</th>
                      <th>CPF</th>
                      <th>Status</th>
                      <th>Opções</th>
                    </tr>
                  </tfoot>
                  <tbody><%
                for (Usuario u : lista) {
            %> <tr>
                      <td><%= u.getIdUsuario()%> </td>
                      <td><%= u.getNome()%> </td>
                      <td><%= u.getLogin()%> </td>
                      <td><%= u.getPerfil().getNome()%> </td>
                      <td><%= u.getEmail()%> </td>
                      <td><%= u.getCpf()%> </td>
                      <td><%
                        if (u.getStatus() == 1) {
                    %> Ativo <%
                    } else {
                    %> Inativo <%
                        }
                    %> </td>
                      <td>
                        <a href="form_alterar_usuario.jsp?idUsuario=<%=u.getIdUsuario()%>" class="btn btn-primary btn-sm" role="button">Alterar&nbsp; <i class="fa-solid fa-pen-to-square"></i>
                        </a><%
                            if (u.getStatus() == 1) {
                        %> <button class="btn btn-danger btn-sm" onclick="desativarUsuario(<%= u.getIdUsuario()%>, '<%= u.getNome()%>')">Desativar&nbsp; <i class="fas fa-user fa-user-minus"></i>
                        </button><%
                        } else {
                        %> <button class="btn btn-success btn-sm" onclick="ativarUsuario(<%= u.getIdUsuario()%>, '<%= u.getNome()%>')">Ativar&nbsp; <i class="fas fa-user-shield"></i>
                        </button><%
                            }
                        %>
                      </td>
                    </tr>
                    <% }
                    %>
                  </tbody>
                </table>
                <div class="col-12" style="padding-bottom: 15px">
                  <a href="form_cadastrar_usuario.jsp" class="btn btn-success btn-md" role="button">Novo Usuário&nbsp; 
                  <i class="fas fa-user fa-user-plus"></i>
                  </a>
              </div>
            </div>
            </div>
          </main>
        </div>
      </div>
    </div>
  </body>
</html>