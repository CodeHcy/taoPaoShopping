package com.controller.admin;

import com.domain.Goods;
import com.github.pagehelper.PageHelper;
import com.service.admin.Impl.GoodsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author hcy
 * @create 2020-09-30-16:08
 * @flag Keep on running
 */
@Controller

public class GoodsController {
    @Autowired
    private GoodsServiceImpl goodsService;
    //获取全部商品
    @RequestMapping("/loadType.do")
    @ResponseBody
    public List<Goods> loadType(){

        return goodsService.loadType();
    }
    //获取商品类型
    @RequestMapping("/goodsInfo.do")
    @ResponseBody
    public List<Goods> qureyGoods(Integer pageNum,Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        return goodsService.doQureyGoods();
    }
    //获取商品图片
    @RequestMapping("/getImg.do")
    @ResponseBody
    public HashMap<String,String> getImg(Integer id){
        HashMap<String,String> map = new HashMap<>();
        map.put("imPath",goodsService.getImPath(id));
        return map;
    }
    //查询一个商品
    @RequestMapping("/goodsInfoA.do")
    @ResponseBody
    public Goods goodsInfoA(Integer id){
        return goodsService.selectAGoods(id);
    }
    //去商品列表页面
    @RequestMapping("/getGoodsDetail")
    public String getGoodsDetail(){
        return "admin/GoodsDetail";
    }
    //去添加商品的页面
    @RequestMapping("addGoods.do")
    public ModelAndView addGoods(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/addGoods");
        return mv;
    }
//    获取商品数量
    @RequestMapping("/goodsCount.do")
    @ResponseBody
    public HashMap<String,Integer> getGoodsCount(){
        HashMap<String,Integer> map = new HashMap<>();
        map.put("count",goodsService.getCount());
        return map;
    }
//    添加商品
    @RequestMapping(value = "addGoodsInfo.do")
    //重点 接受用@RequestBody
    @ResponseBody
    public HashMap<String,String> addGoodsInfo(@RequestBody Goods goods){
        HashMap<String,String> map = new HashMap<>();
        int res = goodsService.addGoods(goods);
        if (res == 1){ map.put("res","1");map.put("msg","添加成功！");
        }else { map.put("res","0");map.put("msg","添加失败！"); }
        return map;
    }
//    修改商品
    @RequestMapping(value = "updateGoods.do")
    //重点 接受用@RequestBody
    @ResponseBody
    public HashMap<String,String> updateGoods(@RequestBody Goods goods){
        HashMap<String,String> map = new HashMap<>();
        if (goods.getGname().equals("") ||goods.getGstore()==0||
                goods.getGrprice()==0||goods.getGoprice()==0||
                goods.getGoodstype_id()==0){
            map.put("res","2");
            map.put("msg","不能为空");
            return map;
        }
        int res = goodsService.updateGoods(goods);
        if (res == 1){
            map.put("msg","变更成功！");
        }else {
            map.put("msg","变更失败！");
        }
        return map;
    }
//    去变更商品的页面
    @RequestMapping("GoChangeGoods.do")
    public String goChangeGoods(){
        return "admin/changeGoods";
    }
//    删除一个商品
    @RequestMapping("deleteGoods.do")
    @ResponseBody
    public HashMap<String,String> changeGoods(Integer id){
        HashMap<String,String> map  =new HashMap<>();
        int res = goodsService.delectGood(id);
        if (res==1){
            map.put("msg","删除成功！");
        }else {
            map.put("msg","删除失败！");
        }
        return map;
    }

}
