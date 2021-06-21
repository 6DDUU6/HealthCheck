package com.liefox.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private String username;//用户名
    private String password;//密码
    //signinfo 打卡记录
    private String temperature;//体温
    private String address;//地址
    private String date;//时间

    /**
     * 粤康码颜色
     */
    private String qrCodeColor;

    /**
     * 是否去过东莞
     */
    private String isToDongguan;
}
