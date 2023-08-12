<%@page import= "model.Emprestimo"%>
<%@page import= "model.EmprestimoDAO"%>
<%@page import= "java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%
    ArrayList<Emprestimo> lista = new ArrayList<>();
    try {
        EmprestimoDAO emDAO = new EmprestimoDAO();
        lista = emDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scale=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/styles.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        
        <script type="text/javascript">
            function excluirEmprestimo(idEmprestimo) {
                if (confirm("Realmente deseja excluir o emprestimo?")) {
                    window.open("excluir_emprestimo.do?idEmprestimo=" + idEmprestimo, "_self");
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
        <div class="card-header"> Empréstimos </div>
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Data de Empréstimo</th>
                        <th>Data de Devolução</th>
                        <th>Exemplar</th>
                        <th>Usuário</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Data de Empréstimo</th>
                        <th>Data de Devolução</th>
                        <th>Exemplar</th>
                        <th>Usuário</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                <tbody>
            <%
                for (Emprestimo em : lista) {
            %> 
            <tr>
                <td>
                    <%= em.getIdEmprestimo()%>
                </td>
                <td>
                    <fmt:formatDate pattern="dd/MM/yyyy" value="<%= em.getDataEmprestimo()%>"/>
                </td>
                <td>
                    <fmt:formatDate pattern="dd/MM/yyyy" value="<%= em.getDataDevolucao()%>"/>
                </td>
                <td>
                    <%= em.getExemplar().getIdExemplar()%>
                </td>
                <td>
                    <%= em.getUsuario().getNome()%>
                </td>
                <td align="center" >
                    <a href="form_alterar_emprestimo.jsp?idEmprestimo=<%=em.getIdEmprestimo()%>" class="btn btn-primary btn-sm" role="button">Alterar&nbsp;
                    <i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="#" onclick="excluirEmprestimo(<%= em.getIdEmprestimo()%>)"class="btn btn-danger btn-sm" role="button">Excluir
                    <i class="fas fa-user fa-user-minus"></i></a>
                </td>
            </tr>
            <% }
            %>
            </tbody>
            </table>
            <a href="form_cadastrar_emprestimo.jsp" class="btn btn-success btn-md" role="button">Novo Empréstimo&nbsp;
            <i class="fas fa-user fa-user-plus"></i></a>
        </div>
            </main>
        </div>
        </div>
        </div>
</body>
</html>
