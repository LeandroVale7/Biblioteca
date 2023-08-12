<%-- 
    Document   : form_alterar_usuario
    Created on : 03/06/2023, 16:13:15
    Author     : Leandro
--%>

<%@page import= "model.UsuarioDAO"%>
<%@page import= "model.Usuario"%>
<%@page import= "java.util.ArrayList"%>
<%@page import= "model.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import= "model.PerfilDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<%
    ArrayList<Perfil> lista = new ArrayList<>();
    Usuario u = new Usuario();
    try {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        UsuarioDAO uDAO = new UsuarioDAO();
        u = uDAO.carregaPorIdUsuario(idUsuario);

        PerfilDAO pDAO = new PerfilDAO();
        lista = pDAO.listar();
    } catch (Exception e) {
        out.print("Erro: " + e);
    }
%>

<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"/>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Alterar Usuário</h3></div>
                                    <div class="card-body">
                                        <form name = "alterar_usuario" method = "post" action = "alterar_usuario.do">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputId" type = "hidden" name = "idUsuario" value="<%=u.getIdUsuario()%>" required/>
                                                <label for="inputId">ID <%=u.getIdUsuario()%> </label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" type="text" name="nome" value="<%=u.getNome()%>" required/>
                                                <label for="inputName">Nome</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type="text" name="login" value="<%=u.getLogin()%>" required/>
                                                <label for="inputLogin">Login</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" name = "senha" value="<%=u.getSenha()%>" required/>
                                                <label for="inputPassword">Senha</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputEmail" type="text" name = "email" value="<%=u.getEmail()%>" required/>
                                                <label for="inputEmail">Email</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputCpf" type="number" name = "cpf" value="<%=u.getCpf()%>" required/>
                                                <label for="inputCpf">CPF</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                            <select  class="form-control" id="inputSelect" name="idPerfil" size="1" required>
                                                <option value="">Selecione um perfil...</option>
                                                <%
                                                    for (Perfil p : lista) {
                                                        String selecao = "";
                                                        if (p.getIdPerfil() == u.getPerfil().getIdPerfil()) {
                                                               selecao = "selected"; 
                                                            }
                                                %>
                                                <option value="<%= p.getIdPerfil()%>"<%=selecao%>><%= p.getNome()%></option>
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
