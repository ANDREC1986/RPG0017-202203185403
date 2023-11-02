/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cadastroee.servlets;

import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import jakarta.ejb.EJB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author andre
 */
public class ServletProdutoFC extends HttpServlet {
    @EJB
    ProdutoFacadeLocal facade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destino = "ProdutoLista.jsp";
        if("listar".equals(request.getParameter("acao"))) {
            List<Produto> produtos = facade.findAll(); 
            request.setAttribute("produtos", produtos);
            }
            else if("incluir".equals(request.getParameter("acao"))) {
                Produto produto = new Produto();
                produto.setNome(request.getParameter("nome"));
                produto.setPrecoDeVenda(Float.valueOf(request.getParameter("preco")));
                produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                facade.create(produto);
                List<Produto> list = facade.findAll();
                request.setAttribute("produtos", list);
            }
            else if("alterar".equals(request.getParameter("acao"))) {
                int id = Integer.parseInt(request.getParameter("id"));
                Produto produto = facade.find(id);
                produto.setNome(request.getParameter("nome"));
                produto.setPrecoDeVenda(Float.valueOf(request.getParameter("preco")));
                produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                facade.edit(produto);
                List<Produto> list = facade.findAll();
                request.setAttribute("produtos", list);
            }
            else if("excluir".equals(request.getParameter("acao"))) {
                Produto produto = facade.find(Integer.valueOf(request.getParameter("id")));
                facade.remove(produto);
                List<Produto> list = facade.findAll();
                request.setAttribute("produtos", list);
            }
            else if("formIncluir".equals(request.getParameter("acao"))) {
                Produto produto = new Produto();           
                request.setAttribute("acao","incluir");
                request.setAttribute("produto", produto);
                destino = "ProdutoDados.jsp";
            }
            else if("formAlterar".equals(request.getParameter("acao"))) {
                int id = Integer.parseInt(request.getParameter("id"));
                Produto produto = facade.find(id);
                request.setAttribute("acao", "alterar");
                request.setAttribute("produto", produto);
                destino = "ProdutoDados.jsp";              
            }
        request.getRequestDispatcher(destino).forward(request, response);
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
