<%-- 
    Document   : listar_livro
    Created on : 8 de jun de 2023, 18:18:35
    Author     : Abby
--%>
<%@page import= "model.Livro"%>
<%@page import= "model.LivroDAO"%>
<%@page import= "java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    ArrayList<Livro> lista = new ArrayList<>();
    try {
        LivroDAO liDAO = new LivroDAO();
        lista = liDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scale=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/styles.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>

        <script type="text/javascript">
            function excluirLivro(idLivro, titulo) {
                if (confirm("Realmente deseja excluir o livro: " + titulo + "?")) {
                    window.open("excluir_livro.do?idLivro=" + idLivro, "_self");
                }
            }
        </script>     
    </head>

    <body>

       <%@include file="index.jsp"%>

        <div class="grid-container">
        <div id="layoutSidenav">
        <div id="layoutSidenav_content">
        <main>
        <div class="container-fluid px-4">
        </div>
        <div class="card mb-4">
        <div class="title-font-style">
        <div class="card-header"> Livros </div>
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Gênero</th>
                <th>Local</th>
                <th>País</th>
                <th>Ano</th>
                <th>Descrição Física</th>
                <th>Idioma</th>
                <th>Assunto</th>
                <th>Curso</th>
                <th>Cutter</th>
                <th>Tombamento</th>
                <th>Editora</th>
                <th>ISBN</th>
                <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Gênero</th>
                <th>Local</th>
                <th>País</th>
                <th>Ano</th>
                <th>Descrição Física</th>
                <th>Idioma</th>
                <th>Assunto</th>
                <th>Curso</th>
                <th>Cutter</th>
                <th>Tombamento</th>
                <th>Editora</th>
                <th>ISBN</th>
                <th>Opções</th>
                    </tr>
                </tfoot>
                <tbody>
            <% 
                for (Livro li : lista){ 
            %>
            <tr>
                <td>  <%= li.getIdLivro()%> </td>
                <td>  <%= li.getTitulo() %> </td>
                <td>  <%= li.getGenero() %> </td>
                <td>  <%= li.getLocal() %> </td>
                <td>  <%= li.getPais()%> </td>
                <td>  <fmt:formatDate pattern="yyyy" value="<%= li.getAno()%>"/> </td>
                <td>  <%= li.getDescFisica() %> </td>
                <td>  <%= li.getIdioma() %> </td>
                <td>  <%= li.getAssunto() %> </td>
                <td>  <%= li.getCurso()%> </td>
                <td>  <%= li.getCutter()%> </td>
                <td>  <%= li.getTombamento() %> </td>
                <td>  <%= li.getEditora() %> </td>
                <td>  <%= li.getIsbn() %> </td>
                <td>
                    <a href="form_alterar_livro.jsp?idLivro=<%=li.getIdLivro()%>" class="btn btn-primary btn-sm" role="button">
                    Alterar&nbsp;<i class="fa-solid fa-pen-to-square"></i></a>
                    <button class="btn btn-danger btn-sm" onclick="excluirLivro(<%=li.getIdLivro()%>, '<%=li.getTitulo() %>')">Excluir&nbsp;
                    <i class="fas fa-user fa-user-minus"></i></button>
                    <a href="form_gerenciar_livro_autor.jsp?idLivro=<%=li.getIdLivro()%>" class="btn btn-success btn-sm" role="button">Autores
                    <i class="fas fa-user fa-user"></i></a>
                </td>
            </tr>
            <% }
            %>
            </tbody>
            </table>
        <div class="col-12" style="padding-bottom: 15px" >
        <a href="form_cadastrar_livro.jsp" class="btn btn-success btn-md" role="button">Novo Livro&nbsp;
        <i class="fas fa-user fa-user-plus"></i></a>
	</div>
        </div>
        </div>
            </main>
        </div>
        </div>
        </div>  
    </body>
</html>
