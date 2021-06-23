package com.liefox.pojo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tip {
    private int id;
    private String content;
    private String fromnick;
    private String tourl;
    private int fromid;
    private int active_range;
    private int tips_type;
    private String create_time;
}
