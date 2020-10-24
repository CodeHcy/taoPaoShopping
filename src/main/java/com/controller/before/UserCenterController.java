package com.controller.before;

import com.domain.Goods;
import com.domain.Order;
import com.domain.Orderdetail;
import com.service.before.Impl.BeforeGoodsServiceImpl;
import com.service.before.Impl.UserCenterServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * @author hcy
 * @create 2020-10-13-19:58
 * @flag Keep on running
 */
@Controller
public class UserCenterController {
    @Autowired
    private UserCenterServiceImpl centerService;
    @Autowired
    private BeforeGoodsServiceImpl goodsService;
    @RequestMapping("userCenter.do")
    public ModelAndView GoUserCenter(HttpServletRequest request){
        String userEmail = (String) request.getSession().getAttribute("userEmail");
        ModelAndView mv = new ModelAndView();
        mv.addObject("userEmail",userEmail);
        mv.setViewName("before/userCenter");
        return mv;
    }
    @RequestMapping("loadOrder.do")
    @ResponseBody
    public List<Order> loadOrder(HttpServletRequest request){
        String userEmail = (String) request.getSession().getAttribute("userEmail");
//        按照用户邮箱查找用户id，根据用户id返回订单编号、订单金额、订单状态、下单时间
        Integer userid = centerService.getBuserId(userEmail);
        return centerService.getUserOrder(userid);
    }
    @RequestMapping("userOrder.do")
    @ResponseBody
    public ModelAndView loadOrderDetail(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        String id = request.getParameter("id");
        mv.addObject("id",id);
        mv.setViewName("before/userOrderDetail");
        return mv;
    }
    @RequestMapping("userOrderDetailList.do")
    @ResponseBody
    public List<Orderdetail> loadOrderDetailList(HttpServletRequest request){
        String id = request.getParameter("id");
        Integer idd = Integer.valueOf(id);
//        按照订单编号返回订单详情
        List<Orderdetail>  orderdetailList = centerService.getOrderDetailList(idd);

       return orderdetailList;
    }
    @RequestMapping("loadOrderInfo.do")
    @ResponseBody
    public Goods loadOrder(Integer id){
        return goodsService.getAGoodsInfo(id);
    }
    @RequestMapping("paydone.do")
    public ModelAndView GoPaydone(HttpServletRequest request){
        ModelAndView mv =new ModelAndView();
        String id = request.getParameter("id");
        Order order = centerService.getAOrder(id);
        mv.addObject("Order",order);
        mv.setViewName("before/paydone");
        return mv;
    }
    @RequestMapping("payOrder.do")
    @ResponseBody
    public HashMap<String,Integer> payOrder(Integer id){
        HashMap<String, Integer> map = new HashMap<>();
        List<Orderdetail> list=centerService.getAllOrderGoods(id);

        for (Orderdetail value : list) {

            Integer num = goodsService.getgstore(value.getGoodstable_id());
            if ((num - value.getShoppingnum()) < 0) {
                map.put("res", 0);
                return map;
            }
            Orderdetail orderdetail = new Orderdetail();
            orderdetail.setGoodstable_id(value.getGoodstable_id());
            orderdetail.setShoppingnum((num - value.getShoppingnum()));
            goodsService.updategstore(orderdetail);
        }
        centerService.updataOrder(id);
        map.put("res",1);
        return map;
    }
    @RequestMapping("backLogin.do")
    public String backLogin(HttpServletRequest request){
        request.getSession().removeAttribute("userEmail");
        request.getSession().removeAttribute("sts");
        return "before/login";
    }
}
