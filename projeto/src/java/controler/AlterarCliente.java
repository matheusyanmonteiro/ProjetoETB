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
import model.Cliente;
import model.ClienteDAO;

/**
 *
 * @author Matheus
 */
@WebServlet(name = "AlterarCliente", urlPatterns = {"/alterar_cliente.do"})
public class AlterarCliente extends HttpServlet {

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
            out.println("<title>Servlet AlterarCliente</title>");            
            out.println("</head>");
            out.println("<body>");
             try {
                  int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nome");
                String rg = request.getParameter("rg");
                String dataDeNascimento = request.getParameter("dataDeNascimento");
                String cpf = request.getParameter("cpf");
                String endereco = request.getParameter("endereco");
                String cep = request.getParameter("cep");
                String telefone = request.getParameter("telefone");
                String email = request.getParameter("email");
                String telefoneEmergencial = request.getParameter("telefoneEmergencial");
                
                Cliente c = new Cliente();
                c.setId(id);
                c.setNome(nome);
                c.setRg(rg);
                c.setDataDeNascimento(dataDeNascimento);
                c.setCpf(cpf);
                c.setEndereco(endereco);
                c.setCep(cep);
                c.setTelefone(telefone);
                c.setEmail(email);
                c.setTelefoneEmergencial(telefoneEmergencial);
                
                ClienteDAO CDAO = new ClienteDAO();
                CDAO.conectar();
                CDAO.alterar(c);
                CDAO.desconectar();
                
                response.sendRedirect("listar_cliente.jsp");
                
            } catch (Exception e) {
                out.print("Erro: "+e);
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
