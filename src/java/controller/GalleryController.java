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
public class GalleryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Integer id = null;
            if (request.getParameterMap().containsKey("id")) {
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    response.sendRedirect("home");
                    return;
                }
            }

            Integer index = 1;
            if (request.getParameterMap().containsKey("index")) {
                try {
                    index = Integer.parseInt(request.getParameter("index"));
                } catch (NumberFormatException e) {
                    index = 1;
                }
            }

            Integer view = null;
            if (request.getParameterMap().containsKey("view")) {
                try {
                    view = Integer.parseInt(request.getParameter("view"));
                } catch (NumberFormatException e) {
                    view = null;
                }
            }

            GalleryDAO galleryDAO = new GalleryDAO();
            ImageDAO imageDAO = new ImageDAO();
            ContactDAO contactDAO = new ContactDAO();
            
            Contact contact = contactDAO.getContact();                          /* Header data */
            List<Gallery> galleryHeader = galleryDAO.getTop3Gallery();          /* Right data */
            
            /* Calculate gallery pages */
            Gallery gallery = galleryDAO.getGalleryById(id);
            if (gallery == null) {
                response.sendRedirect("home");
                return;
            }

            int size = 8;
            int totalImage = imageDAO.countImageByGalleryId(id);
            int totalPage = totalImage / 8;
            if (totalImage % size != 0) {
                totalPage++;
            }
            if (index > totalPage) {
                response.sendRedirect("gallery?id=" + id);
                return;
            }

            List<Image> listImg = imageDAO.getImagePagingList(id, index, size); /* Get paging list image with gallery id , current pages index (index) and size of page(size) */
            List<Image> listImage = imageDAO.getImagesByGalleryId(id);          /* Get list of image with gallery id */

            if (listImg == null || listImage == null) {
                response.sendRedirect("home");
                return;
            } else {
                gallery.setImages(listImage);
                request.setAttribute("modelGallery", gallery);
                request.setAttribute("modelPaging", listImg);
                request.setAttribute("idGallery", id);
                request.setAttribute("totalPage", totalPage);
                if (view != null) {
                    /* If has view id , get id positon of image */
                    Image imageView = new Image();
                    boolean check = false;
                    Integer idBefore = null;
                    Integer idAfter = null;
                    int imageCurrent = 0;
                    for (int i = 0; i < listImage.size(); i++) {
                        if (view == listImage.get(i).getId()) {
                            imageView = listImage.get(i);
                            if (i > 0 && i < listImage.size() - 1) {
                                idBefore = listImage.get(i - 1).getId();
                                idAfter = listImage.get(i + 1).getId();
                            }
                            if (i == 0) {
                                idAfter = listImage.get(i + 1).getId();
                            }
                            if (i == listImage.size() - 1) {
                                idBefore = listImage.get(i - 1).getId();
                            }
                            imageCurrent=i+1;
                            check = true;
                            break;
                        }
                    }
                    /* Check is responsible for error if user input view number that is not correct */
                    if (check) {
                        request.setAttribute("idCurrent", imageCurrent);
                        request.setAttribute("viewImageModel", imageView);
                        request.setAttribute("idBefore", idBefore);
                        request.setAttribute("idAfter", idAfter);
                    } else {
                        response.sendRedirect("gallery?id=" + id);
                        return;
                    }
                }
            }
            request.setAttribute("idGallery", id);
            request.setAttribute("galleryHeader", galleryHeader);
            request.setAttribute("contact", contact);
            request.getRequestDispatcher("gallery.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
