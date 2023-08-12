<%-- 
    Document   : form_alterar_autor
    Created on : 17/06/2023, 21:02:19
    Author     : Leandro
--%>

<%@page import="model.AutorDAO"%>
<%@page import="model.Autor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%

    Autor au = new Autor();
    try {
        int idAutor = Integer.parseInt(request.getParameter("idAutor"));
        AutorDAO auDAO = new AutorDAO();
        au = auDAO.carregaPorIdAutor(idAutor);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scale=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type=text/css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css"/>

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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Alterar Autor</h3></div>
                                    <div class="card-body">
                                        <form name = "autor" method = "post" action = "alterar_autor.do">
                                            ID do Autor: <%= au.getIdAutor()%><br><br>
                                            <input type="hidden" name="idAutor" value="<%= au.getIdAutor()%>">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" type="text" name="nome" value="<%= au.getNome()%>" required/>
                                                <label for="inputName">Digite o Nome</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type="text" name="sobrenome" value="<%= au.getSobrenome()%>" required/>
                                                <label for="inputLogin">Digite o Sobrenome</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type="text" name="biografia" value="<%= au.getBiografia()%>" required/>
                                                <label for="inputLogin">Digite a Biografia</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_autor.jsp" class="btn btn-success" role="button">Voltar</a>
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
