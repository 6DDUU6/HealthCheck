package com.liefox.dao;

import com.liefox.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    //登录用户
    User logUser(User user);
    //注册用户
    int regUser(@Param("username") String username,@Param("password") String password,@Param("type") int type,@Param("schoolid") int schoolid);
    //修改用户信息
    int updateUserInfo(User user);
    //查看打卡记录
    List<SignInfo> queryDataByUserId(@Param("userid") int userid);
    //添加打卡记录
    int addData(SignInfo info);
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
    int addSignTip(@Param("tipid") int tipid,@Param("signid") int signid);
    Sign queryLastSign();

    SignTip queryTip2Sign(int tipid);
    SignInfo querySignInfo(@Param("signid") int signid,@Param("userid") int userid);
    List<Tip> queryUserTip(User user);

    User queryUserDataByTime(@Param("str") String str, @Param("username") String username);

}
