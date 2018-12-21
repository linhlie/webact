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
public class Comment {
    private int id;
    private String conten;

    public Comment() {
    }

    public Comment(int id, String conten) {
        this.id = id;
        this.conten = conten;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getConten() {
        return conten;
    }

    public void setConten(String conten) {
        this.conten = conten;
    }

    @Override
    public String toString() {
        return "Comment{" + "id=" + id + ", conten=" + conten + '}';
    }
    
}
