/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import bean.Author;
import bean.Book;
import bean.User;
import bean.folder;
import bean.kind;
import db.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lie
 */
public class adminModel {
    public final static int ROW_PER_PAGE = 6;
    public final static int ROW_PER_PAGE1 = 10;
    public Book getBook(String id) throws Exception{
        
        Connection conn=DBConnector.getConnection();
        String sql= "select* from book as b , folder as f, kind as k, comment as c, author as a\n" +
        "where b.idauthor = a.id and b.idkind = k.id and b.idcomment = c.id and b.idfolder = f.idfolder and idbook=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        Book b = new Book();
        while(rs.next()){
            b.setId(rs.getInt("b.idbook"));
            b.setName(rs.getString("b.name"));
            b.setAuthor(rs.getString("a.nameauthor"));
            b.setComment(rs.getString("c.comment"));
            b.setDescribe(rs.getString("b.describe"));
            b.setConten(rs.getString("b.conten"));
            b.setKind(rs.getString("k.name"));
            b.setImages(rs.getString("b.images"));
            b.setVote(rs.getInt("b.idvote"));
            b.setPrice(rs.getString("b.price"));
            b.setFolder(rs.getString("f.name"));
        }
        return  b;
    }
    public Author getAuthor(String id) throws Exception{
        
        Connection conn=DBConnector.getConnection();
        String sql= "select* from  author where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
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
    public kind getKind(String id) throws Exception{
        
        Connection conn=DBConnector.getConnection();
        String sql= "select* from  kind where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        kind k = new kind();
        while(rs.next()){
            k.setId(rs.getInt("id"));
            k.setName(rs.getString("name"));
        }
        return  k;
    }
    public folder getFolder(String id) throws Exception{
        
        Connection conn=DBConnector.getConnection();
        String sql= "select* from  folder where idfolder=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        folder f = new folder();
        while(rs.next()){
            f.setId(rs.getInt("idfolder"));
            f.setName(rs.getString("name"));
        }
        return  f;
    }
    public User getUser(String id) throws Exception{
        Connection conn=DBConnector.getConnection();
        System.out.println(id);
        String sql= "select* from  user where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        User u = new User();
        while(rs.next()){
            u.setId(rs.getInt("id"));
            u.setUsername(rs.getString("username"));
            u.setEmail(rs.getString("email"));
            u.setAge(rs.getInt("age"));
            u.setIdgroup(rs.getInt("idgroup"));
            System.out.println(u);
        }
        return  u;
    }
    public static int updateu(User u)throws Exception{
        Connection conn= DBConnector.getConnection();
        String sql = "update user set username=?, email=?, age=?, idgroup=? where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, u.getUsername());
        pstmt.setString(2, u.getEmail());
        pstmt.setInt(3, u.getAge());
        pstmt.setInt(4,u.getIdgroup() );
        pstmt.setInt(5, u.getId());
        return pstmt.executeUpdate();
    }
    public static int updatef(folder f)throws Exception{
        Connection conn= DBConnector.getConnection();
        String sql = "update folder set name=? where idfolder=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, f.getName());
        pstmt.setInt(2, f.getId());
        System.out.println(f);
        return pstmt.executeUpdate();
    }
    public static int updatek(kind k)throws Exception{
        Connection conn= DBConnector.getConnection();
        String sql = "update kind set name=? where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, k.getName());
        pstmt.setInt(2, k.getId());
        return pstmt.executeUpdate();
    }
    public static int addbook(Book b) throws Exception{
        Connection conn = DBConnector.getConnection();
        String sql= "INSERT INTO book (`name`, `idauthor`, `describe`, `conten`, `idkind`, `idcomment`, `images`, `price`, `idfolder`) VALUES (?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, b.getName());
        pstmt.setString(2, b.getAuthor());
        pstmt.setString(3, b.getDescribe());
        pstmt.setString(4, b.getConten());
        pstmt.setString(5, b.getKind());
        pstmt.setString(6, b.getComment());
        pstmt.setString(7, b.getImages());
        pstmt.setString(8, b.getPrice());
        pstmt.setString(9, b.getFolder());
        return pstmt.executeUpdate();
        
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
     public  List<Author> getAllAuthor()throws Exception{
        List<Author> list = new ArrayList<>();
        Connection conn=DBConnector.getConnection();
        String sql= "select* from author ";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            Author a = new Author();
            a.setId(rs.getInt("id"));
            a.setName(rs.getString("nameauthor"));
            a.setAge(rs.getInt("age"));
            list.add(a);  
        }
        return  list;
    }
     public  List<folder> getAllFolder()throws Exception{
        List<folder> list = new ArrayList<>();
        Connection conn=DBConnector.getConnection();
        String sql= "select* from folder ";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            folder f = new folder();
            f.setId(rs.getInt("idfolder"));
            f.setName(rs.getString("name"));
            list.add(f);  
        }
        return  list;
    }
      public  List<User> getAllUser()throws Exception{
        List<User> listuser = new ArrayList<>();
        Connection conn=DBConnector.getConnection();
        String sql= "select* from user ";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            User u = new User();
            u.setId(rs.getInt("id"));
            u.setUsername(rs.getString("username"));
            u.setEmail(rs.getString("email"));
            u.setAge(rs.getInt("age"));
            u.setIdgroup(rs.getInt("idgroup"));
            listuser.add(u);  
        }
        return  listuser;
    }
      public  List<kind> getAllKind()throws Exception{
        List<kind> listkind = new ArrayList<>();
        Connection conn=DBConnector.getConnection();
        String sql= "select* from kind ";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            kind k = new kind();
            k.setId(rs.getInt("id"));
            k.setName(rs.getString("name"));
            listkind.add(k);  
            System.out.println(k);
        }
        return  listkind;
    }
    
     public int countuser() throws Exception {
        Connection conn = DBConnector.getConnection();
        String sql = "SELECT COUNT(*)  FROM user";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        int sumu = 0;
        while (rs.next()) {
            sumu = rs.getInt(1);
        }
        return sumu;
    }
    public  static int addAuthor(Author a)throws Exception{
        Connection conn= DBConnector.getConnection();
        String sql ="insert into author(nameauthor, age)values(?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, a.getName());
        pstmt.setInt(2, a.getAge());
        return pstmt.executeUpdate();
    }
    public static int updatea(Author a)throws Exception{
        Connection conn= DBConnector.getConnection();
        String sql = "update author set nameauthor=?, age=? where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, a.getName());
        pstmt.setInt(2, a.getAge());
        pstmt.setInt(3, a.getId());
        System.out.println(a);
        return pstmt.executeUpdate();
    }
    public static int addKind(kind k )throws Exception{
        Connection conn = DBConnector.getConnection();
        String sql = "insert into kind(name)values(?)";
        PreparedStatement pstmt =conn.prepareStatement(sql);
        pstmt.setString(1, k.getName());
        return pstmt.executeUpdate();
    }
    public static int addFolder(folder f)throws Exception{
        Connection conn= DBConnector.getConnection();
        String sql= "insert into folder(name)values(?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, f.getName());
        return pstmt.executeUpdate();
    }
    public static int update(Book b)throws Exception{
        Connection conn= DBConnector.getConnection();
        String sql = "update book set name=?, conten=?,images=?,price=? where idbook=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, b.getName());
        pstmt.setString(2, b.getConten());
        pstmt.setString(3, b.getImages());
        pstmt.setString(4, b.getPrice());
        pstmt.setInt(5, b.getId());
        return pstmt.executeUpdate();
    }
    public static int deletebook(int id) throws Exception{
        String sql ="delete from book where idbook=?";
        Connection con= DBConnector.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        return pstmt.executeUpdate();
    }
    public static int deleteauthor(int id) throws Exception{
        String sql ="delete from author where id=?";
        Connection con= DBConnector.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        return pstmt.executeUpdate();
    }
    public static int deletefolder(int id) throws Exception{
        String sql ="delete from folder where idfolder=?";
        Connection con= DBConnector.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        return pstmt.executeUpdate();
    }
    public static int deletekind(int id) throws Exception{
        String sql ="delete from kind where id=?";
        Connection con= DBConnector.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        return pstmt.executeUpdate();
    }
    public static int deletecomment(int id) throws Exception{
        String sql ="delete from comment where id=?";
        Connection con= DBConnector.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        return pstmt.executeUpdate();
    }
    public static int deleteuser(int id) throws Exception{
        String sql ="delete from user where id=?";
        Connection con= DBConnector.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, id);
        return pstmt.executeUpdate();
    }
}
