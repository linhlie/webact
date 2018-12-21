/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Lie
 */
public class Book {
    private int id;
    private String author;
    private String name;
    private String describe;
    private String conten;
    private String comment;
    private String kind;
    private  String images;
    private int vote;
    private String price;
    private String folder;

    
    public Book() {
    }

    public Book(int id, String author, String name, String describe, String conten, String comment, String kind, String images, int vote,String price, String folder) {
        this.id = id;
        this.author = author;
        this.name = name;
        this.describe = describe;
        this.conten = conten;
        this.comment = comment;
        this.kind = kind;
        this.images = images;
        this.vote = vote;
        this.price= price;
        this.folder= folder;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getConten() {
        return conten;
    }

    public void setConten(String conten) {
        this.conten = conten;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public int getVote() {
        return vote;
    }

    public void setVote(int vote) {
        this.vote = vote;
    }
    public String getFolder() {
        return folder;
    }

    public void setFolder(String folder) {
        this.folder = folder;
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + id + ", author=" + author + ", name=" + name + ", describe=" + describe + ", conten=" + conten + ", comment=" + comment + ", kind=" + kind + ", images=" + images + ", vote=" + vote + ", price=" + price + ", folder=" + folder + '}';
    }
    
    
    
}
