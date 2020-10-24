package com.controller.before;

import com.domain.Buser;
import com.domain.Goods;
import com.domain.GoodsType;
import com.domain.Notice;
import com.exception.BNameException;
import com.exception.NameException;
import com.github.pagehelper.PageHelper;
import com.service.before.Impl.BeforeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/**
 * @author hcy
 * @create 2020-10-05-18:20
 * @flag Keep on running
 */
@Controller
public class IndexController {
    @Autowired
    private BeforeServiceImpl beforeService;
    @RequestMapping("/before")
    public String index(){
        return "before/index";
    }
    @RequestMapping("/index/login")
    public String login(){
        return "before/login";
    }
    @RequestMapping("/index/textLg.do")
    @ResponseBody
    public HashMap<String,String> Tlogin(HttpSession session){
        HashMap<String,String> map = new HashMap<>();
        map.put("userEmail", (String) session.getAttribute("userEmail"));
        return map;
    }
    @RequestMapping("/index/loginTest.do")
    public ModelAndView TestUser(String bemail, String bpwd,HttpSession session) throws BNameException {
        if (bemail == null||bpwd == null){
            throw new BNameException("用户名或密码不能为空！");
        }
        ModelAndView mv =new ModelAndView();
        if (beforeService.testBuser(bemail,bpwd)){
            mv.setViewName("before/index");
            session.setAttribute("userEmail",bemail);
            session.setAttribute("sts","登录过了");
        }else {
            mv.setViewName("before/login");
            mv.addObject("msg","用户名或密码错误！");
        }
        return mv;
    }
    @RequestMapping("/index/register.do")
    public ModelAndView registerUser(String bemail, String bpwd,HttpSession session) throws BNameException {

        ModelAndView mv =new ModelAndView();
        Buser buser = new Buser();
        buser.setBemail(bemail);
        buser.setBpwd(bpwd);
        int res = beforeService.registerBuser(buser);
        if (res == 1){
            session.setAttribute("userEmail",bemail);
            session.setAttribute("sts","登录过了");
            mv.setViewName("before/index");
        }else {
            mv.setViewName("before/login");
            mv.addObject("msg","注册失败！");
        }
        return mv;
    }
    @RequestMapping("/index/showGoods.do")
    @ResponseBody
    public List<Goods> showGoods( Integer goodstype_id, Integer pageNum, Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        return beforeService.showGoods(goodstype_id);
    }

    @RequestMapping("/index/getCount.do")
    @ResponseBody
    public Integer getCount(Integer goodstype_id){

        return beforeService.getCount(goodstype_id);
    }

    @RequestMapping("/index/getType.do")
    @ResponseBody
    public List<GoodsType> getType(){
        PageHelper.startPage(1,10);
        return beforeService.getType();
    }

    @RequestMapping("/index/changeType.do")
    @ResponseBody
    public Integer changeType(String typename){

        return beforeService.changeType(typename);
    }
    @RequestMapping("/index/getNotices.do")
    @ResponseBody
    public List<Notice> getNotices(){
        PageHelper.startPage(1,10);
        return beforeService.getNotices();
    }
    @RequestMapping("/index/showNotice.do")
    public ModelAndView showNotice(HttpServletRequest request) {
        String title = request.getParameter("title");
        ModelAndView mv = new ModelAndView();
        Notice notice = beforeService.getANotice(title);
        if (notice!=null){
            mv.addObject("ntitle",title);
            mv.addObject("ncontent",notice.getNcontent());
            mv.addObject("ntime",notice.getNtime());

        }
        mv.setViewName("before/showNotice");
        return mv;
    }
}
