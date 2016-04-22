package com.work.controller;

import javax.annotation.Resource;  
import javax.servlet.http.HttpServletRequest;  
 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;  
import org.springframework.web.bind.annotation.RequestMapping;  
 

import com.work.pojo.User;  
import com.work.service.UserService;  
 
@Controller  
@RequestMapping("/user")  
public class UserController {  
   @Resource  
   private UserService userService;  
  
   @RequestMapping("/showUser")  
   public String toIndex(HttpServletRequest request,User users,Model model){  
       //int userId = Integer.parseInt(request.getParameter("id"));
	   System.out.println(users.getId());
       User user = this.userService.getUserById(users.getId());  
       model.addAttribute("user2", user);  
       return "showUser";  
   }  
}  
