package com.domain;

import org.springframework.stereotype.Component;


/**
 * 与数据表ausertable对应
 */
@Component
public class Auser {
	private String aname;
	private String apwd;

	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getApwd() {
		return apwd;
	}
	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
}
