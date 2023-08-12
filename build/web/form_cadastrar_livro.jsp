<%-- 
    Document   : Form_Cadastrar_Livro
    Created on : 1 de jun de 2023, 13:16:17
    Author     : 
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scale=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"/>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Cadastrar Livro</h3></div>
                                    <div class="card-body">
                                        <form name = "livro" method = "post" action = "cadastrar_livro.do">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "text" name = "titulo" required/>
                                                <label for="inputUser">Titulo</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "text" name = "genero" required/>
                                                <label for="inputUser">Genero</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "text" name = "local" required/>
                                                <label for="inputUser">Local</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "date" name = "ano" required/>
                                                <label for="inputUser">Ano</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "text" name = "descFisica" required/>
                                                <label for="inputUser">Descrição Física</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "text" name = "idioma" required/>
                                                <label for="inputUser">Idioma</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "text" name = "assunto" required/>
                                                <label for="inputUser">Assunto</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "text" name = "curso" required/>
                                                <label for="inputUser">Curso</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "text" name = "cutter" required/>
                                                <label for="inputUser">Cutter</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "text" name = "tombamento" required/>
                                                <label for="inputUser">Tombamento</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "text" name = "editora" required/>
                                                <label for="inputUser">Editora</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "number" name = "isbn" required/>
                                                <label for="inputUser">Isbn</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_livro.jsp" class="btn btn-success" role="button">Voltar</a>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
