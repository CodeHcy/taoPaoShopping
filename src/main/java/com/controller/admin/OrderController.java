package com.controller.admin;

import com.domain.Order;
import com.domain.Orderdetail;
import com.github.pagehelper.PageHelper;
import com.service.admin.Impl.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-22:14
 * @flag Keep on running
 */
@Controller
public class OrderController {
    @Autowired
    private OrderServiceImpl orderService;
    @RequestMapping("/OrderCount.do")
    @ResponseBody
    public HashMap<String,Integer> OrderCount(){
        HashMap<String,Integer> map = new HashMap<>();
        map.put("count",orderService.getOrderCount());
       return map;
    }
    @RequestMapping("/queryOrderAll.do")
    @ResponseBody
    public List<Order> queryOrderAll(Integer pageNum, Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);

        return orderService.queryOrderAll();
    }
    @RequestMapping("/deleteOrder.do")
    @ResponseBody
    public HashMap<String,String> deleteOrder(Integer id){
        HashMap<String,String> map = new HashMap<>();
        int res = orderService.deleteOrder(id);
        if (res == 1){
            map.put("msg","删除成功！");
        }else {
            map.put("msg","删除失败！");
        }
        return map;
    }
    @RequestMapping("/OrderXq.do")
    @ResponseBody
    public Orderdetail OrderXQ(Integer id){
        return orderService.OrderXQ(id);
    }


}
