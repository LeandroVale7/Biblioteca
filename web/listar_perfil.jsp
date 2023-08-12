<%-- 
    Document   : listar_perfil
    Created on : 14/05/2023, 13:18:17
    Author     : Leandro
--%>
<%@page import= "model.Perfil"%>
<%@page import= "model.PerfilDAO"%>
<%@page import= "java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    ArrayList<Perfil> lista = new ArrayList<>();
    try {
        PerfilDAO pDAO = new PerfilDAO();
        lista = pDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css"/>
        <script type="text/javascript">
            function excluirPerfil(idPerfil, nome){
             if (confirm("Realmente deseja excluir o perfil: "+ nome+"?")){
                 window.open("excluir_perfil.do?idPerfil="+ idPerfil, "_self");
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
        <div class="card-header"> Perfis </div>
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Data de Cadastro</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Data de Cadastro</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                <tbody>
            <%
                for (Perfil p : lista) {
            %> 
            <tr>
                <td>
                    <%= p.getIdPerfil()%>
                </td>
                <td>
                    <%= p.getNome()%>
                </td>
                <td>
                    <fmt:formatDate pattern="dd/MM/yyyy" value="<%= p.getDataCadastro()%>"/>
                </td>
                <td align="center">
                    <a href="form_alterar_perfil.jsp?idPerfil=<%=p.getIdPerfil()%>" class="btn btn-primary btn-sm" role="button">Alterar
                    <i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="#" onclick="excluirPerfil(<%= p.getIdPerfil() %>, '<%= p.getNome() %>')" class="btn btn-danger btn-sm" role="button">Excluir
                    <i class="fas fa-user fa-user-minus"></i></a>
                    <a href="form_gerenciar_menu_perfil.jsp?idPerfil=<%=p.getIdPerfil()%>" class="btn btn-success btn-sm" role="button">Menus
                    <i class="fas fa-address-card"></i></a>
                </td>
            </tr>
            <% }
            %>
            </tbody>
            </table>
            <a href="form_cadastrar_perfil.jsp" class="btn btn-success btn-md" role="button">Novo Perfil&nbsp;
            <i class="fas fa-user fa-user-plus"></i></a>
        </div>
            </main>
        </div>
        </div>
        </div>
</body>
</html>
