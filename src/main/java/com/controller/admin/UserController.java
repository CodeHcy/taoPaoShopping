package com.controller.admin;

import com.domain.Buser;
import com.domain.GoodsType;
import com.github.pagehelper.PageHelper;
import com.service.admin.Impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-15:36
 * @flag Keep on running
 */
@Controller
public class UserController {
    @Autowired
    private UserServiceImpl userService;
    @RequestMapping("queryUserAll.do")
    @ResponseBody
    public List<Buser> queryUser(Integer pageNum,Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        return userService.queryUserAll();
    }
    @RequestMapping("/UserCount.do")
    @ResponseBody
    public HashMap<String,Integer> typeCount(){
        HashMap<String,Integer> map = new HashMap<>();
        int count = userService.UserCount();
        map.put("count",count);
        return map;
    }
    @RequestMapping("/deleteUser.do")
    @ResponseBody
    public HashMap<String,String> deleteUser(Integer id){
        HashMap<String,String> map = new HashMap<>();
        int res = userService.deleteUser(id);
        if (res == 1){
            map.put("msg","删除成功");
        }else {
            map.put("msg","删除失败");
        }

        return map;
    }

}
