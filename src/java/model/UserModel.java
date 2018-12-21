/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import bean.Author;
import bean.Book;
import bean.Comment;
import bean.User;
import db.DBConnector;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.resource.spi.Connector;

/**
 *
 * @author Lie
 */
public class UserModel {
    public final static int ROW_PER_PAGE = 6;
    public boolean auth(String username, String password) throws Exception {
        
        Connection conn = DBConnector.getConnection();
        String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        User u = new User();
        ResultSet rs = pstmt.executeQuery();
        return rs.next();
    }
    public int register (User u) throws Exception{
         Connection conn = DBConnector.getConnection();
         String sql ="insert into user (username, email, password,age)value(?,?,?,?)";
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,u.getUsername());
         pstmt.setString(2, u.getEmail());
         pstmt.setString(3, u.getPassword());
         pstmt.setInt(4, u.getAge());
         
         return  pstmt.executeUpdate();
    }
    public  List<Book>  getAll()throws Exception{
        List<Book> list = new ArrayList<>();
        Connection conn=DBConnector.getConnection();
        String sql= "select* from book";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            Book b = new Book();
            b.setId(rs.getInt("idbook"));
            b.setName(rs.getString("name"));
            b.setAuthor(rs.getString("idauthor"));
            b.setComment(rs.getString("idcomment"));
            b.setDescribe(rs.getString("describe"));
            b.setConten(rs.getString("conten"));
            b.setKind(rs.getString("idkind"));
            b.setImages(rs.getString("images"));
            b.setVote(rs.getInt("idvote"));
            b.setPrice(rs.getString("price"));
            list.add(b);
        }
        return  list;
    }
    public  List<Book>  getAllKind(String id)throws Exception{
        List<Book> list = new ArrayList<>();
        Connection conn=DBConnector.getConnection();
        String sql= "select* from book as b , kind as k where b.idkind = k.id and idkind=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            Book b = new Book();
            b.setId(rs.getInt("idbook"));
            b.setName(rs.getString("name"));
            b.setAuthor(rs.getString("idauthor"));
            b.setComment(rs.getString("idcomment"));
            b.setDescribe(rs.getString("describe"));
            b.setConten(rs.getString("conten"));
            b.setKind(rs.getString("k.name"));
            b.setImages(rs.getString("images"));
            b.setVote(rs.getInt("idvote"));
            b.setPrice(rs.getString("price"));
            list.add(b);
        }
        return  list;
    }
    public  List<Book>  getAllPage(int page)throws Exception{
        List<Book> list = new ArrayList<>();
        Connection conn=DBConnector.getConnection();
        String sql= "SELECT * FROM book LIMIT ?,?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, UserModel.ROW_PER_PAGE * (page - 1) );
        pstmt.setInt(2, UserModel.ROW_PER_PAGE);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            Book b = new Book();
            b.setId(rs.getInt("idbook"));
            b.setName(rs.getString("name"));
            b.setAuthor(rs.getString("idauthor"));
            b.setComment(rs.getString("idcomment"));
            b.setDescribe(rs.getString("describe"));
            b.setConten(rs.getString("conten"));
            b.setKind(rs.getString("idkind"));
            b.setImages(rs.getString("images"));
            b.setVote(rs.getInt("idvote"));
            b.setPrice(rs.getString("price"));
            list.add(b);
        }
        return  list;
    }
    public int count() throws Exception {
        Connection conn = DBConnector.getConnection();
        String sql = "SELECT COUNT(*) as 'SUM' FROM book";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        int sum = 0;
        while (rs.next()) {
            sum = rs.getInt(1);
        }
        return sum;
    }
    public Book getBook(String id) throws Exception{
        
        Connection conn=DBConnector.getConnection();
        String sql= "select* from book where idbook=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        Book b = new Book();
        while(rs.next()){
            b.setId(rs.getInt("idbook"));
            b.setName(rs.getString("name"));
            b.setAuthor(rs.getString("idauthor"));
            b.setComment(rs.getString("idcomment"));
            b.setDescribe(rs.getString("describe"));
            b.setConten(rs.getString("conten"));
            b.setKind(rs.getString("idkind"));
            b.setImages(rs.getString("images"));
            b.setVote(rs.getInt("idvote"));
            b.setPrice(rs.getString("price"));
            b.setFolder(rs.getString("idfolder"));
        }
        return  b;
    }
    public Author getAuthor(String id)throws Exception{
        Connection conn = DBConnector.getConnection();
        String sql = "select* from author where id =?";
        PreparedStatement pstmt =conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        Author a = new Author();
        while(rs.next()){
            a.setId(rs.getInt("id"));
            a.setName(rs.getString("nameauthor"));
            a.setAge(rs.getInt("age"));
        }
        return  a;
    }
   
    public  List<Book> getsearchbook(String name) throws Exception{
        List<Book> list = new ArrayList<>();
        Connection conn= DBConnector.getConnection();
        String sql= "select * from book where name like ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "%"+name+"%");
        ResultSet rs = pstmt.executeQuery();
        Book b = new Book();
        while(rs.next()){
            b.setId(rs.getInt("idbook"));
            b.setName(rs.getString("name"));
            b.setAuthor(rs.getString("idauthor"));
            b.setComment(rs.getString("idcomment"));
            b.setDescribe(rs.getString("describe"));
            b.setConten(rs.getString("conten"));
            b.setKind(rs.getString("idkind"));
            b.setImages(rs.getString("images"));
            b.setVote(rs.getInt("idvote"));
            b.setPrice(rs.getString("price"));
            list.add(b);
        }
        return  list;
    }
    public List<Comment> getComments(String id) throws Exception{
        List<Comment> list = new ArrayList<>();
        Connection conn= DBConnector.getConnection();
        String sql = "select* from comment";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs =pstmt.executeQuery();
        Comment comment = new Comment();
        while(rs.next()){
            comment.setId(rs.getInt("id"));
            comment.setConten(rs.getString("conten"));
        }
        return list;
    }
    public int comment(Comment c)throws Exception{
        Connection conn = DBConnector.getConnection();
        String sql="insert into comment (comment)value(?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, c.getConten());
        return  pstmt.executeUpdate();
        
    }
}
