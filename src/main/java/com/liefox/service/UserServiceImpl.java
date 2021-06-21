package com.liefox.service;

import com.liefox.dao.UserDao;
import com.liefox.pojo.User;

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
    public boolean queryUserDataByTime(String str, String username) {
        return userDao.queryUserDataByTime(str, username) == null;
    }
}
