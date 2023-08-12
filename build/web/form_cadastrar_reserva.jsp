<%-- 
    Document   : form_cadastrar_reserva
    Created on : 22 de jun. de 2023, 17:09:18
    Author     : Administrador
--%>

<%@page import="model.ExemplarDAO"%>
<%@page import="model.Exemplar"%>
<%@page import= "java.util.ArrayList"%>
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
        <link rel="stylesheet" href="css/layout.css" type="text/css"/>
        
        <title>Nova Reserva</title>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Cadastrar Reserva</h3></div>
                                    <div class="card-body">
                                        <form name = "reserva" method = "post" action = "cadastrar_reserva.do">
                                            ID da Reserva: ${Reserva.idReserva} <input type="hidden" name="" value="${Reserva.idReserva}"/><br><br> 
                                                <%
                                                    ArrayList<Exemplar> lista = new ArrayList<>();
                                                    try {

                                                        ExemplarDAO exDAO = new ExemplarDAO();
                                                        lista = exDAO.listarExemplarAtivo();

                                                    } catch (Exception e) {
                                                        out.print("Erro: " + e);
                                                    }
                                                %>
                                                <div class="form-floating mb-3">
                                                <select class="form-control" id="inputUser" name="idExemplar" size="1" required>
                                                    <option for="inputUser" value="">Selecione um Exemplar...</option>
                                                    <%
                                                        for (Exemplar ex : lista) {
                                                    %>
                                                    <option for="inputUser" value="<%= ex.getIdExemplar()%>"><%= ex.getIdExemplar()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                                <%
                                                    ArrayList<Usuario> listaU = new ArrayList<>();
                                                    try {
                                                        UsuarioDAO uDAO = new UsuarioDAO();
                                                        listaU = uDAO.listar();
                                                    } catch (Exception e) {
                                                        out.print("Erro: " + e);
                                                    }
                                                %>
                                                </div>
                                                <div class="form-floating mb-3">
                                                <select class="form-control" id="inputUser" name="idUsuario" size="1" required>
                                                  <option for="inputUser" value="">Selecione um Usuário...</option>
                                                    <%
                                                        for (Usuario u : listaU) {
                                                    %>
                                                    <option for="inputUser" value="<%= u.getIdUsuario()%>"><%= u.getNome()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                                </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_reserva.jsp" class="btn btn-success" role="button">Voltar</a>
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
