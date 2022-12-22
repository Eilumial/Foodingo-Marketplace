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
import java.io.PrintWriter;
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
@WebServlet(name = "TemplateServlet", urlPatterns = {"/TemplateServlet"})
public class TemplateServlet extends HttpServlet {

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
        String templateName=request.getParameter("template");
        String vendor_idStr=request.getParameter("vendor_id");
        int vendorId=UtilityController.convertStringtoInt(vendor_idStr);
        int count=0;
        int order_id=OrderDAO.generateTemplateId(vendor_idStr)+1;
        OrderTemplate template=new OrderTemplate(order_id,vendorId,templateName);
        ArrayList<Dish> dishList = IngredientController.getDish(vendor_idStr);
        for (Dish dish : dishList) {
            int quantity=UtilityController.convertStringtoInt(request.getParameter("dish" + dish.getDish_id()));
            if(quantity>0){
                template.addDish(dish);
                template.addInt(quantity);
                count++;
            }
        }
        if (count==0){
            response.sendRedirect("CreateTemplate.jsp?errorMsg=Please create a template with at least 1 dish");
        }else if(!OrderDAO.verifyTemplateName(templateName, vendorId)){
                    response.sendRedirect("CreateTemplate.jsp?errorMsg=Template name has already been used&orderId="+template.getOrder_id());
                }
        else{
            OrderDAO.saveTemplate(template);
            response.sendRedirect("TemplateMain.jsp");
        }
        /*
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TemplateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TemplateServlet at " + request.getContextPath() + "</h1>");
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
