package com.liefox.service;

import com.liefox.dao.UserDao;
import com.liefox.pojo.*;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
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
    public int regUser(String username, String password,int type, int schoolid) {
        return userDao.regUser(username, password,type,schoolid);
    }

    @Override
    public List<SignInfo> queryDataByUserId(int userid) {
        return userDao.queryDataByUserId(userid);
    }

    @Override
    public int addData(SignInfo info) {
        return userDao.addData(info);
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
    public List<Tip> queryTipsBySchool(int schoolid) {
        return userDao.queryTipsBySchool(schoolid);
    }

    @Override
    public List<Sign> querySignsBySchool(int schoolid) { return userDao.querySignsBySchool(schoolid); }

    @Override
    public List<SignInfo> querySignInfoBySignId(int[] signid) { return userDao.querySignInfoBySignId(signid); }

    @Override
    public int addSign(User user) { return userDao.addSign(user); }
    @Override
    public int addSignTip(int tipid,int signid) { return userDao.addSignTip(tipid, signid); }

    @Override
    public Sign queryLastSign() { return userDao.queryLastSign(); }


    @Override
    public List<DakaRecord> queryDakaRecord(User user) {
        List<Tip> tips = userDao.queryUserTip(user);
        List<DakaRecord> dakaRecords = new ArrayList<DakaRecord>();
        for(Tip tip:tips){
            DakaRecord dakaRecord = new DakaRecord();
            dakaRecord.setFromNick(tip.getFromnick());
            dakaRecord.setContent(tip.getContent());
            dakaRecord.setTipstype(tip.getTips_type());
            dakaRecord.setToUrl(tip.getTourl());
            dakaRecord.setDate(tip.getCreate_time());
            try{
                SignTip st = userDao.queryTip2Sign(tip.getId());
                SignInfo info = userDao.querySignInfo(st.getSignid(),user.getUserid());
                int count = info.getUserid();
                dakaRecord.setDaka(count > 0);
            }catch (Exception e){
                dakaRecord.setDaka(false);
            }
            dakaRecords.add(dakaRecord);
        }
        return dakaRecords;
    }

    @Override
    public boolean queryUserDataByTime(String str, String username) {
        return userDao.queryUserDataByTime(str, username) == null;
    }


}
