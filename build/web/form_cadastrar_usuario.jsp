<%-- 
    Document   : form_cadastrar_usuario
    Created on : 26/04/2023, 12:54:26
    Author     : loja
--%>

<%@page import= "java.util.ArrayList"%>
<%@page import= "model.Perfil"%>
<%@page import= "model.Usuario"%>
<%@page import= "model.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import= "model.PerfilDAO" import= "model.UsuarioDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scale=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type=text/css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css"/>
        
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Cadastrar Usuário</h3></div>
                                    <div class="card-body">
                                        <form name = "usuario" method = "post" action = "cadastrar_usuario.do">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputUser" type = "text" name = "nome" required/>
                                                <label for="inputUser">Digite o Nome</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type="text" name="login" required/>
                                                <label for="inputLogin">Digite o Login</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" type="text" name="senha" required/>
                                                <label for="inputPassword">Digite a Senha</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputEmail" type="text" name="email" required/>
                                                <label for="inputEmail">Digite o Email</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputCpf" type="number" name="cpf" required/>
                                                <label for="inputCpf">Digite o CPF</label>
                                                <%
                                                    ArrayList<Perfil> lista = new ArrayList<>();
                                                    try {
                                                        PerfilDAO pDAO = new PerfilDAO();
                                                        lista = pDAO.listar();
                                                    } catch (Exception e) {
                                                        out.print("Erro: " + e);
                                                    }
                                                %>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <select class="form-control" id="inputSelect" name="idPerfil" size="1" required>
                                                    <option for="inputSelect" value="">Selecione um Perfil</option>
                                                    <%
                                                        for (Perfil p : lista) {
                                                    %>
                                                    <option for="inputSelect" value="<%= p.getIdPerfil()%>"><%= p.getNome()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_usuario.jsp" class="btn btn-success" role="button">Voltar</a>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script> 
   </body>
</html>