package com.meituan.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.meituan.model.DO.category.CategoryDO;
import com.meituan.model.DO.food.FoodDO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CategoryMapper extends BaseMapper<CategoryDO> {

    /**
     * 根据店铺id获取所有分类
     * @param storeId
     * @return
     */
    default List<CategoryDO> getAllByStoreId(String storeId){

        // 构造条件
        LambdaQueryWrapper<CategoryDO> wrapper = new LambdaQueryWrapper<>();

        wrapper.eq(!"".equals(storeId),CategoryDO::getStoreId,storeId);

        return selectList(wrapper);
    }
}
