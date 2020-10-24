package com.service.admin;

import com.domain.Notice;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-23:22
 * @flag Keep on running
 */
public interface NoticeSericeDao {
    List<Notice> queryNoticeAll();

    Integer getNoticeCount();

    int deleteNotice(Integer id);

    int addNotice(Notice notice);
}
