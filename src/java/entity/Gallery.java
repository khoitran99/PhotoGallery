/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import dao.ImageDAO;
import java.util.List;

/**
 *
 * @author khoi.tranvan
 */
public class Gallery {

    private int id;
    private String title;
    private String description;
    List<Image> images;
    private String name;
    private String url;

    public Gallery() {
    }

    public Gallery(int id, String title, String description, List<Image> images, String name, String url) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.images = images;
        this.name = name;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}
