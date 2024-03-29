package com.meituan.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.meituan.model.DO.user.UserDO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper extends BaseMapper<UserDO> {

    default UserDO queryByPhoneNumber(String phoneNumber){
        // 构造查询条件
        LambdaQueryWrapper<UserDO> wrapper = new LambdaQueryWrapper<>();
        // 根据手机号码查询
        wrapper.eq(UserDO::getPhoneNumber,phoneNumber);
        UserDO u = selectOne(wrapper);
        return u;
    }
}
