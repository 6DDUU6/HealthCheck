package com.liefox.controller;

import com.liefox.pojo.SignInfo;
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
public class SignController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    /**
     *      打卡控制层
     * */
    @RequestMapping("/SignIn/{signid}")
    public String SignIn(HttpSession session, @PathVariable int signid, SignInfo info, HttpServletRequest request) {
        User user = (User) session.getAttribute("user1");//从session中获取user
        info.setUserid(user.getUserid());
        info.setUsername(user.getUsername());
        info.setSignid(signid);
        int i = userService.addData(info);
        if (i != 0) {
            request.setAttribute("list", userService.queryDakaRecord(user));
            return "main";
        }
        return null;
    }
}
