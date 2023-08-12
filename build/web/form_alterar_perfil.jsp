<%-- 
    Document   : Form_Alterar_Perfil
    Created on : 03/06/2023, 09:24:32
    Author     : Leandro
--%>

<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<%

    Perfil p = new Perfil();
    try {
        int idPerfil = Integer.parseInt(request.getParameter("idPerfil"));
        PerfilDAO pDAO = new PerfilDAO();
        p = pDAO.carregaPorIdPerfil(idPerfil);
    } catch (Exception e) {
        out.print("Erro:" + e);
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Alterar Perfil</h3></div>
                                    <div class="card-body">
                                        <form name = "perfil" method = "post" action = "alterar_perfil.do">
                                                <input class="form-control" id="inputIdPerfil" type = "hidden" name="idPerfil" value="<%= p.getIdPerfil()%>" required/>
                                                <label for="inputIdPerfil">ID do Perfil: <%= p.getIdPerfil()%></label><br><br>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" type="text" name="nome" value="<%=p.getNome()%>" required/>
                                                <label for="inputName">Nome</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputLogin" type="date" name="dataCadastro" value="<%= p.getDataCadastro()%>" required/>
                                                <label for="inputLogin">Data de Cadastro</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="listar_perfil.jsp" class="btn btn-success" role="button">Voltar</a>
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
