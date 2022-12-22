/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controller.IngredientController;
import Controller.UtilityController;
import DAO.OrderDAO;
import Model.Dish;
import Model.OrderTemplate;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author David
 */
@WebServlet(name = "EditTemplateServlet", urlPatterns = {"/EditTemplateServlet"})
public class EditTemplateServlet extends HttpServlet {

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
        ArrayList<OrderTemplate> templates = OrderDAO.retrieveOrderTemplates(UtilityController.convertStringtoInt(request.getParameter("vendor_id")));
        String orderId = request.getParameter("order_id");
        int count = 0;
        for (OrderTemplate template : templates) {
            if (template.getOrder_id() == UtilityController.convertStringtoInt(orderId)) {
                ArrayList<Integer> quantityList = new ArrayList<Integer>();
                ArrayList<Dish> dishList = IngredientController.getDish(request.getParameter("vendor_id"));
                for (Dish dish : dishList) {
                    if (request.getParameter("dish" + dish.getDish_id()) == null || UtilityController.convertStringtoInt(request.getParameter("dish" + dish.getDish_id())) <= 0) {
                        quantityList.add(0);
                    } else {
                        //System.out.println(request.getParameter("dish"+dish.getDish_id()));
                        quantityList.add(UtilityController.convertStringtoInt(request.getParameter("dish" + dish.getDish_id())));
                        count++;
                    }
                }
                if (count == 0) {
                    response.sendRedirect("OrderTemplate.jsp?errorMsg=Please create a template with at least 1 dish&orderId=" + template.getOrder_id());
                } else {

                    template.setDishList(dishList);
                    template.setStringList(quantityList);
                    template.setName(request.getParameter("templateName"));
                    OrderDAO.updateTemplate(template);
                    response.sendRedirect("TemplateMain.jsp");
                }
            }
        }

        /*
         response.setContentType("text/html;charset=UTF-8");
         try (PrintWriter out = response.getWriter()) {
           
         out.println("<!DOCTYPE html>");
         out.println("<html>");
         out.println("<head>");
         out.println("<title>Servlet EditTemplateServlet</title>");            
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet EditTemplateServlet at " + request.getContextPath() + "</h1>");
         out.println("</body>");
         out.println("</html>");
         }
         */
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
