package com.liefox.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.liefox.pojo.*;
import com.liefox.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.IOException;
import java.util.List;

/**
 * @Author zjh
 * @Date 2021/4/10 上午 1:15
 **/
@RestController
public class adminController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    /**
     * 描述：查看全部用户打卡记录
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping("/queryAllSchool")
    public String queryAllSchool() throws JsonProcessingException {
        //jackson 对象
        ObjectMapper mapper = new ObjectMapper();
        List<school> list = userService.queryAllSchool();
        //把对象需要转换成json
        String s = mapper.writeValueAsString(list);
        return s;
    }
    /**
     * 描述：添加一个学校
     */
    @RequestMapping("/addSchool")
    public String addSchool(String schoolname) throws Exception{
        String s;
        try{
            userService.addSchool(schoolname);
            school sc = userService.querySchoolByName(schoolname);
            ObjectMapper mapper = new ObjectMapper();
            s = mapper.writeValueAsString(sc);
            //System.out.println(s);
            return s;
        }catch (Exception e){
            s = "{\"schoolid\":-1,\"schoolname\":\"\"}";
            return s;
        }
    }
    /**
     * 描述：删除选中学校
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteSchool")
    public void deleteSchool(String data) throws IOException {
        //System.out.println(data);
        ObjectMapper mapper = new ObjectMapper();
        school[] sc = mapper.readValue(data, school[].class);
        int[] schoolid = new int[sc.length];
        for(int i=0; i<sc.length; i++){
            schoolid[i] = sc[i].getSchoolid();
        }
        //System.out.println(schoolid.length);
        userService.deleteSchool(schoolid);
    }
    /**
     * 描述：查看全部tip记录
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping("/queryAllTips")
    public String queryAllTips(HttpSession session) throws JsonProcessingException {
        //jackson 对象
        User user = (User) session.getAttribute("user1");//从session中获取user
        List<Tip> list;
        if(user.getAuthority() == 0){
            list = userService.queryAllTips();
        }else{
            list = userService.queryTipsBySchool(user.getSchoolid());
        }
        ObjectMapper mapper = new ObjectMapper();
        //把对象需要转换成json
        String s = mapper.writeValueAsString(list);
        return s;
    }
    /**
     * 描述：删除选中tip
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteTips")
    public void deleteTips(String data) throws IOException {
        //System.out.println(data);
        ObjectMapper mapper = new ObjectMapper();
        Tip[] tp = mapper.readValue(data, Tip[].class);
        int[] tipsid = new int[tp.length];
        for(int i=0; i<tp.length; i++){
            tipsid[i] = tp[i].getId();
        }
        userService.deleteTips(tipsid);
    }
    /**
     * 描述：删除一个tip
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteTip")
    public void deleteTip(String data) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        Tip tp = mapper.readValue(data, Tip.class);
        int[] tipsid = {tp.getId()};
        userService.deleteTips(tipsid);
    }
    /**
     * 描述：添加一个空tip
     */
    @RequestMapping("/addTip")
    public String addTip(HttpSession session) throws Exception{
        User user = (User) session.getAttribute("user1");//从session中获取user
        userService.addTip("空",user.getUsername(),"#",user.getUserid(),user.getSchoolid(),user.getAuthority());
        Tip tp = userService.queryLastTip();
        ObjectMapper mapper = new ObjectMapper();
        String s;
        s = mapper.writeValueAsString(tp);
        return s;
    }
    /**
     * 描述：更新一个tip
     */
    @RequestMapping("/updateTip")
    public void updateTip(String data) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        Tip tp = mapper.readValue(data, Tip.class);
        userService.updateTip(tp.getId(), tp.getContent());
    }
}
