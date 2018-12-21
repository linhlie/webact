/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Book;
import bean.User;
import bean.Comment;
import bean.folder;
import static java.util.Collections.list;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.UserModel;
import model.adminModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes("loginInfo")
@RequestMapping
public class HomeController {

    UserModel usermodel = new UserModel();
     @RequestMapping(value = {"/index.htm"})
    public String index(ModelMap map) {
         System.out.println();
        UserModel userModel = new UserModel();
        try {
            List<Book> all = userModel.getAll();
            map.addAttribute("book", all);
            map.addAttribute("listBook", all);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return "index";
    }
@RequestMapping(value="/kindbook.htm")
    public String listFolder(ModelMap map,String id){
        map.addAttribute("listbook",new Book());
        UserModel us = new UserModel();
        try {
            List<Book> list =us.getAllKind(id);
            map.addAttribute("folder", list);
            map.addAttribute("listFolder", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "kindbook";
    }
    @RequestMapping("/book.htm")
    public String book() {
        return "book";
    }

    @RequestMapping("/thisbook.htm")
    public String thisbook() {
        return "thisbook";
    }
    @RequestMapping("/admin.htm")
    public String admin() {
        return "admin";
    }
    @RequestMapping("/login.htm")
    public String login(ModelMap model) {
        model.addAttribute("loginForm", new User());
        return "login";
    }

    @RequestMapping("/auth.htm")
    public String auth(@ModelAttribute("loginForm") User user, ModelMap model) {
        UserModel userModel = new UserModel();
        try {
            boolean auth = userModel.auth(user.getUsername(), user.getPassword());
            if (auth) {
                model.addAttribute("loginInfo", user.getUsername());
            } else {
                return "redirect:/login.htm";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/index.htm";
    }

    @RequestMapping("/logout.htm")
    public String logout(ModelMap model) {
        model.addAttribute("loginForm", new User());
        model.addAttribute("loginInfo", "");
        return "redirect:/index.htm";
    }
    
    @RequestMapping("/register.htm")
    public String register(ModelMap model) {
        model.addAttribute("signupForm", new User());
        return "register";
    }

    @RequestMapping("/signup.htm")
    public String register(@ModelAttribute("signupForm") User user, ModelMap model) throws Exception {
        UserModel userModel = new UserModel();
        model.addAttribute("signupForm", user);
        userModel.register(user);
        return "redirect:/login.htm";
    }

    @RequestMapping("/search.htm")
    public String search(@ModelAttribute("searchBook") Book book, RedirectAttributes ra, ModelMap model, HttpServletRequest request) throws Exception {
        UserModel userModel = new UserModel();
        request.setCharacterEncoding("UTF-8");
        String name = new String(request.getParameter("name").getBytes(), "UTF-8");
        List<Book> list = userModel.getsearchbook(book.getName());
        System.out.println("name");
        model.addAttribute("searchBook", list);
        return "searchbook";
    }
//    @RequestMapping("/addcomment.htm")
//    public String addcomment(ModelMap model) throws Exception{
//        model.addAttribute("commentBook",new Comment());
//        return "addcomment";
//    }
//    
//    @RequestMapping("")
//    public String addc(ModelMap model,  Comment c) throws Exception{
//        UserModel us = new UserModel();
//        model.addAttribute("commentBook",c);
//        us.comment(c);
//        return "redirect:/thisbook.htm";
//    }
//    @RequestMapping(value="/comment.htm", method = RequestMethod.POST)
//    public String login(@ModelAttribute("commentBook") Comment c,BindingResult result) throws Exception {
//        UserModel us = new UserModel();
//        us.comment(c);
//        return "redirect:/thisbook.htm";
//    }
    
}
