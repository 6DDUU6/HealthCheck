package com.liefox.dao;

import com.liefox.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    //登录用户
    User logUser(User user);
    //注册用户
    int regUser(@Param("username")String username,@Param("password") String password);
    //修改用户信息
    int updateUserInfo(User user);
    //查看打卡记录
    List<User> queryDataByUsername(@Param("username") String username);
    //添加打卡记录
    int addData(User user);
    //查询全部用户打卡记录
    List<User> queryDataAll();

    User queryUserDataByTime(@Param("str") String str, @Param("username") String username);

}
