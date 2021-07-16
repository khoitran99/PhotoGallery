/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ContactDAO;
import dao.GalleryDAO;
import entity.Contact;
import entity.Gallery;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author khoi.tranvan
 */
public class ContactController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ContactDAO contactDAO = new ContactDAO();
            Contact contact = contactDAO.getContact();

            GalleryDAO galleryDAO = new GalleryDAO();
            List<Gallery> galleryHeader = galleryDAO.getTop3Gallery();

            request.setAttribute("galleryHeader", galleryHeader);
            request.setAttribute("contact", contact);
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }

}
