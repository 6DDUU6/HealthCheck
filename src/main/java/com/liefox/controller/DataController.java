package com.liefox.controller;

import com.liefox.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView list(@PathVariable String username){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("queryDataByUsername");
        modelAndView.addObject("list",userService.queryDataByUsername(username));
        System.out.println(modelAndView);
        return modelAndView;
    }
}
