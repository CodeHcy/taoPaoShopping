package com.controller.before;

import com.domain.Cart;
import com.domain.Goods;
import com.domain.Order;
import com.domain.Orderdetail;
import com.service.before.Impl.BeforeGoodsServiceImpl;
import com.service.before.Impl.UserCenterServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author hcy
 * @create 2020-10-14-17:00
 * @flag Keep on running
 */
@Controller
public class BuyCartController {
    @Autowired
    private UserCenterServiceImpl centerService;
    @Autowired
    private BeforeGoodsServiceImpl goodsService;

    @RequestMapping("AddCart.do")
    public ModelAndView AddCart(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("before/cart");
        return mv;
    }
    @RequestMapping("GoCart.do")
    public String GoCart(){
        return "before/cart";
    }
    @RequestMapping("loadCart.do")
    @ResponseBody
    public List<Cart> LoadCart(HttpSession session){
        String userEmail = (String) session.getAttribute("userEmail");
        return centerService.qureyCart(centerService.getBuserId(userEmail));
    }
    @RequestMapping("AddGoodsIntoCart.do")
    @ResponseBody
    public HashMap<String,String> AddGoodsIntoCart(Integer id,HttpSession session){
        HashMap<String,String> map = new HashMap<>();
        String userEmail = (String) session.getAttribute("userEmail");
        if (userEmail==null){
            map.put("res","未登录");
            map.put("tips","还未登录！请登录。");
            return map;
        }
        Integer userid = centerService.getBuserId(userEmail);
        Cart cart = new Cart(id,userid,1);
        centerService.AddAgoodsCart(cart);
        map.put("res","已登录");
        map.put("tips","已加入购物车。");
        return map;

    }
    @RequestMapping("deleteACart.do")
    @ResponseBody
    public int deleteACart(Integer id){

         int res = centerService.deleteACart(id);
        return res;
    }
    @RequestMapping("changeCartNum.do")
    @ResponseBody
    public void changeCartNum(Integer cartId,Integer sopnum){
        Cart cart = new Cart();
        cart.setId(cartId);
        cart.setShoppingnum(sopnum);
        goodsService.updateCart(cart);

    }

    @RequestMapping("ByCartAddOrder.do")
    @ResponseBody
    public HashMap<String,Integer> ByCartAddOrder(Integer[] IdCartArray, Double amount, String Date, HttpServletRequest request){
        HashMap<String,Integer> map = new HashMap<>();
        String userEmail = (String) request.getSession().getAttribute("userEmail");
        Integer userid = centerService.getBuserId(userEmail);
        Order order = new Order(userid,amount,0,Date);
//        把订单添加进数据库
        goodsService.addOrder(order);
        Integer orderId = order.getId();

//        问题：传过来的参数有问题

//      把详情添加到数据库
        for(int i=0;i<IdCartArray.length;i++){
            Integer cartId = IdCartArray[i];
            Cart cart = goodsService.getCart(cartId);
            Orderdetail orderdetail = new Orderdetail(orderId,cart.getGoodstable_id(),cart.getShoppingnum());
            goodsService.addOrderDetail(orderdetail);
        }
        map.put("orderId",orderId);
        return map;
    }


}
