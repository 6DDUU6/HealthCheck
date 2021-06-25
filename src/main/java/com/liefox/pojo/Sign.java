package com.liefox.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Sign {
    private int id;//唯一标识
    private int fromid;//哪一个用户创建的
    private int schoolid;//哪个学校的
    private String data;//暂时没用
}
