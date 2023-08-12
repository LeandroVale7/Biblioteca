<%-- 
    Document   : listar_autor
    Created on : 17/06/2023, 20:50:07
    Author     : Leandro
--%>

<%@page import= "model.Autor"%>
<%@page import= "model.AutorDAO"%>
<%@page import= "java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    ArrayList<Autor> lista = new ArrayList<>();
    try {
        AutorDAO auDAO = new AutorDAO();
        lista = auDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>

        <script type="text/javascript">
            function excluirAutor(idAutor, nome) {
                if (confirm("Realmente deseja excluir o autor: " + nome + "?")) {
                    window.open("excluir_autor.do?idAutor=" + idAutor, "_self");
                }
            }
        </script>

    </head>
    <body>
        <%@include file="index.jsp"%>      
        <%--@include file="menu.jsp"--%>
        <div class="grid-container">
        <div id="layoutSidenav">
        <div id="layoutSidenav_content">
        <main>
        <div class="container-fluid px-4">
        </div>
        <div class="card mb-4">
              <div class="title-font-style">
                <div class="card-header"> Autores </div>
              </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Sobrenome</th>
                        <th>Biografia</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Sobrenome</th>
                        <th>Biografia</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                <tbody>
            <% for (Autor au : lista) {
            %> 
            <tr>
                <td>
                    <%= au.getIdAutor()%>
                </td>
                <td>
                    <%= au.getNome()%>
                </td>
                <td>
                    <%= au.getSobrenome()%>
                </td>
                <td>
                    <%= au.getBiografia()%>
                </td>
                <td align="center" >
                    <a href="form_alterar_autor.jsp?idAutor=<%=au.getIdAutor()%>"class="btn btn-primary btn-sm" role="button">Alterar
                    <i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="#" onclick="excluirAutor(<%= au.getIdAutor()%>, '<%= au.getNome()%>')"class="btn btn-danger btn-sm" role="button">Excluir
                    <i class="fas fa-user fa-user-minus"></i></a>
                </td>
            </tr>
            <% }
            %>
            </tbody>
            </table>
            <a href="form_cadastrar_autor.jsp" class="btn btn-success btn-md" role="button">Novo Autor&nbsp;
            <i class="fas fa-user fa-user-plus"></i></a>
        </div>
        </div>
            </main>
        </div>
        </div>
        </div>
</body>
</html>
