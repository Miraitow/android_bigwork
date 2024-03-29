package com.meituan.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.meituan.model.DO.address.AddressDO;
import com.meituan.model.DO.food.FoodDO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AddressMapper extends BaseMapper<AddressDO> {

    /**
     * 根据用户id获取所有地址
     * @param userId
     * @return
     */
    default List<AddressDO> returnAllByUserId(Integer userId){

        // 构造查询条件
        LambdaQueryWrapper<AddressDO> wrapper = new LambdaQueryWrapper<>();

        wrapper.eq(userId != null,AddressDO::getUserId,userId);

        return selectList(wrapper);

    }
}
