package com.liefox.controller;

import com.liefox.pojo.User;
import com.liefox.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @Author zjh
 * @Date 2021/4/10 上午 1:15
 **/
@Controller
public class DataController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    /**
     *
     * @param username 根据用户名
     * @描述 用户打卡记录
     */
    @GetMapping("/queryDataByUsername/{username}")
    public ModelAndView list(HttpSession session,@PathVariable String username){
        User user = (User) session.getAttribute("user1");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("queryDataByUsername");
        modelAndView.addObject("list",userService.queryDataByUserId(user.getUserid()));
        System.out.println(modelAndView);
        return modelAndView;
    }

    @GetMapping("/queryDaKa/{username}")
    public ModelAndView mainPage(HttpSession session) {
        User user = (User) session.getAttribute("user1");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("main");
        modelAndView.addObject("list", userService.queryDakaRecord(user));
        //System.out.println(modelAndView);
        return modelAndView;
    }
}
