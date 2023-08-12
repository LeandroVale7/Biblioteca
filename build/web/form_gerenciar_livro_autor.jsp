<%-- 
    Document   : form_gerenciar_livro_autor
    Created on : 17/06/2023, 21:43:15
    Author     : Leandro
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Autor"%>
<%@page import="model.LivroDAO"%>
<%@page import="model.Livro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%
    ArrayList<Autor> lista_autor = new ArrayList<>();
    Livro li = new Livro();
    try {
        int idLivro = Integer.parseInt(request.getParameter("idLivro"));
        LivroDAO liDAO = new LivroDAO();
        li = liDAO.carregaPorIdLivro(idLivro);

        lista_autor = liDAO.carregarAutorNaoLivro(idLivro);
    } catch (Exception e) {
        out.print("Erro:" + e);
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css"/>

        <title>Gerenciar Livro Autor</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Gerenciar Autor do Livro</h3></div>
                                    <div class="card-body">
                                        <form name = "livro_autor" method = "post" action = "gerenciar_livro_autor.do"">
                                            <input type="hidden" name="idLivro" value="<%= li.getIdLivro()%>">
                                            <input type="hidden" name="op" value="add">
                                            ID do Livro: <%= li.getIdLivro()%><br><br>
                                            Livro: <%= li.getTitulo()%><br><br>
                                            <div class="form-floating mb-3">
                                            <select class="form-control" id="inputSelect" name="idAutor" size="1" required>
                                                <option  for="inputSelect" value="">Selecione o Autor</option>
                                                <%
                                                    for (Autor la : lista_autor) {
                                                %>
                                                <option for="inputSelect" value="<%= la.getIdAutor()%>"><%= la.getNome()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_livro.jsp" class="btn btn-success" role="button">Voltar</a>
                                                <button class="btn btn-success">Salvar</button>
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
            Autores Vinculados
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Autor</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Autor</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                <tbody>
            <%
                for (Autor a : li.getAutores()) {
            %> 
            <tr>
                <td>
                    <%= a.getIdAutor()%>
                </td>
                <td>
                    <%= a.getNome()%>
                </td>
                <td>
                    <a href="gerenciar_livro_autor.do?idAutor=<%=a.getIdAutor()%>&idLivro=<%=li.getIdLivro()%>&op=del" class="btn btn-danger btn-sm" role="button">Excluir
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
