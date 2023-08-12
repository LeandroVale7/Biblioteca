<%-- 
    Document   : form_alterar_livro
    Created on : 17/06/2023, 17:01:37
    Author     : Leandro
--%>

<%@page import="model.LivroDAO"%>
<%@page import="model.Livro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%

    Livro li = new Livro();
    try {
        int idLivro = Integer.parseInt(request.getParameter("idLivro"));
        LivroDAO liDAO = new LivroDAO();
        li = liDAO.carregaPorIdLivro(idLivro);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>
        
        <title>Alterar Livro</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Alterar Livro</h3></div>
                                    <div class="card-body">
                                        <form name = "livro" method = "post" action = "alterar_livro.do">
                                            ID do Livro: <%= li.getIdLivro()%><br>
                                            <label for="livro" class="control-label"></label>
                                            <input type="hidden" name="idLivro" value="<%= li.getIdLivro()%>">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" type = "text" name = "titulo" value="<%= li.getTitulo()%>" required/>
                                                <label for="inputName">Título</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type = "text" name = "genero" value="<%= li.getGenero()%>" required/>
                                                <label for="inputLogin">Gênero</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputIdPerfil" type = "text" name = "local" value="<%= li.getLocal()%>" required/>
                                                <label for="inputIdPerfil">Local</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" type = "text" name = "pais" value="<%= li.getPais()%>" required/>
                                                <label for="inputName">País</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type="date" name="ano" value="<%= li.getAno()%>" required/>
                                                <label for="inputLogin">Ano</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputIdPerfil" type = "text" name = "descFisica" value="<%= li.getDescFisica()%>" required/>
                                                <label for="inputIdPerfil">Descrição Física</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" type = "text" name = "idioma" value="<%= li.getIdioma()%>" required/>
                                                <label for="inputName">Idioma</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type = "text" name = "assunto" value="<%= li.getAssunto()%>" required/>
                                                <label for="inputLogin">Assunto</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type = "text" name = "curso" value="<%= li.getCurso()%>" required/>
                                                <label for="inputLogin">Curso</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type = "text" name = "cutter" value="<%= li.getCutter()%>" required/>
                                                <label for="inputLogin">Cutter</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type = "text" name = "tombamento" value="<%= li.getTombamento()%>" required/>
                                                <label for="inputLogin">Tombamento</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type = "text" name = "editora" value="<%= li.getEditora()%>" required/>
                                                <label for="inputLogin">Editora</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type = "text" name = "isbn" value="<%= li.getIsbn()%>" required/>
                                                <label for="inputLogin">Isbn</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_livro.jsp" class="btn btn-success" role="button">Voltar</a>
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
