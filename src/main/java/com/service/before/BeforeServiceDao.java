package com.service.before;

import com.domain.Buser;
import com.domain.Goods;
import com.domain.GoodsType;
import com.domain.Notice;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-06-18:44
 * @flag Keep on running
 */
public interface BeforeServiceDao {

    boolean testBuser(String bemail, String bpwd);

    int registerBuser(Buser buser);


    List<Goods> showGoods(Integer goodstype_id);


    Integer getCount(Integer goodstype_id);

    List<GoodsType> getType();

    Integer changeType(String typename);


    List<Notice> getNotices();


    Notice getANotice(String title);
}
