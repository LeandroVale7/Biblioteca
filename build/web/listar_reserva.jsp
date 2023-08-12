<%-- 
    Document   : listar_reserva
    Created on : 22 de jun. de 2023, 16:57:21
    Author     : Administrador
--%>

<%@page import= "model.Reserva"%>
<%@page import= "model.ReservaDAO"%>
<%@page import= "java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%
    ArrayList<Reserva> lista = new ArrayList<>();
    try {
        ReservaDAO reDAO = new ReservaDAO();
        lista = reDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scale=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/styles.css" type="text/css"/>
        <link rel="stylesheet" href="css/index.css" type="text/css"/>       
        <script type="text/javascript">
            function excluirReserva(idReserva) {
                if (confirm("Realmente deseja excluir o reserva?")) {
                    window.open("excluir_reserva.do?idReserva=" + idReserva, "_self");
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
        <div class="card-header"> 
            Reservas 
        </div>
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>ID Reserva</th>
                        <th>ID Exemplar</th>
                        <th>Nome</th>
                        <th>0pções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID Reserva</th>
                        <th>ID Exemplar</th>
                        <th>Nome</th>
                        <th>0pções</th>
                    </tr>
                </tfoot>
                <tbody>
            <%
                for (Reserva re : lista) {
            %> 
            <tr>
                <td>
                    <%= re.getIdReserva()%>
                </td>
                <td>
                    <%= re.getExemplar().getIdExemplar()%>
                </td>
                <td>
                    <%= re.getUsuario().getNome()%>
                </td>
                <td align="center" >
                    <a href="form_alterar_reserva.jsp?idReserva=<%=re.getIdReserva()%>" class="btn btn-primary btn-sm" role="button">Alterar&nbsp;
                    <i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="#" onclick="excluirReserva(<%= re.getIdReserva()%>)" class="btn btn-danger btn-sm" role="button">Excluir
                    <i class="fas fa-user fa-user-minus"></i></a>
            </tr>
            <% }
            %>
            </table>
        <div class="col-12" style="padding-bottom: 15px" >
            <a href="form_cadastrar_reserva.jsp" class="btn btn-success btn-md" role="button">Nova Reserva&nbsp;
            <i class="fas fa-user fa-user-plus"></i></a>
    </div>
        </div>
            </main>
        </div>
        </div>
       </div>
       </div>
</body>
</html>
