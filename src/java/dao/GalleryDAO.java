/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbcontext.DBContext;
import entity.Gallery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author khoi.tranvan
 */
public class GalleryDAO {

    /* Count number of gallery records in database */
    public int countGallery() throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "Select COUNT(*) AS total FROM gallery";
        int count = 0;
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return count;
    }

    /* Get 3 gallery records from database to display on the head of website */
    public List<Gallery> getTop3Gallery() throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT TOP 3 * FROM Gallery ORDER BY id";
        List<Gallery> listGallery = new ArrayList<>();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Gallery gallery = new Gallery();
                gallery.setId(rs.getInt("id"));
                gallery.setName(rs.getString("name"));
                gallery.setDescription(rs.getString("description"));
                gallery.setTitle(rs.getString("title"));
                listGallery.add(gallery);
            }
            return listGallery;
        } catch (Exception e) {

            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    /* Get specific gallery from database with its id */
    public Gallery getGalleryById(int id) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Gallery WHERE id = ?";

        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Gallery gallery = new Gallery();
                gallery.setId(rs.getInt("id"));
                gallery.setTitle(rs.getString("title"));
                gallery.setName(rs.getString("name"));
                gallery.setDescription(rs.getString("description"));
                return gallery;
            }
        } catch (Exception e) {

            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }

    /* Get paging list of gallery by the current page (index ) and the size of page (size) */

    public List<Gallery> getGalleryPagingList(int index, int size) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Gallery ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Gallery> listGallery = new ArrayList<>();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, (index - 1) * size);
            ps.setInt(2, size);
            rs = ps.executeQuery();
            while (rs.next()) {
                Gallery gallery = new Gallery();
                gallery.setId(rs.getInt("id"));
                gallery.setName(rs.getString("name"));
                gallery.setDescription(rs.getString("description"));
                gallery.setTitle(rs.getString("title"));
                listGallery.add(gallery);
            }
            return listGallery;
        } catch (Exception e) {

            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

}
