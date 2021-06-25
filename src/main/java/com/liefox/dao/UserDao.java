package com.liefox.dao;

import com.liefox.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    //登录用户
    User logUser(User user);
    //注册用户
    int regUser(@Param("username") String username,@Param("password") String password);
    //修改用户信息
    int updateUserInfo(User user);
    //查看打卡记录
    List<User> queryDataByUsername(@Param("username") String username);
    //添加打卡记录
    int addData(User user);
    //查询全部用户打卡记录
    List<User> queryDataAll();
    //学校
    List<school> queryAllSchool();
    int addSchool(@Param("schoolname") String schoolname);
    school querySchoolByName(@Param("schoolname") String schoolname);
    int deleteSchool(int[] schoolid);
    //查询全部tip
    List<Tip> queryAllTips();
    int addTip(@Param("content")String content,@Param("fromnick")String fromnick,@Param("tourl")String tourl,@Param("fromid")int fromid,@Param("active_range")int active_range,@Param("tips_type")int tips_type);
    int updateTip(@Param("id")int id,@Param("content")String content);
    Tip queryLastTip();
    int deleteTips(int[] tipsid);

    List<Tip> queryTipsBySchool(int schoolid);
    List<Sign> querySignsBySchool(int schoolid);
    List<SignInfo> querySignInfoBySignId(int[] signid);
    int addSign(User user);
    Sign queryLastSign();

    User queryUserDataByTime(@Param("str") String str, @Param("username") String username);

}
