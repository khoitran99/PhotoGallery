/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author khoi.tranvan
 */
public class Contact {

    private String address;
    private String city;
    private String country;
    private String telephone;
    private String email;
    private String faceUrl;
    private String twitterUrl;
    private String googleUrl;
    private String about;
    private String imageMain;
    private String map;
    private String contentMain;

    public Contact() {
    }

    public Contact(String address, String city, String country, String telephone, String email, String faceUrl, String twitterUrl, String googleUrl, String about, String imageMain, String map, String contentMain) {
        this.address = address;
        this.city = city;
        this.country = country;
        this.telephone = telephone;
        this.email = email;
        this.faceUrl = faceUrl;
        this.twitterUrl = twitterUrl;
        this.googleUrl = googleUrl;
        this.about = about;
        this.imageMain = imageMain;
        this.map = map;
        this.contentMain = contentMain;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFaceUrl() {
        return faceUrl;
    }

    public void setFaceUrl(String faceUrl) {
        this.faceUrl = faceUrl;
    }

    public String getTwitterUrl() {
        return twitterUrl;
    }

    public void setTwitterUrl(String twitterUrl) {
        this.twitterUrl = twitterUrl;
    }

    public String getGoogleUrl() {
        return googleUrl;
    }

    public void setGoogleUrl(String gooleUrl) {
        this.googleUrl = gooleUrl;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getImageMain() {
        return imageMain;
    }

    public void setImageMain(String imageMain) {
        this.imageMain = imageMain;
    }

    public String getMap() {
        return map;
    }

    public void setMap(String map) {
        this.map = map;
    }

    public String getContentMain() {
        return contentMain;
    }

    public void setContentMain(String contentMain) {
        this.contentMain = contentMain;
    }

}
