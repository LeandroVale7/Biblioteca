<%-- 
    Document   : form_cadastrar_exemplar
    Created on : 17/06/2023, 18:46:38
    Author     : Leandro
--%>

<%@page import="model.LivroDAO"%>
<%@page import= "java.util.ArrayList"%>
<%@page import= "model.Livro"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import= "model.PerfilDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scale=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="css/layout.css" type="text/css"/>
        
        <title>Novo Exemplar</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Cadastrar Exemplar</h3></div>
                                    <div class="card-body">
                                        <form name = "exemplar" method = "post" action = "cadastrar_exemplar.do">
                                            <label for="exemplar" class="control-label"></label>
                                            <input type="hidden" name="" value="${Exemplar.idExemplar}"/>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" type = "text" name = "quantExemplar" required/>
                                                <label for="inputName">Quantidade de Exemplares</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type = "text" name = "conservacao" required/>
                                                <label for="inputLogin">Estado de Conservação</label>
                                            </div>
                                            <%
                                                ArrayList<Livro> lista = new ArrayList<>();
                                                try {
                                                    LivroDAO liDAO = new LivroDAO();
                                                    lista = liDAO.listar();
                                                } catch (Exception e) {
                                                    out.print("Erro: " + e);
                                                }
                                            %>
                                            <div class="form-floating mb-3">
                                            <select class="form-control" id="inputLogin" name="idLivro" size="1" required>
                                              <option for="inputLogin" value="">Selecione um Livro</option>
                                                <%
                                                    for (Livro li : lista) {
                                                %>
                                                <option for="inputLogin" value="<%= li.getIdLivro()%>"><%= li.getTitulo()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_exemplar.jsp" class="btn btn-success" role="button">Voltar</a>
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
