package com.dao;

import com.domain.Notice;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author hcy
 * @create 2020-10-03-23:23
 * @flag Keep on running
 */
@Repository
public interface NoticeDao {
    List<Notice> queryNoticeAll();

    Integer getNoticeCount();

    int deleteNotice(Integer id);

    int addNotice(Notice notice);

    Notice getANotice(String title);
}
