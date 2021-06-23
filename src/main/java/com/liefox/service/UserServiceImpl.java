package com.liefox.service;

import com.liefox.dao.UserDao;
import com.liefox.pojo.Tip;
import com.liefox.pojo.User;
import com.liefox.pojo.school;
import java.util.List;


public class UserServiceImpl implements UserService {


    //业务层调用dao层
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public List<User> queryDataAll() {
        return userDao.queryDataAll();
    }

    @Override
    public User logUser(User user) {
        return userDao.logUser(user);
    }

    @Override
    public int updateUserInfo(User user) {
        return userDao.updateUserInfo(user);
    }

    @Override
    public int regUser(String username, String password) {
        return userDao.regUser(username, password);
    }

    @Override
    public List<User> queryDataByUsername(String username) {
        return userDao.queryDataByUsername(username);
    }

    @Override
    public int addData(User user) {
        return userDao.addData(user);
    }

    @Override
    public List<school> queryAllSchool() {
        return userDao.queryAllSchool();
    }
    @Override
    public int addSchool(String schoolname){
        return userDao.addSchool(schoolname);
    }
    @Override
    public school querySchoolByName(String schoolname){
        return userDao.querySchoolByName(schoolname);
    }
    @Override
    public int deleteSchool(int[] schoolid){
        return userDao.deleteSchool(schoolid);
    }

    @Override
    public List<Tip> queryAllTips() {
        return userDao.queryAllTips();
    }

    @Override
    public int updateTip(int id, String content) { return userDao.updateTip(id, content); }

    @Override
    public Tip queryLastTip() {
        return userDao.queryLastTip();
    }
    @Override
    public int addTip(String content,String fromnick,String tourl,int fromid,int active_range,int tips_type){
        return userDao.addTip(content,fromnick,tourl,fromid,active_range,tips_type);
    }
    @Override
    public int deleteTips(int[] tipsid){
        return userDao.deleteTips(tipsid);
    }

    @Override
    public boolean queryUserDataByTime(String str, String username) {
        return userDao.queryUserDataByTime(str, username) == null;
    }
}
