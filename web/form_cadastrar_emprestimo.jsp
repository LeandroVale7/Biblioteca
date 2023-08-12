<%-- 
    Document   : form_cadastrar_emprestimo
    Created on : 15 de jun de 2023, 11:14:01
    Author     : 
--%>
<%@page import= "java.util.ArrayList"%>
<%@page import= "model.Exemplar"%>
<%@page import= "model.ExemplarDAO"%>
<%@page import= "model.Usuario"  import= "model.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scale=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css"/>
        
        <title>Novo Emprestimo</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Cadastrar Empréstimo</h3></div>
                                    <div class="card-body">
                                        <form name = "emprestimo" method = "post" action = "cadastrar_emprestimo.do">
                                            <label for="emprestimo" class="control-label"></label><br>
                                            <input type="hidden" name="idEmprestimo" value="${Emprestimo.idEmprestimo}"/>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type="date" name="dataEmprestimo" required/>
                                                <label for="inputUser">Data do Empréstimo</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type="date" name="dataDevolucao" required/>
                                                <label for="inputLogin">Data de Devolução</label>
                                                <%
                                                    ArrayList<Exemplar> lista = new ArrayList<>();
                                                    try {

                                                        ExemplarDAO exDAO = new ExemplarDAO();
                                                        lista = exDAO.listarExemplarAtivo();

                                                    } catch (Exception e) {
                                                        out.print("Erro: " + e);
                                                    }
                                                %>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <select class="form-control" id="inputSelect" name="idExemplar" size="1" required>
                                                    <option for="inputSelect" value="">Selecione um Exemplar</option>
                                                    <%
                                                        for (Exemplar ex : lista) {
                                                    %>
                                                    <option for="inputSelect" value="<%= ex.getIdExemplar()%>"><%= ex.getIdExemplar()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                                <%
                                                ArrayList<Usuario> listaU = new ArrayList<>();
                                                try {
                                                    UsuarioDAO uDAO = new UsuarioDAO();
                                                    listaU = uDAO.listar();
                                                } catch (Exception e) {
                                                    out.print("Erro: " + e);
                                                }
                                            %>
                                            <div class="form-floating mb-3">
                                                <select class="form-control" id="inputSelect" name="idUsuario" size="1" required>
                                                <option for="inputSelect" value="">Selecione um Usuário</option>
                                                  <%
                                                      for (Usuario u : listaU) {
                                                  %>
                                                  <option for="inputSelect" value="<%= u.getIdUsuario()%>"><%= u.getNome()%></option>
                                                  <%
                                                      }
                                                  %>
                                                </select>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_emprestimo.jsp" class="btn btn-success" role="button">Voltar</a>
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
