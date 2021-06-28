package com.liefox.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignInfo {
    private int userid;//用户唯一id
    private int signid;//表单唯一id
    private int schoolid;//来自哪个学校
    private String username;//用户名
    private String temperature;//体温
    private String address;//地址
    private String date;//时间
    private String qr_code_color;//健康码颜色
    private String is_to_dongguan;//是否去过中高风险地区，之前写的是东莞，懒得改数据库了
}
