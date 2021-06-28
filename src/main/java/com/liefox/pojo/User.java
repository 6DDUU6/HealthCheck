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
    private int userid;//用户唯一id
    private int authority;//用户权限
    private int schoolid;//来自哪个学校
}
