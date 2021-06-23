package com.liefox.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.liefox.pojo.User;
import com.liefox.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
