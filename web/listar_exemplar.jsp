<%-- 
    Document   : listar_exemplar
    Created on : 17/06/2023, 18:39:33
    Author     : Leandro
--%>

<%@page import="model.Livro"%>
<%@page import="model.LivroDAO"%>
<%@page import= "model.Exemplar"%>
<%@page import= "model.ExemplarDAO"%>
<%@page import= "java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    ArrayList<Exemplar> lista = new ArrayList<>();
    try {
        ExemplarDAO exDAO = new ExemplarDAO();
        lista = exDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        
        <script type="text/javascript">
            function desativarExemplar(idExemplar) {
                if (confirm("Realmente deseja desativar o exemplar?")) {
                    window.open("desativar_exemplar.do?idExemplar=" + idExemplar, "_self");
                }
            }
            function ativarExemplar(idExemplar) {
                if (confirm("Realmente deseja ativar o exemplar?")) {
                    window.open("ativar_exemplar.do?idExemplar=" + idExemplar, "_self");
                }
            }
            function excluirExemplar(idExemplar){
             if (confirm("Realmente deseja excluir o exemplar?")){
                 window.open("excluir_exemplar.do?idExemplar="+ idExemplar, "_self");
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
        <div class="card-header"> Exemplares </div>
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Livro</th>
                        <th>Quantidade de Exemplar</th>
                        <th>Conservação</th>
                        <th>Status</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Livro</th>
                        <th>Quantidade de Exemplar</th>
                        <th>Conservação</th>
                        <th>Status</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                <tbody>
            <%
                for (Exemplar ex : lista) {
            %> 
            <tr>
                <td>
                    <%= ex.getIdExemplar()%>
                </td>
                <td>
                    <%= ex.getLivro().getTitulo()%>
                </td>
                <td>
                    <%= ex.getQuantExemplar()%>
                </td>
                <td>
                    <%= ex.getConservacao()%>
                </td>
                <td>
                    <%
                        if (ex.getStatus() == 1) {
                    %>
                    Ativo
                    <%
                    } else {
                    %>
                    Inativo
                    <%
                        }
                    %>
                </td>
                <td align="center" >
                    <a href="form_alterar_exemplar.jsp?idExemplar=<%=ex.getIdExemplar()%>"class="btn btn-primary btn-sm" role="button">Alterar&nbsp;
                        <i class="fa-solid fa-pen-to-square"></i></a>
                        <%
                            if (ex.getStatus() == 1) {
                        %>
                    <button class="btn btn-danger btn-sm" onclick="desativarExemplar(<%= ex.getIdExemplar()%>)">Desativar&nbsp;
                        <i class="fas fa-user fa-user-minus"></i></button> 
                        <%
                        } else {
                        %>
                    <button class="btn btn-success btn-sm" onclick="ativarExemplar(<%= ex.getIdExemplar()%>)">Ativar&nbsp;
                        <i class="fas fa-user-shield"></i></button>
                        <%
                            }
                        %>
                    <button class="btn btn-danger btn-sm" onclick="excluirExemplar(<%= ex.getIdExemplar() %>)">Excluir&nbsp;
                    <i class="fas fa-user fa-user-minus"></i></button> 
                </td>
            </tr>
            <% }
            %>
            </tr>
            </tbody>
            </table>
            <a href="form_cadastrar_exemplar.jsp" class="btn btn-success btn-md" role="button">Novo Exemplar&nbsp;
            <i class="fas fa-user fa-user-plus"></i></a>
        </div>
            </main>
        </div>
        </div>
        </div>
</body>
</html>
