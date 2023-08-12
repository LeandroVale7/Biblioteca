<%-- 
    Document   : form_alterar_exemplar
    Created on : 17/06/2023, 20:03:20
    Author     : Leandro
--%>

<%@page import="model.LivroDAO"%>
<%@page import="model.ExemplarDAO"%>
<%@page import="model.Exemplar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Livro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<%
    ArrayList<Livro> lista = new ArrayList<>();
    Exemplar ex = new Exemplar();
    try {
        int idExemplar = Integer.parseInt(request.getParameter("idExemplar"));
        ExemplarDAO exDAO = new ExemplarDAO();
        ex = exDAO.carregaPorIdExemplar(idExemplar);

        LivroDAO liDAO = new LivroDAO();
        lista = liDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="css/layout.css" type="text/css"/>
        
        <title>Alterar Exemplar</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Alterar Exemplar</h3></div>
                                    <div class="card-body">
                                        <form name = "alterar_exemplar" method = "post" action = "alterar_exemplar.do">
                                            <label for="exemplar" class="control-label"></label>
                                            ID do Exemplar: <%=ex.getIdExemplar()%> <input type = "hidden" name = "idExemplar" value="<%=ex.getIdExemplar()%>" required><br><br>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" type = "text" name = "quantExemplar" value="<%=ex.getQuantExemplar()%>" required/>
                                                <label for="inputName">Quantidade de Exemplar</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type = "text" name = "conservacao" value="<%=ex.getConservacao()%>" required/>
                                                <label for="inputLogin">Estado de Conservação</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <select  class="form-control" id="inputSelect" for="inputLogin" name="idLivro" size="1" required>
                                                    <option for="inputSelect" value="">Selecione um Livro</option>
                                                    <%
                                                        for (Livro li : lista) {
                                                            String selecao = "";
                                                            if (li.getIdLivro() == ex.getLivro().getIdLivro()) {
                                                                   selecao = "selected"; 
                                                                }
                                                    %>
                                                    <option for="inputSelect" value="<%= li.getIdLivro()%>"<%=selecao%>><%= li.getTitulo()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_exemplar.jsp" class="btn btn-success" role="button">Voltar</a>
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
