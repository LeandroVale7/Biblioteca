<%-- 
    Document   : form_cadastrar_perfil
    Created on : 06/05/2023, 16:27:48
    Author     : Leandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Cadastrar Perfil</h3></div>
                                    <div class="card-body">
                                        <form name = "perfil" method = "post" action = "cadastrar_perfil.do">
                                            <div class="form-floating mb-3">
                                                <input type="hidden" name="" value="${Perfil.idPerfil}"/>
                                                <input class="form-control" id="inputUser" type = "text" name = "nome" required/>
                                                <label for="inputUser">Digite o Perfil</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputRegister" type="date" name="dataCadastro" placeholder="Data de Cadastro" required/>
                                                <label for="inputRegister">Selecione a Data de Cadastro</label>
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
        </div>
    </body>
</html>
