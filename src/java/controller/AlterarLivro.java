/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Livro;
import model.LivroDAO;

/**
 *
 * @author leand
 */
public class AlterarLivro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarLivro</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                //receber os parametros da requisição
                int idLivro = Integer.parseInt(request.getParameter("idLivro"));
                String titulo = request.getParameter("titulo");
                String genero = request.getParameter("genero");
                String local = request.getParameter("local");
                String pais = request.getParameter("pais");
                String ano = request.getParameter("ano");
                String descFisica = request.getParameter("descFisica");
                String idioma = request.getParameter("idioma");
                String assunto = request.getParameter("assunto");
                String curso = request.getParameter("curso");
                String cutter = request.getParameter("cutter");
                String tombamento = request.getParameter("tombamento");
                String editora = request.getParameter("editora");
                String isbn = request.getParameter("isbn");

                //instanciar as classes necessárias
                Livro li = new Livro();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

                li.setIdLivro(idLivro);
                li.setTitulo(titulo);
                li.setGenero(genero);
                li.setLocal(local);
                li.setPais(pais);
                li.setAno(df.parse(ano));
                li.setDescFisica(descFisica);
                li.setIdioma(idioma);
                li.setAssunto(assunto);
                li.setCurso(curso);
                li.setCutter(cutter);
                li.setTombamento(tombamento);
                li.setEditora(editora);
                li.setIsbn(isbn);

                LivroDAO liDAO = new LivroDAO();

                //chamar a ação inserir no banco e redirecionar para o formulário
                liDAO.alterar(li);
                response.sendRedirect("listar_livro.jsp");
            } catch (Exception e) {
                out.println("Erro: " + e);
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
