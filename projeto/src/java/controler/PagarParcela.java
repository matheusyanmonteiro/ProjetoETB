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
import model.Pagamento;
import model.PagamentoDAO;

/**
 *
 * @author marcos
 */
@WebServlet(name = "PagarParcela", urlPatterns = {"/pagar_parcela.do"})
public class PagarParcela extends HttpServlet {

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
            out.println("<title>Servlet PagarParcela</title>");            
            out.println("</head>");
            out.println("<body>");
           try{
                  int id = Integer.parseInt(request.getParameter("id"));
                  int quantidadeParcela = Integer.parseInt(request.getParameter("quantidadeParcela"));
                  
                  if(quantidadeParcela > -1){
            Pagamento p = new Pagamento();
             p.setId(id);
             p.setQuantidadeParcela(quantidadeParcela);
          
                 
                
                PagamentoDAO pDAO = new PagamentoDAO();
                pDAO.conectar();
                pDAO.PagarParcela(p);
                pDAO.desconectar();
                
                response.sendRedirect("listar_pagamento.jsp");
                 }else{
                    out.println("<h1 style=\"text-align:center; color:blue; \">Esse evento ja foi pago<br>"
                            + "<a href=\"listar_pagamento.jsp \">VOLTA</a></h1>");  
                  }
               }catch(Exception e){
                 out.printf("FUDEU: "+e);
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
