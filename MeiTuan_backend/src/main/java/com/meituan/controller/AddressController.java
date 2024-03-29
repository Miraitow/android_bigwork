package com.meituan.controller;

import com.meituan.model.DO.address.AddressDO;
import com.meituan.model.DO.food.FoodDO;
import com.meituan.model.VO.address.UserAddAddressReqVO;
import com.meituan.service.AddressService;
import com.meituan.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/address")
public class AddressController {


    @Autowired
    private AddressService addressService;


    @PostMapping("add")
    public String addAddress(@RequestBody UserAddAddressReqVO userAddAddressReqVO){
        return addressService.addAddress(userAddAddressReqVO);
    }

    @PostMapping("/getAll")
    public List<AddressDO> getAll(@RequestParam String phoneNumber){
        return addressService.getAll(phoneNumber);
    }

    @PostMapping("/setDefault")
    public String updateDefaultAddress(@RequestBody AddressDO addressDO){
        return addressService.updateDefaultAddress(addressDO);
    }

}
