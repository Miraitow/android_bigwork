package com.meituan.model.DO.user;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@TableName("user_code")
public class UserCodeDO implements Serializable {

    @TableId(type = IdType.AUTO)//指明表的id
    private Integer id;

    @TableField("phone_number")
    private String phoneNumber;

    private String code;
}
