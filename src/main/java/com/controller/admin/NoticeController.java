package com.controller.admin;

import com.domain.Notice;
import com.github.pagehelper.PageHelper;
import com.service.admin.Impl.NoticeSericeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-23:18
 * @flag Keep on running
 */
@Controller
public class NoticeController {
    @Autowired
    private NoticeSericeImpl noticeService;
    @RequestMapping("/queryNoticeAll.do")
    @ResponseBody
    public List<Notice> queryNoticeAll(Integer pageNum, Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        return noticeService.queryNoticeAll();
    }
    @RequestMapping("/NoticeCount.do")
    @ResponseBody
    public HashMap<String,Integer> OrderCount(){
        HashMap<String,Integer> map = new HashMap<>();
        map.put("count",noticeService.getNoticeCount());
        return map;
    }
    @RequestMapping("/deleteNotice.do")
    @ResponseBody
    public HashMap<String,String> deleteOrder(Integer id){
        HashMap<String,String> map = new HashMap<>();
        int res = noticeService.deleteNotice(id);
        if (res == 1){
            map.put("msg","删除成功！");
        }else {
            map.put("msg","删除失败！");
        }
        return map;
    }
    @RequestMapping(value = "addNotice.do")
    //重点 接受用@RequestBody
    @ResponseBody
    public HashMap<String,String> addGoodsInfo(@RequestBody Notice notice){
        HashMap<String,String> map = new HashMap<>();
        if (notice.getNtitle().equals("")||notice.getNcontent().equals("")){
            map.put("msg","不能为空");
            return map;
        }
        int res = noticeService.addNotice(notice);
        if (res == 1){
            map.put("msg","添加成功！");
        }
        return map;
    }
    @RequestMapping("/GoaddNotice.do")
    public String GoaddNotice(){
        return "admin/addNotice";
    }

}
