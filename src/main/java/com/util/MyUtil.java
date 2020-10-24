package com.util;
import com.domain.Buser;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;

public class MyUtil {

	public static String getStringID(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		id=sdf.format(date);
		return id;
	}
	/**
	 * ����û�ID
	 */
	public static Integer getUserId(HttpSession session) {
		Buser ruser = (Buser)session.getAttribute("bruser");
		return ruser.getId();
	}
}
