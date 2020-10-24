package com.service.admin.Impl;

import com.dao.auserTable;
import com.domain.Auser;
import com.service.admin.AdminTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author hcy
 * @create 2020-09-30-13:55
 * @flag Keep on running
 */
@Service
public class AdminTestImpl implements AdminTest {


    @Autowired
    private auserTable auserTable;

    public boolean doTest(String username) {
        List<Auser> auser = auserTable.selectAuserName();
        boolean flag =false;
        for (Auser auser1 : auser) {
            if (auser1.getAname().equals(username)){
                flag = true;
            }
        }
        return flag;
    }
    public boolean doTest(String name,String pwd) {
        List<Auser> auser = auserTable.selectAuser();
        boolean flag =false;
        for (Auser auser1 : auser) {
            if (auser1.getAname().equals(name)&&
            auser1.getApwd().equals(pwd)){
                flag = true;
            }
        }
        return flag;
    }


}
