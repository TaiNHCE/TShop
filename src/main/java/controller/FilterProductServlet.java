/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BrandDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;
import model.Brand;
import model.Product;

/**
 *
 * @author HP - Gia Khiêm
 */
@WebServlet(name = "FilterProductServlet", urlPatterns = {"/FilterProduct"})
public class FilterProductServlet extends HttpServlet {

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
            out.println("<title>Servlet FilterProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterProductServlet at " + request.getContextPath() + "</h1>");
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

        ProductDAO proDao = new ProductDAO();
        String sort = request.getParameter("sort");
        List<Product> productList = null;
        List<Brand> brandList = null;
        String categoryIdStr = null;
        String brandIdStr = null;

        categoryIdStr = request.getParameter("categoryId");
        brandIdStr = request.getParameter("brandId");

        int categoryId = (categoryIdStr != null) ? Integer.parseInt(categoryIdStr) : -1;
        int brandId = (brandIdStr != null) ? Integer.parseInt(brandIdStr) : -1;

        BrandDAO brandDao = new BrandDAO();

        if (categoryId != -1 && brandId == -1) {
            productList = proDao.getProductByCategory(categoryId);
            brandList = brandDao.getBrandByCategoryId(categoryId);
        }

        if (categoryId != -1 && brandId != -1) {
            productList = proDao.getProductByBrand(brandId);
            brandList = brandDao.getBrandByCategoryId(categoryId);
        }

        request.setAttribute("productList", productList);
        request.setAttribute("brandList", brandList);
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("brandId", brandId);
        request.getRequestDispatcher("/WEB-INF/View/customer/productManagement/filterProduct/filterProduct.jsp").forward(request, response);

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
