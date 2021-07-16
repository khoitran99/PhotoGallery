/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ContactDAO;
import dao.GalleryDAO;
import dao.ImageDAO;
import entity.Contact;
import entity.Gallery;
import entity.Image;
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
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ImageDAO imageDAO = new ImageDAO();
            GalleryDAO galleryDAO = new GalleryDAO();
            ContactDAO contactDAO = new ContactDAO();

            Contact contact = contactDAO.getContact();
            /* Header data */
            List<Gallery> galleryHeader = galleryDAO.getTop3Gallery();
            /* Right data */

 /* Calculate gallery pages */
            int index = 1, size = 4;
            if (request.getParameterMap().containsKey("index")) {
                try {
                    index = Integer.parseInt(request.getParameter("index"));
                } catch (Exception e) {
                    index = 1;
                }
            }

            int totalItems = galleryDAO.countGallery();
            int totalPage = totalItems / size;
            if (totalItems % size != 0) {
                totalPage++;
            }
            
            List<Gallery> listPaging = galleryDAO.getGalleryPagingList(index, size);
            for(Gallery g : listPaging){
                g.setUrl(imageDAO.getGalleryFirstImage(g.getId()).getUrl());
            }
            

            request.setAttribute("list", listPaging);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("contact", contact);
            request.setAttribute("galleryHeader", galleryHeader);
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
