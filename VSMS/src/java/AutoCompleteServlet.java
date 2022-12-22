/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Controller.IngredientController;
import DAO.IngredientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import Model.*;
import javax.servlet.http.HttpSession;
/**
 *
 * @author TC
 */
public class AutoCompleteServlet extends HttpServlet {

    private ServletContext context;
    private UserDAO compData = new UserDAO();
    private HashMap suppliers = compData.getSuppliers();
    

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
        //super.init(config); //To change body of generated methods, choose Tools | Templates.
    }

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
            out.println("<title>Servlet AutoCompleteServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AutoCompleteServlet at " + request.getContextPath() + "</h1>");
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
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        String isSupplier = request.getParameter("searchType");
        StringBuffer sb = new StringBuffer();
        HttpSession session = request.getSession();
        //String isSupplier =(String) session.getAttribute("isSupplier");

        if (targetId != null) {
            targetId = targetId.trim().toLowerCase();
        } else {
            context.getRequestDispatcher("/error.jsp").forward(request, response);
        }

        boolean namesAdded = false;
        if(isSupplier!=null && isSupplier.equals("true")){
            if (action.equals("complete")) {

                // check if user sent empty string
                if (!targetId.equals("")) {

                    Iterator it = suppliers.keySet().iterator();

                    while (it.hasNext()) {
                        String id = (String) it.next();
                        Supplier supplier = (Supplier) suppliers.get(id);

                        if (supplier.getSupplier_name().toLowerCase().contains(targetId)
                                || // targetId matches last name
                                supplier.getSupplier_type().toLowerCase().contains(targetId) /*|| // targetId matches full name
                            supplier.getFirstName().toLowerCase().concat(" ")
                            .concat(supplier.getLastName().toLowerCase()).contains(targetId))*/) {

                            sb.append("<composer>");
                            sb.append("<id>" + supplier.getSupplier_id() + "</id>");
                            sb.append("<supplierName>" + supplier.getSupplier_name() + "</supplierName>");
                            sb.append("<supplierType>" + supplier.getSupplier_type() + "</supplierType>");
                            sb.append("</composer>");
                            namesAdded = true;
                        }
                    }
                }

                if (namesAdded) {
                    response.setContentType("text/xml");
                    response.setHeader("Cache-Control", "no-cache");
                    response.getWriter().write("<composers>" + sb.toString() + "</composers>");
                } else {
                    //nothing to show
                    response.setStatus(HttpServletResponse.SC_NO_CONTENT);
                }
            }
            if (action.equals("lookup")) {

                // put the target supplier in the request scope to display 
                if ((targetId != null) && suppliers.containsKey(targetId.trim())) {
                    request.setAttribute("supplier", suppliers.get(targetId));
                    context.getRequestDispatcher("/SupplierSearch.jsp").forward(request, response);
                }
            }
        }else{
            suppliers=IngredientController.autoCompleteIngredient(1);
            if (action.equals("complete")) {

                // check if user sent empty string
                if (!targetId.equals("")) {

                    Iterator it = suppliers.keySet().iterator();

                    while (it.hasNext()) {
                        String id = (String) it.next();
                        //temp removal ------ Supplier supplier = (Supplier) suppliers.get(id);
                        Ingredient ingredient = (Ingredient) suppliers.get(id);
                        //temp removal-----if (supplier.getSupplier_name().toLowerCase().contains(targetId)
                        if (ingredient.getName().toLowerCase().contains(targetId)) //temp removal-----|| // targetId matches last name
                        //temp removal-----supplier.getSupplier_type().toLowerCase().contains(targetId)
                        /*|| // targetId matches full name
                            supplier.getFirstName().toLowerCase().concat(" ")
                            .concat(supplier.getLastName().toLowerCase()).contains(targetId))*/ //)
                        {

                            sb.append("<composer>");
                            sb.append("<id>" + /*supplier.getSupplier_id()*/ id + "</id>");
                            sb.append("<supplierName>" + /*supplier.getSupplier_name()*/ ingredient.getName() + "</supplierName>");
                            sb.append("<supplierType>" + /*supplier.getSupplier_type()*/ UserDAO.getSupplierById(ingredient.getSupplier_id()).getSupplier_name() + "</supplierType>");
                            sb.append("</composer>");
                            namesAdded = true;
                        }
                    }
                }

                if (namesAdded) {
                    response.setContentType("text/xml");
                    response.setHeader("Cache-Control", "no-cache");
                    response.getWriter().write("<composers>" + sb.toString() + "</composers>");
                } else {
                    //nothing to show
                    response.setStatus(HttpServletResponse.SC_NO_CONTENT);
                }
            }
            if (action.equals("lookup")) {

                // put the target supplier in the request scope to display 
                if ((targetId != null) && suppliers.containsKey(targetId.trim())) {
                    request.setAttribute("ingredient", suppliers.get(targetId));
                    context.getRequestDispatcher("/SupplierSearch.jsp").forward(request, response);
                }
            }
        }
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