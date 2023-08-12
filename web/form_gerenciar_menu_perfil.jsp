<%-- 
    Document   : form_gerenciar_menu_perfil
    Created on : 03/06/2023, 09:24:32
    Author     : Leandro
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Menu"%>
<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%
    ArrayList<Menu> lista_menu = new ArrayList<Menu>();
    Perfil p = new Perfil();
    try {
        int idPerfil = Integer.parseInt(request.getParameter("idPerfil"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregaPorIdPerfil(idPerfil);

        lista_menu = pDAO.carregarMenusNaoPerfil(idPerfil);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>

        <title>Gerenciar Menu Perfil</title>
    </head>     
    <%@include file="index.jsp"%>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Gerenciar Menu Perfil</h3></div>
                                    <div class="card-body">

                                        <form name = "menu_perfil" method = "post" action = "gerenciar_menu_perfil.do">
                                        <input type="hidden" name="idPerfil" value="<%= p.getIdPerfil()%>"/>
                                        <input type="hidden" type="hidden" name="op" value="add"/>
                                        ID do Perfil: <%= p.getIdPerfil()%><br><br>
                                        Nome do Perfil: <%= p.getNome()%><br><br>
                                            <div class="form-floating mb-3">
                                                <select class="form-control" id="inputSelect" name="idMenu" size="1" required>
                                                    <option for="inputSelect" value="">Selecione um Menu</option>
                                                    <%
                                                        for (Menu ms : lista_menu) {
                                                    %>
                                                    <option value="<%= ms.getIdMenu()%>"><%= ms.getTitulo()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_perfil.jsp" class="btn btn-success" role="button">Voltar</a>
                                                <button class="btn btn-success">Cadastrar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        <div class="grid-container" >
        <div id="layoutSidenav">
        <div id="layoutSidenav_content">
        <main>
        <div class="container-fluid px-4">
        </div>
        <div class="card mb-4">
        <div class="card-header">
            Menus Vinculados
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Menu</th>
                        <th>Excluir</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Menu</th>
                        <th>Excluir</th>
                    </tr>
                </tfoot>
                <tbody>
            <%
                for (Menu m : p.getMenus()) {
            %> 
            <tr>
                <td>
                    <%= m.getIdMenu()%>
                </td>
                <td>
                    <%= m.getTitulo()%>
                </td>
                <td>
                    <a href="gerenciar_menu_perfil.do?idMenu=<%=m.getIdMenu()%>&idPerfil=<%=p.getIdPerfil()%>&op=del" class="btn btn-danger btn-sm" role="button">Excluir
                    <i class="fas fa-user fa-user-minus"></i></a>
                </td>
            </tr>
            <% }
            %>
            </tbody>
            </table>
        </div>
            </main>
        </div>
        </div>
        </div>
        </div>
    </body>
</html>
