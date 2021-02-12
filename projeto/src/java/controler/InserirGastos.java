/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Eventos;
import model.Gastos;
import model.GastosDAO;
import model.Usuario;

/**
 *
 * @author Matheus
 */
@WebServlet(name = "InserirGastos", urlPatterns = {"/inserir_gastos.do"})
public class InserirGastos extends HttpServlet {

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
            out.println("<title>Servlet InserirGastos</title>");            
            out.println("</head>");
            out.println("<body>");
            
            try {
               
                String descricao = request.getParameter("descricao");
                double valor = Double.parseDouble(request.getParameter("valor"));
                int usuario_id = Integer.parseInt(request.getParameter("usuario_id"));
           
                
                Usuario u = new Usuario();
                u.setId(usuario_id);

                
                Gastos g = new Gastos();

                g.setDescricao(descricao);
                g.setValor(valor);
                g.setUsuario(u);

                
                GastosDAO gDAO = new GastosDAO();
                gDAO.conectar();
                gDAO.inserir(g);
                gDAO.desconectar();
                
                response.sendRedirect("listar_gastos.jsp");
            } catch (Exception e) {
                out.print("erro: "+e);
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
