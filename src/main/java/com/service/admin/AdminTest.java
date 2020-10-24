package com.service.admin;

import com.domain.Auser;

/**
 * @author hcy
 * @create 2020-09-30-13:53
 * @flag Keep on running
 */
public interface AdminTest {

    boolean doTest(String aname, String apwd);

    boolean doTest(String username);
}
