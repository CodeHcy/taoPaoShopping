package com.service.before.Impl;

import com.dao.BuserDao;
import com.dao.GoodsTypeTable;
import com.dao.NoticeDao;
import com.dao.goodstable;
import com.domain.Buser;
import com.domain.Goods;
import com.domain.GoodsType;
import com.domain.Notice;
import com.exception.NameException;
import com.service.before.BeforeServiceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author hcy
 * @create 2020-10-06-18:45
 * @flag Keep on running
 */
@Service
public class BeforeServiceImpl implements BeforeServiceDao {
    @Autowired
    private BuserDao buserDao;
    @Autowired
    private goodstable goodstable;
    @Autowired
    private GoodsTypeTable goodsTypeTable;
    @Autowired
    private NoticeDao noticeDao;
    @Override
    public boolean testBuser(String bemail, String bpwd) {
        boolean flag = false;
        List<Buser> list = buserDao.testBuser();
        if (list == null){
            return flag;
        }
        for (Buser buser : list) {
            if (buser.getBemail().equals(bemail)&&buser.getBpwd().equals(bpwd)){
                flag = true;
            }
        }
        return flag;
    }

    @Override
    public int registerBuser(Buser buser) {
        return buserDao.addBuser(buser);
    }

    public List<Goods> showGoods(Integer goodstype_id) {

        return goodstable.ByTypeshows(goodstype_id);
    }

    @Override
    public Integer getCount(Integer goodstype_id) {
        return goodstable.getATypeCount(goodstype_id);
    }

    @Override
    public List<GoodsType> getType() {
        return goodsTypeTable.queryType();
    }

    @Override
    public Integer changeType(String typename) {
        return goodsTypeTable.changeType(typename);
    }

    public List<Notice> getNotices() {
        return noticeDao.queryNoticeAll();
    }

    @Override
    public Notice getANotice(String title) {
        return noticeDao.getANotice(title);
    }


}
