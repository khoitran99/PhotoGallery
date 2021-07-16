/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbcontext.DBContext;
import entity.Image;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author khoi.tranvan
 */
public class ImageDAO {

    /* Get list of Image by gallery id */
    public List<Image> getImagesByGalleryId(int galleryId) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Images WHERE gallery_id = ?";
        List<Image> listImage = new ArrayList<>();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, galleryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Image image = new Image();
                image.setGallery_id(galleryId);
                image.setId(rs.getInt("id"));
                image.setUrl(rs.getString("image_url"));
                listImage.add(image);
            }
            return listImage;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    /* Get cover image of the gallery */
    public Image getGalleryFirstImage(int galleryId) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT TOP 1 * FROM Images WHERE gallery_id = ? ORDER BY NEWID()";
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, galleryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Image image = new Image();
                image.setGallery_id(galleryId);
                image.setId(rs.getInt("id"));
                image.setUrl(rs.getString("image_url"));
                return image;
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }

    /* Paging list of image with gallery id , current page (index) and size of page (size) */
    public List<Image> getImagePagingList(int galleryId, int index, int size) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Images WHERE gallery_id = ? ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROW ONLY";

        List<Image> listImage = new ArrayList<>();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, galleryId);
            ps.setInt(2, (index - 1) * size);
            ps.setInt(3, size);
            rs = ps.executeQuery();
            while (rs.next()) {
                Image image = new Image();
                image.setId(rs.getInt("id"));
                image.setGallery_id(galleryId);
                image.setUrl(rs.getString("image_url"));
                listImage.add(image);
            }
            return listImage;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    /* Count number of images which has same gallery id */
    public int countImageByGalleryId(int galleryId) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) AS total FROM Images WHERE gallery_id = ?";
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, galleryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {

            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return 0;
    }

}
