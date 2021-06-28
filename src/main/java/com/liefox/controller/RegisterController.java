package com.liefox.controller;


import com.liefox.pojo.school;
import com.liefox.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.liefox.pojo.school;

import javax.servlet.http.HttpSession;

/**
 * @Author zjh
 * @Date 2021/4/10 上午 1:15
 **/
@Controller
public class RegisterController {
    /**
     * 调用service层的登录方法
     */
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @RequestMapping("/IfRegister")
    public String Register(HttpSession session,String username, String password, String school){
        school sc = userService.querySchoolByName(school);
        if(sc == null){
            session.setAttribute("info","学校不存在!");
            return "register";
        }
        try {
            int result = userService.regUser(username,password,2,sc.getSchoolid());
            if (result != 0){
                return "redirect:/login.jsp";
            }
        }catch (Exception e){
            session.setAttribute("info","用户名已存在!");
            System.out.println("用户名已存在！");
            return "register";
        }
        session.removeAttribute("info");
        return "redirect:/login.jsp";

    }

    @RequestMapping("/IfTeacherRegister")
    public String TeacherRegister(HttpSession session,String username, String password, String school){
        school sc = userService.querySchoolByName(school);
        if(sc == null){
            session.setAttribute("info","学校不存在!");
            return "tregister";
        }
        try {
            int result = userService.regUser(username,password,1,sc.getSchoolid());
            if (result != 0){
                return "redirect:/login.jsp";
            }
        }catch (Exception e){
            session.setAttribute("info","用户名已存在!");
            System.out.println("用户名已存在！");
            return "tregister";
        }
        session.removeAttribute("info");
        return "redirect:/login.jsp";

    }
}
