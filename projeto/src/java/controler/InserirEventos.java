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
import model.Buffet;
import model.Cliente;
import model.Eventos;
import model.EventosDAO;
import model.Salao;
import model.Usuario;

/**
 *
 * @author Matheus
 */
@WebServlet(name = "InserirEventos", urlPatterns = {"/inserir_eventos.do"})
public class InserirEventos extends HttpServlet {

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
            out.println("<title>Servlet InserirEventos</title>");            
            out.println("</head>");
            out.println("<body>");
            try {
             String tema = request.getParameter("tema");
            int quantidadeDeConvidados = Integer.parseInt(request.getParameter("quantidadeDeConvidados"));
            String horario = request.getParameter("horario");
            double valor = Double.parseDouble(request.getParameter("valor"));
            String situacao = request.getParameter("situacao");
            String data = request.getParameter("data");
             int buffet_id = Integer.parseInt(request.getParameter("buffet_id"));
             int cliente_id = Integer.parseInt(request.getParameter("cliente_id"));
             int salao_id = Integer.parseInt(request.getParameter("salao_id"));
             int usuario_id = Integer.parseInt(request.getParameter("usuario_id"));
              Buffet b = new Buffet();
                b.setId(buffet_id);
                
                 Cliente c = new Cliente();
                c.setId(cliente_id);
                
                  Salao s = new Salao();
                s.setId(salao_id);
                
                  Usuario u = new Usuario();
                u.setId(usuario_id);
                
                Eventos e = new Eventos();
                e.setTema(tema);
                e.setQuantidadeDeConvidados(quantidadeDeConvidados);
                e.setHorario(horario);
                e.setValor(valor);
                e.setSituacao(situacao);
                e.setData(data);
                e.setBuffet(b);
                e.setCliente(c);
                e.setSalao(s);
                e.setUsuario(u);
                
                EventosDAO eDAO = new EventosDAO();
                eDAO.conectar();
                eDAO.inserir(e);
                eDAO.desconectar();
                
                
            response.sendRedirect("listar_eventos.jsp");
                
            } catch (Exception e) {
                out.println("erro: "+e);
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
