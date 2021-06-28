package com.liefox.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignTip {
    private int tipid;//将tipid与signid关联起来的一张表
    private int signid;
}
