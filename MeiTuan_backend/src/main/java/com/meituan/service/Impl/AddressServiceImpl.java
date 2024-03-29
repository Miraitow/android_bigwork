package com.meituan.service.Impl;


import com.meituan.mapper.AddressMapper;
import com.meituan.mapper.FoodMapper;
import com.meituan.mapper.UserMapper;
import com.meituan.model.DO.address.AddressDO;
import com.meituan.model.DO.food.FoodDO;
import com.meituan.model.DO.user.UserDO;
import com.meituan.model.VO.address.UserAddAddressReqVO;
import com.meituan.service.AddressService;
import com.meituan.service.FoodService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;


import java.time.LocalDateTime;

import java.util.Date;
import java.util.List;

@Service
@Slf4j
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressMapper addressMapper;

    @Autowired
    private UserMapper userMapper;

    /**
     * 新增地址
     *
     * @param userAddAddressReqVO
     * @return
     */
    @Override
    public String addAddress(UserAddAddressReqVO userAddAddressReqVO) {

        UserDO userDO = userMapper.queryByPhoneNumber(userAddAddressReqVO.getLoginPhoneNumber());

        // VO转DO
        AddressDO addressDO = AddressDO.builder()
                .sex(userAddAddressReqVO.getSex())
                .label(userAddAddressReqVO.getLabel())
                .detail(userAddAddressReqVO.getDetail())
                .phoneNumber(userAddAddressReqVO.getPhoneNumber())
                .consignee(userAddAddressReqVO.getConsignee())
                .createTime(new Date())
                .isDefault("0")
                .userId(userDO.getId()).build();

        int insert = addressMapper.insert(addressDO);

        return insert == 1 ? "success" : "error";
    }

    /**
     * 查此用户所有地址
     *
     * @return
     */
    @Override
    public List<AddressDO> getAll(String phoneNumber) {

        UserDO userDO = userMapper.queryByPhoneNumber(phoneNumber);
        System.out.println("userDO"+userDO);
        if (userDO != null){
            return addressMapper.returnAllByUserId(userDO.getId());
        }
        return null;
    }

    /**
     * 修改默认地址
     */
    @Override
    public String updateDefaultAddress(AddressDO addressDO) {
        if (addressDO != null){
            // 与此用户有关联的所有地址
            List<AddressDO> addressDOS = addressMapper.returnAllByUserId(addressDO.getUserId());
            for (AddressDO address : addressDOS) {
                address.setIsDefault("0");
                if (addressDO.getId() == address.getId()){
                    address.setIsDefault("1");
                }
            }
            // 更新
            for (AddressDO address : addressDOS) {
                addressMapper.updateById(address);
            }
            return "success";
        }
        return "error";
    }
}
