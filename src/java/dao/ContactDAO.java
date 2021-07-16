/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbcontext.DBContext;
import entity.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author khoi.tranvan
 */
public class ContactDAO {

    /* Get contact data from database */
    public Contact getContact() throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT TOP 1 * FROM Contact";
        Contact contact = new Contact();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                contact.setAbout(rs.getString("about"));
                contact.setAddress(rs.getString("address"));
                contact.setImageMain(rs.getString("image_main"));
                contact.setCity(rs.getString("city"));
                contact.setContentMain(rs.getString("content_main"));
                contact.setMap(rs.getString("map"));
                contact.setGoogleUrl(rs.getString("google_url"));
                contact.setTwitterUrl(rs.getString("twitter_url"));
                contact.setFaceUrl(rs.getString("face_url"));
                contact.setEmail(rs.getString("email"));
                contact.setCountry(rs.getString("country"));
                contact.setTelephone(rs.getString("telephone"));
            }
            return contact;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }
}
