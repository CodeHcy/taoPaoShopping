package com.service.admin.Impl;

import com.dao.NoticeDao;
import com.domain.Notice;
import com.service.admin.NoticeSericeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-23:22
 * @flag Keep on running
 */
@Service
public class NoticeSericeImpl implements NoticeSericeDao {
    @Autowired
    private NoticeDao noticeDao;
    @Override
    public List<Notice> queryNoticeAll() {
        return noticeDao.queryNoticeAll();
    }

    @Override
    public Integer getNoticeCount() {
        return noticeDao.getNoticeCount();
    }

    @Override
    public int deleteNotice(Integer id) {
        return noticeDao.deleteNotice(id);
    }

    @Override
    public int addNotice(Notice notice) {
        return noticeDao.addNotice(notice);
    }
}
