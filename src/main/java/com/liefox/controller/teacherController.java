package com.liefox.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.liefox.pojo.Sign;
import com.liefox.pojo.SignInfo;
import com.liefox.pojo.Tip;
import com.liefox.pojo.User;
import com.liefox.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author zjh
 * @Date 2021/4/10 上午 1:15
 **/
@RestController
public class teacherController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    /**
     * 描述：查看全部用户打卡记录
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping("/queryDataAll")
    public String queryDataAll() throws JsonProcessingException {
        //jackson 对象
        ObjectMapper mapper = new ObjectMapper();
        List<User> list = userService.queryDataAll();
        //把对象需要转换成json
        String s = mapper.writeValueAsString(list);
        return s;
    }
    /**
     * 描述：查询学校下的所有signInfo
     */
    @RequestMapping("/querySignInfo")
    public String querySignInfo(HttpSession session) throws Exception{
        User user = (User) session.getAttribute("user1");//从session中获取user
        List<Sign> sign = userService.querySignsBySchool(user.getSchoolid());
        int[] signid = new int[sign.size()];
        for(int i=0; i<sign.size(); i++){
            signid[i] = sign.get(i).getId();
        }
        List<SignInfo> signInfos = userService.querySignInfoBySignId(signid);
        ObjectMapper mapper = new ObjectMapper();
        String s;
        s = mapper.writeValueAsString(signInfos);
        return s;
    }

    /**
     * 描述：教师添加一个sign和tip
     */
    @RequestMapping("/addSignTip")
    public String addSignTip(HttpSession session) throws Exception{
        User user = (User) session.getAttribute("user1");//从session中获取user
        userService.addSign(user);
        Sign sign = userService.queryLastSign();
        int id = sign.getId();
        String url = "/jumpSign/" + id;
        userService.addTip("空",user.getUsername(),url,user.getUserid(),user.getSchoolid(),user.getAuthority());
        Tip tp = userService.queryLastTip();
        userService.addSignTip(tp.getId(), sign.getId());
        ObjectMapper mapper = new ObjectMapper();
        String s;
        s = mapper.writeValueAsString(tp);
        return s;
    }
}
