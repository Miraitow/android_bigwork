package com.meituan.controller;

import com.meituan.model.DO.order.OrderDO;
import com.meituan.model.DO.store.StoreDO;
import com.meituan.service.OrderService;
import com.meituan.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    /**
     * 获取全部订单
     * @param phoneNumber
     * @return
     */
    @PostMapping("/getAllOrders")
    public List<List<OrderDO>> getAllOrders(@RequestParam String phoneNumber){
        return orderService.getAllOrders(phoneNumber);
    }
}
