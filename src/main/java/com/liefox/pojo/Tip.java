package com.liefox.pojo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tip {
    private int id;
    private String content;//内容
    private String fromnick;//教师名 创建的此记录
    private String tourl;//跳转连接
    private int fromid;//教师id 创建的此记录
    private int active_range;//生效范围，0为全部学生可见，其它为具体的学校id
    private int tips_type;//提示类型，0为公告，1为打卡
    private String create_time;//创建时间
}
