<%-- 
    Document   : form_alterar_emprestimo
    Created on : 18 de jun de 2023, 15:41:44
    Author     : 
--%>
<%@page import= "model.Usuario" import= "model.UsuarioDAO"%>
<%@page import="model.Emprestimo" import="model.EmprestimoDAO" %>
<%@page import="model.Exemplar" import="model.ExemplarDAO" %>
<%@page import= "java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Usuario> listaU = new ArrayList<>();
    Emprestimo em = new Emprestimo();
    ArrayList<Exemplar> lista = new ArrayList<>();
    Exemplar ex = new Exemplar();

    try {
        int idEmprestimo = Integer.parseInt(request.getParameter("idEmprestimo"));
        EmprestimoDAO emDAO = new EmprestimoDAO();

        em = emDAO.carregaPorIdEmprestimo(idEmprestimo);

        UsuarioDAO uDAO = new UsuarioDAO();
        listaU = uDAO.listar();
        
        ExemplarDAO exDAO = new ExemplarDAO();
        lista = exDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="css/layout.css" type="text/css"/>
        
        <title>Alterar Empréstimo</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Alterar Empréstimos</h3></div>
                                    <div class="card-body">
                                        <form name = "alterar_emprestimo" method = "post" action = "alterar_emprestimo.do">
                                            ID do Exemplar: <%= em.getIdEmprestimo()%><br><br>
                                            <input type="hidden" name = "idEmprestimo" value="<%= em.getIdEmprestimo()%>"">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" type="date" name="dataEmprestimo" value="<%= em.getDataEmprestimo()%>" required/>
                                                <label for="inputName"> Data do Empréstimo</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type="date" name="dataDevolucao"  value="<%= em.getDataDevolucao()%>" required/>
                                                <label for="inputLogin">Data de Devolução</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                            <select class="form-control" id="inputSelect" name="idUsuario" size="1" required>
                                                <option for="inputSelect" value="">Selecione um Usuário</option>
                                                <%
                                                    for (Usuario u : listaU) {
                                                        String selecao = "";
                                                        if (u.getIdUsuario() == em.getUsuario().getIdUsuario()) {
                                                            selecao = "selected";
                                                        }
                                                %>
                                                <option for="inputSelect" value="<%= u.getIdUsuario()%>"<%=selecao%>><%= u.getNome()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            </div>
                                            <div class="form-floating mb-3">
                                            <select class="form-control" id="inputSelect" name="idExemplar" size="1" required>
                                                <option value="">Selecione o ID do Exemplar</option>
                                                <%
                                               for (Exemplar e : lista) {
                                                   String selecao = "";
                                                   if (e.getIdExemplar() == em.getExemplar().getIdExemplar()){
                                                              selecao = "selected";
                                                   }
                                                %>
                                                <option value="<%= e.getIdExemplar() %>"<%=selecao%>><%= e.getIdExemplar() %></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_emprestimo.jsp"" class="btn btn-success" role="button">Voltar</a>
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
                                                
        <div class="container-fluid">
            <h1>Alterar Empréstimo</h1>
            <form name = "alterar_emprestimo" method = "post" action = "alterar_emprestimo.do" > <%-- Dados serão enviados para o servlet / Extensão .do pois nenhuma tecnlogia usa essa extensão--%>

                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="emprestimo" class="control-label">Empréstimo</label> <br>
                        ID:<input type = "hidden" name = "idEmprestimo" value="<%= em.getIdEmprestimo()%>" required>
                        Data do Empréstimo: <input type="date" name="dataEmprestimo" value="<%= em.getDataEmprestimo()%>" required><br>
                        Data de Devolução: <input type="date" name="dataDevolucao"  value="<%= em.getDataDevolucao()%>" required><br>

                        <select name="idUsuario" size="1" required>
                            <option value="">Selecione um usuário...</option>
                            <%
                                for (Usuario u : listaU) {
                                    String selecao = "";
                                    if (u.getIdUsuario() == em.getUsuario().getIdUsuario()) {
                                        selecao = "selected";
                                    }
                            %>
                            <option value="<%= u.getIdUsuario()%>"<%=selecao%>><%= u.getNome()%></option>
                            <%
                                }
                            %>
                        </select>

                        <select name="idExemplar" size="1" required>
                            <option value="">Selecione o ID de um Exemplar...</option>
                            <%
                           for (Exemplar e : lista) {
                               String selecao = "";
                               if (e.getIdExemplar() == em.getExemplar().getIdExemplar()){
                                          selecao = "selected";
                               }
                            %>
                            <option value="<%= e.getIdExemplar() %>"<%=selecao%>><%= e.getIdExemplar() %></option>
                            <%
                                }
                            %>
                        </select> 
                    </div>
                </div>
                <div class="row">
                    <input type = "submit" value = "Salvar" required>
                    <a href="listar_emprestimo.jsp" class="btn btn-warning">Voltar</a>
                </div>
            </form>
        </div>
    </body>
</html>
