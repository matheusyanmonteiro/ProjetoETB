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
import model.Perfil;
import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Matheus
 */
@WebServlet(name = "InserirUsuario", urlPatterns = {"/inserir_usuario.do"})
public class InserirUsuario extends HttpServlet {

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
            out.println("<title>Servlet InserirUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            try {
                String nome = request.getParameter("nome");
                int idade = Integer.parseInt(request.getParameter("idade"));
                String telefone = request.getParameter("telefone");
                String email = request.getParameter("email");

                String cpf = request.getParameter("cpf");
                double salario = Double.parseDouble(request.getParameter("salario"));
                String rg = request.getParameter("rg");
                String endereco = request.getParameter("endereco");
                String cep = request.getParameter("cep");
                String dataDeNascimento = request.getParameter("dataDeNascimento");
                int carteiraDeTrabalho = Integer.parseInt(request.getParameter("carteiraDeTrabalho"));

                String login = request.getParameter("login");
                String senha = request.getParameter("senha");

                int perfil_id = Integer.parseInt(request.getParameter("perfil_id"));

                Perfil p = new Perfil();
                p.setId(perfil_id);
                
                Usuario u = new Usuario();
                u.setNome(nome);
                u.setIdade(idade);
                u.setTelefone(telefone);
                u.setEmail(email);

                u.setCpf(cpf);
                u.setSalario(salario);
                u.setRg(rg);
                u.setEndereco(endereco);
                u.setCep(cep);
                u.setDataDeNascimento(dataDeNascimento);
                u.setCarteiraDeTrabalho(carteiraDeTrabalho);

                u.setLogin(login);
                u.setSenha(senha);

                u.setPerfil(p);
                
                UsuarioDAO uDAO = new UsuarioDAO();
                uDAO.conectar();
                uDAO.inserir(u);
                uDAO.desconectar();
                
                response.sendRedirect("listar_usuario.jsp");

            } catch (Exception e) {
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
