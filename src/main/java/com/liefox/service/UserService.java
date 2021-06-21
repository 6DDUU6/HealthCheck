package com.liefox.service;

import com.liefox.pojo.User;

import java.util.List;

public interface UserService {
    //登录用户
    User logUser(User user);
    //注册用户
    int regUser(String username,String password);
    //修改用户信息
    int updateUserInfo(User user);
    //查看打卡记录
    List<User> queryDataByUsername(String username);
    //添加打卡记录
    int addData(User user);
    //查询全部用户打卡记录
    List<User> queryDataAll();

    boolean queryUserDataByTime(String str,String username);
}
