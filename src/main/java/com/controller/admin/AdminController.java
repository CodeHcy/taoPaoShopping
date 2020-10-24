package com.controller.admin;

import com.domain.Auser;
import com.exception.NameException;
import com.service.admin.Impl.AdminTestImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;

/**
 * @author hcy
 * @create 2020-09-30-13:50
 * @flag Keep on running
 */
@Controller
public class AdminController {
    @Autowired
    private AdminTestImpl adminTestService;
    @RequestMapping("/admin")
    public String GoLogin(){
        return "/admin/Login";
    }
    @RequestMapping("/main.do")
    public String Gomain(){
        return "admin/main";
    }
    @RequestMapping("/admin/test.do")
    public ModelAndView TestAdmin(String aname,String apwd) throws NameException {
        ModelAndView mv = new ModelAndView();

        boolean flag = adminTestService.doTest(aname,apwd);
        if(flag){
           mv.setViewName("admin/main");
        }else {
           mv.setViewName("admin/Login");
           mv.addObject("msg","用户名或密码不对！");
        }
        return mv;
    }
    @RequestMapping("/exit.do")
    public String exit(HttpServletRequest request){
        request.getSession().setAttribute("user","");
        return "admin/Login";
    }


}
