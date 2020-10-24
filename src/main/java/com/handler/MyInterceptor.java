package com.handler;



import com.service.admin.Impl.AdminTestImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author hcy
 * @create 2020-09-28-19:58
 * @flag Keep on running
 */
@Controller
public class MyInterceptor implements HandlerInterceptor {
    @Autowired
    private AdminTestImpl adminTest;
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String username ="";
        if ((request.getSession().getAttribute("username"))!=null){
            username = (String) request.getSession().getAttribute("username");
        }
        if (adminTest.doTest(username)){
            return true;
        }
        request.getRequestDispatcher("/tips.jsp").forward(request,response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
