package com.liefox.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DakaRecord {
    private String fromNick;
    private String content;
    private boolean daka;//是否为打卡类型
    private String date;//时间
    private int tipstype;//提示类型，0为公告，1为打卡
    private String toUrl;//跳转链接
}
