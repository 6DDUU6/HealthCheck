package com.liefox.controller;

import com.liefox.pojo.User;
import com.liefox.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @Author zjh
 * @Date 2021/4/10 上午 1:15
 **/
@Controller
public class SignController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    /**
     *      打卡控制层
     * */
    @RequestMapping("/SignIn")
    public String SignIn(User user) {
        int i = userService.addData(user);
        if (i != 0) {
            return "main";
        }
        return null;

    }
}
