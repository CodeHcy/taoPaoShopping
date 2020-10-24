package com.controller.admin;

import com.exception.BNameException;
import com.exception.MyException;
import com.exception.NameException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author hcy
 * @create 2020-10-04-14:32
 * @flag Keep on running
 */
@ControllerAdvice
public class ExceptionController {
    @ExceptionHandler(value = NameException.class)
    public ModelAndView someException(NameException e){
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg","用户名不能为空！");
        mv.setViewName("admin/error");
        return mv;
    }
    @ExceptionHandler(value = BNameException.class)
    public ModelAndView someException(BNameException e){
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg","用户名不能为空！");
        mv.setViewName("admin/error");
        return mv;
    }
}
