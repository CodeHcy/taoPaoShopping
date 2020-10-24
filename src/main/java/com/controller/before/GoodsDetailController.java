package com.controller.before;

import com.domain.Goods;
import com.service.before.BeforeGoodsServiceDao;
import com.service.before.Impl.BeforeGoodsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author hcy
 * @create 2020-10-13-17:38
 * @flag Keep on running
 */
@Controller
public class GoodsDetailController {
    @Autowired
    private BeforeGoodsServiceImpl beforeGoodsService;
    @RequestMapping("goodsDetail.do")
    public ModelAndView goodsDetail(Integer id){
        ModelAndView mv =new ModelAndView();
        Goods goods = beforeGoodsService.getAGoodsInfo(id);
        mv.addObject("Goods",goods);
        mv.setViewName("before/goodsdetail");
        return mv;
    }
    @RequestMapping("AgoodsDetail.do")
    @ResponseBody
    public Goods AgoodsDetail(Integer id){
        return beforeGoodsService.getAGoodsInfo(id);
    }
}
