/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Reserva;
import model.ReservaDAO;
import model.Exemplar;
import model.Usuario;

/**
 *
 * @author Administrador
 */
public class AlterarReserva extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarReserva</title>");            
            out.println("</head>");
            out.println("<body>");
            try {
                //receber os parametros da requisição
                int idReserva = Integer.parseInt(request.getParameter("idReserva"));
                int idExemplar = Integer.parseInt(request.getParameter("idExemplar"));
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

                //instanciar as classes necessárias
                Exemplar ex = new Exemplar();
                ex.setIdExemplar(idExemplar);
                Usuario u = new Usuario();
                u.setIdUsuario(idUsuario);
                
                Reserva re = new Reserva();
                re.setIdReserva(idReserva);
                re.setExemplar(ex);
                re.setUsuario(u);
                
                ReservaDAO reDAO = new ReservaDAO();

                //chamar a ação inserir no banco e redirecionar para o formulário
                reDAO.alterar(re);
                response.sendRedirect("listar_reserva.jsp");
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
