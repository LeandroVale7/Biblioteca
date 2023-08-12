<%-- 
    Document   : Form_Alterar_Menu
    Created on : 06/05/2023, 16:27:48
    Author     : Leandro
--%>

<%@page import="model.MenuDAO"%>
<%@page import="model.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%

    Menu m = new Menu();
    try {
        int idMenu = Integer.parseInt(request.getParameter("idMenu"));
        MenuDAO mDAO = new MenuDAO();
        m = mDAO.carregaPorIdMenu(idMenu);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scale=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type=text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        
        <title>Alterar Menu</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Alterar Menu</h3></div>
                                    <div class="card-body">
                                        <form name = "menu" method = "post" action = "alterar_menu.do">
                                            ID do Perfil: <%= m.getIdMenu()%><br><br>
                                            <input type="hidden" name="idMenu" value="<%= m.getIdMenu()%>">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" type="text" name = "titulo" value="<%= m.getTitulo()%>"" required/>
                                                <label for="inputName">Digite o Título</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type = "text" name = "link" value="<%= m.getLink()%>" required/>
                                                <label for="inputLogin">Digite o Link</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type = "text" name = "icone" value="<%= m.getIcone()%>"/>
                                                <label for="inputLogin">Digite o Ícone</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_menu.jsp" class="btn btn-success" role="button">Voltar</a>
                                                <button class="btn btn-success">Alterar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>                                             
    </body>
</html>
