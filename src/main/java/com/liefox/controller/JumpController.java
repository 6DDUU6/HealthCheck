package com.liefox.controller;

import com.liefox.pojo.User;
import com.liefox.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @Author zjh
 * @Date 2021/4/10 上午 1:15
 **/
@Controller
public class JumpController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    //跳转首页
    @RequestMapping("/jumpMain")
    public String jumpMain(HttpSession session,HttpServletRequest request) {
        User user = (User) session.getAttribute("user1");
        request.setAttribute("list", userService.queryDakaRecord(user));
        return "main";
    }

    //跳转成功
    @RequestMapping("/jumpRegister")
    public String jumpRegister(HttpSession session) {
        session.removeAttribute("info");
        return "register";
    }

    //跳转到个人信息
    @RequestMapping("/jumpUserMod")
    public String jumpUserMod(){
        return "usermod";
    }

    @RequestMapping("/jumpModifySchool")
    public String jumpModifySchool() {
        return "admin";
    }

    @RequestMapping("/jumpModifyTip")
    public String jumpModifyTip() {
        return "adminTip";
    }

    @RequestMapping("/jumpTeacherMain")
    public String jumpTeacherMain() {
        return "teacher";
    }

    @RequestMapping("/jumpTeacherModifyTip")
    public String jumpTeacherModifyTip() {
        return "teacherTip";
    }

    @RequestMapping("/jumpSign/{signid}")
    public String jumpSign(HttpSession session,@PathVariable int signid) {
        session.setAttribute("signid",signid);
        return "sign";
    }
}
