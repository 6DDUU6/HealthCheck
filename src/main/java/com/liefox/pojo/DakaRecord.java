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
    private boolean daka;
    private String date;//时间
    private int tipstype;
    private String toUrl;
}
