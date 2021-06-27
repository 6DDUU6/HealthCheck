package com.liefox.service;

import com.liefox.pojo.*;

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
    int addData(SignInfo info);
    //查询全部用户打卡记录
    List<User> queryDataAll();
    //查询全部学校
    List<school> queryAllSchool();
    int addSchool(String schoolname);
    school querySchoolByName(String schoolname);
    int deleteSchool(int[] schoolid);

    List<DakaRecord> queryDakaRecord(User user);
    //查询全部tip
    List<Tip> queryAllTips();
    int updateTip(int id,String content);
    Tip queryLastTip();
    int addTip(String content,String fromnick,String tourl,int fromid,int active_range,int tips_type);
    int deleteTips(int[] tipsid);

    List<Tip> queryTipsBySchool(int schoolid);
    List<Sign> querySignsBySchool(int schoolid);
    List<SignInfo> querySignInfoBySignId(int[] signid);

    int addSign(User user);
    int addSignTip(int tipid,int signid);
    Sign queryLastSign();

    boolean queryUserDataByTime(String str,String username);
}
