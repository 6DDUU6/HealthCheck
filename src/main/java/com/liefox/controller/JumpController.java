package com.liefox.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @Author zjh
 * @Date 2021/4/10 上午 1:15
 **/
@Controller
public class JumpController {
    //跳转首页
    @RequestMapping("/jumpMain")
    public String jumpMain() {
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

}
