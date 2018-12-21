/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Author;
import bean.Book;
import bean.User;
import bean.folder;
import bean.kind;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;
import model.UserModel;
import model.adminModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Lie
 */
@Controller
@RequestMapping       
public class AdminController {
    UserModel user= new UserModel();
    adminModel ad = new adminModel();
    @RequestMapping("/addbook.htm")
    public String addbook(ModelMap model) throws Exception{
        model.addAttribute("addNew",new Book());
        return "addbook";
    }
    @RequestMapping("/add.htm")
    public String add(ModelMap model,  Book b) throws Exception{
        adminModel ad = new adminModel();
        model.addAttribute("addNew",b);
        ad.addbook(b);
        return "redirect:/listbook.htm";
    }
    @RequestMapping(value="/listbook.htm")
    public String listBook(@RequestParam(value = "page",defaultValue = "1") int page ,ModelMap map){
        map.addAttribute("List",new Book());
        adminModel ad = new adminModel();
        try {
            List<Book> all = ad.getAllPage(page);
            int rowsCount = ad.count(); //=103
            int pages = (int) Math.ceil(rowsCount / ad.ROW_PER_PAGE);
            map.addAttribute("book", all);
            map.addAttribute("current", page);
            map.addAttribute("total", pages);
            map.addAttribute("listBook", all);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "listbook";
    }
    @RequestMapping(value="/updatebook.htm")
    public String updateBook(ModelMap map,String id){
        map.addAttribute("updateb",new Book());
        adminModel ad = new adminModel();
        try {
            Book b = ad.getBook(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "updatebook";
    }
    @RequestMapping(value="/updateb.htm")
    public String updateB(ModelMap map,Book b){
        map.addAttribute("updateb");
        adminModel ad = new adminModel();
        try {
            ad.update(b);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/listbook.htm";
    }
    
    @RequestMapping("addfolder.htm")
    public String addfolder(ModelMap model){
        model.addAttribute("addNewf",new folder());
        return "addfolder";
    }
    @RequestMapping("/addf.htm")
    public String addf(ModelMap model, folder f)throws Exception{
        adminModel ad = new adminModel();
        model.addAttribute("addNewf",f);
        ad.addFolder(f);
        return "redirect:/listfolder.htm";
    }
    @RequestMapping(value="/listfolder.htm")
    public String listFolder(ModelMap map){
        map.addAttribute("ListFolder",new folder());
        adminModel ad = new adminModel();
        try {
            List<folder> list =ad.getAllFolder();
            map.addAttribute("folder", list);
            map.addAttribute("listFolder", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "listfolder";
    }
    @RequestMapping(value="/updatefolder.htm")
    public String updatefolder(ModelMap map,String id){
        map.addAttribute("updatef",new folder());
        adminModel ad = new adminModel();
        try {
            folder f = ad.getFolder(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "updatefolder";
    }
    @RequestMapping(value="/updatef.htm")
    public String updateF(ModelMap map,folder f){
        map.addAttribute("updatef");
        adminModel ad = new adminModel();
        try {
            ad.updatef(f);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/listfolder.htm";
    }
    @RequestMapping("addkind.htm")
    public String addkind(ModelMap model){
        model.addAttribute("addNewk",new kind());
        return "addkind";
    }
    @RequestMapping("/addk.htm")
    public String addk(ModelMap model, kind k)throws Exception{
        adminModel ad = new adminModel();
        model.addAttribute("addNewk",k);
        ad.addKind(k);
        return "redirect:/listkind.htm";
    }
    @RequestMapping(value="/listkind.htm")
    public String listKind(ModelMap map){
        map.addAttribute("ListKind",new kind());
        adminModel ad = new adminModel();
        try {
            List<kind> list =ad.getAllKind();
            map.addAttribute("kind", list);
            map.addAttribute("listKind", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "listkind";
    }
    @RequestMapping("/updatekind.htm")
    public String updatekind(ModelMap map,String id){
        map.addAttribute("updatek",new kind());
        adminModel ad = new adminModel();
        try {
            kind k = ad.getKind(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "updatekind";
    }
    @RequestMapping("/updatek.htm")
    public String updateU(ModelMap map,kind k){
        map.addAttribute("updatek");
        adminModel ad = new adminModel();
        try {
            ad.updatek(k);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/listkind.htm";
    }
    @RequestMapping(value="/addauthor.htm")
    public String addauthor(ModelMap model){
        model.addAttribute("addNewa",new Author());
        return "addauthor";
    }
     @RequestMapping(value="/addau.htm")
    public String addau(ModelMap model, Author a) throws Exception{
        adminModel ad = new adminModel();
        model.addAttribute("addNewa",a);
        ad.addAuthor(a);
        return "redirect:/listauthor.htm";
    }
    
    @RequestMapping(value="/listauthor.htm")
    public String listAuthor(ModelMap map){
        map.addAttribute("ListAuthor",new Author());
        adminModel ad = new adminModel();
        try {
            List<Author> all = ad.getAllAuthor();
            map.addAttribute("author", all);
            map.addAttribute("listAuthor", all);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "listauthor";
    }
   
    @RequestMapping(value="/updateauthor.htm")
    public String updateauthor(ModelMap map,String id){
        map.addAttribute("updatea",new Author());
        adminModel ad = new adminModel();
        try {
            Author a = ad.getAuthor(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "updateauthor";
    }
    @RequestMapping(value="/updatea.htm")
    public String updateA(ModelMap map,Author a){
        map.addAttribute("updatea");
        adminModel ad = new adminModel();
        try {
            ad.updatea(a);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/listauthor.htm";
    }
    @RequestMapping(value="/listuser.htm")
    public String listUser(ModelMap map){
        map.addAttribute("ListUser",new User());
        adminModel ad = new adminModel();
        try {
            List<User> listuser =ad.getAllUser();
            map.addAttribute("user", listuser);
            map.addAttribute("listUser", listuser);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "listuser";
    }
    @RequestMapping("/updateuser.htm")
    public String updateuser(ModelMap map,String id){
        map.addAttribute("updateu",new User());
        adminModel ad = new adminModel();
        try {
            User u = ad.getUser(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "updateuser";
    }
    @RequestMapping("/updateu.htm")
    public String updateU(ModelMap map,User u){
        map.addAttribute("updateu");
        adminModel ad = new adminModel();
        try {
            ad.updateu(u);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/listuser.htm";
    }
    @RequestMapping(value="/deletebook.htm")
    public String deletebook(ModelMap model, int id) throws Exception{
        adminModel ad = new adminModel();
        ad.deletebook(id);
        return "redirect:/listbook.htm";
    }
    @RequestMapping(value="/deleteauthor.htm")
    public String deleteauthor(ModelMap model, int id) throws Exception{
        adminModel ad = new adminModel();
        ad.deleteauthor(id);
        return "redirect:/listauthor.htm";
    }
    @RequestMapping(value="/deletefolder.htm")
    public String deletefolder(ModelMap model, int id) throws Exception{
        adminModel ad = new adminModel();
        ad.deletefolder(id);
        return "redirect:/listfolder.htm";
    }
    @RequestMapping(value="/deletekind.htm")
    public String deletekind(ModelMap model, int id) throws Exception{
        adminModel ad = new adminModel();
        ad.deletekind(id);
        return "redirect:/listkind.htm";
    }
    @RequestMapping(value="/deletecomment.htm")
    public String deletecomment(ModelMap model, int id) throws Exception{
        adminModel ad = new adminModel();
        ad.deletecomment(id);
        return "redirect:/listcomment.htm";
    }
    @RequestMapping(value="/deleteuser.htm")
    public String deleteuser(ModelMap model, int id) throws Exception{
        adminModel ad = new adminModel();
        ad.deleteuser(id);
        return "redirect:/listuser.htm";
    }
    
}
