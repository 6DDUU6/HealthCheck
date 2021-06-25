package com.liefox.controller;

import com.liefox.pojo.User;
import com.liefox.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author zjh
 * @Date 2021/4/10 上午 1:15
 **/
@Controller
public class LoginController {

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    //登录提交
    @RequestMapping("/LoginUser")
    public String loginUser(HttpSession session, User user, HttpServletRequest request) {
        /**
         * 调用service层的登录方法
         */
        User user1 = userService.logUser(user);

//        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//        String format1 = format.format(new Date());
        //这里会抛出异常
        try {
            //管理员身份判断，进行跳转至管理员页
            if (user1.getAuthority() == 0) {
                session.setAttribute("user1", user1);
                return "admin";
            }else if(user1.getAuthority() == 1){
                session.setAttribute("user1", user1);
                return "teacher";
            }else{
                //这里耍了一个小聪明，给session设置了一个时间的值，用于前端表单隐藏域中获取时间数据,签到用的
                //为什么不在数据库里直接弄默认时间
//                session.setAttribute("format1", format1);
                //存放用户session，方便前端读取
                session.setAttribute("user1", user1);
                return "main";
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
            session.setAttribute("info", "用户名或密码错误!");
        }
        return "redirect:/login.jsp";
    }

    //退出
    @GetMapping("/Logout")
    public String Login(HttpSession session) {
        //移除掉浏览器的session
        session.removeAttribute("user1");
        session.removeAttribute("format1");
        session.removeAttribute("info");
        return "redirect:/login.jsp";
    }
}
