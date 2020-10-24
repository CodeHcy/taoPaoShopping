package com.controller.admin;

import com.domain.GoodsType;
import com.github.pagehelper.PageHelper;
import com.service.admin.Impl.GoodsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-11:21
 * @flag Keep on running
 */
@Controller
public class GoodsTypeController {
    @Autowired
    private GoodsServiceImpl goodsService;
    @RequestMapping("/goodsTypeInfo.do")
    @ResponseBody
    public List<GoodsType> queryType(Integer pageNum,Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
       return goodsService.queryType();
    }
    @RequestMapping("/goodsTypeCount.do")
    @ResponseBody
    public HashMap<String,Integer> typeCount(){
        HashMap<String,Integer> map = new HashMap<>();
        int count = goodsService.typeCount();
        map.put("count",count);
        return map;
    }
    @RequestMapping("deleteType.do")
    @ResponseBody
    public HashMap<String,String> deleteType(Integer id){
        HashMap<String,String> map = new HashMap<>();
        int count = goodsService.deleteType(id);
        if (count ==1){
            map.put("msg","删除成功！");
        }else {
            map.put("msg","删除失败！");
        }
        return map;
    }
    @RequestMapping("/addType.do")
    @ResponseBody
    public HashMap<String,String> addType(@RequestBody GoodsType goodsType){
        HashMap<String,String> map = new HashMap<>();
        int count = 0;
        if (!(goodsType.getTypename().equals("")||goodsType.getTypename()==null)){
            count = goodsService.addType(goodsType);
        }

        if (count ==1){
            map.put("msg","添加成功！");
        }else {
            map.put("msg","添加失败！");
        }
        return map;
    }
    @RequestMapping("/GoaddType.do")
    public String GoType(){
        return "admin/addType";
    }


}
