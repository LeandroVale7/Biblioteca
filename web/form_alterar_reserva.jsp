<%-- 
    Document   : form_alterar_reserva
    Created on : 22 de jun. de 2023, 17:44:43
    Author     : Administrador
--%>

<%@page import= "model.Usuario" import= "model.UsuarioDAO"%>
<%@page import="model.Reserva" import="model.ReservaDAO" %>
<%@page import="model.Exemplar" import="model.ExemplarDAO" %>
<%@page import= "java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Usuario> listaU = new ArrayList<>();
    Reserva re = new Reserva();
    ArrayList<Exemplar> lista = new ArrayList<>();
    Exemplar ex = new Exemplar();

    try {
        int idReserva = Integer.parseInt(request.getParameter("idReserva"));
        ReservaDAO reDAO = new ReservaDAO();

        re = reDAO.carregaPorIdReserva(idReserva);

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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Alterar Reserva</h3></div>
                                    <div class="card-body">
                                        <form name = "alterar_reserva" method = "post" action = "alterar_reserva.do" >
                                            ID da Reserva: <%= re.getIdReserva()%>
                                            <input type = "hidden" name = "idReserva" value="<%= re.getIdReserva()%>" required><br><br>
                                            <div class="form-floating mb-3">
                                            <select class="form-control" id="inputName" name="idUsuario" size="1" required>
                                                <option for="inputName" value="">Selecione um Usuário...</option>
                                                <%
                                                    for (Usuario u : listaU) {
                                                        String selecao = "";
                                                        if (u.getIdUsuario() == re.getUsuario().getIdUsuario()) {
                                                            selecao = "selected";
                                                        }
                                                %>
                                                <option for="inputName" value="<%= u.getIdUsuario()%>"<%=selecao%>><%= u.getNome()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            </div>
                                            <div class="form-floating mb-3">
                                            <select class="form-control" id="inputName" name="idExemplar" size="1" required>
                                                <option for="inputName value="">Selecione um Exemplar...</option>
                                                <%
                                               for (Exemplar e : lista) {
                                                   String selecao = "";
                                                   if (e.getIdExemplar() == re.getExemplar().getIdExemplar()){
                                                              selecao = "selected";
                                                   }
                                                %>
                                                <option for="inputName value="<%= e.getIdExemplar() %>"<%=selecao%>><%= e.getIdExemplar() %></option>
                                                <%
                                                    }
                                                %>
                                            </select> 
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_reserva.jsp" class="btn btn-success" role="button">Voltar</a>
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
