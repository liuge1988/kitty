package com.louis.kitty.admin.model;

import java.util.Date;

public class SysUserToken extends BaseModel {
	
    private Long userId;
    
    private String token;
    
    private Date expireTime;
    
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Date getExpireTime() {
		return expireTime;
	}
	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}
   
}