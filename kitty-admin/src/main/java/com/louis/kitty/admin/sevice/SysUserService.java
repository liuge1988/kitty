package com.louis.kitty.admin.sevice;

import java.util.List;

import com.louis.kitty.admin.model.SysUser;

public interface SysUserService {

	/**
	 * 根据用户ID查找用户
	 * @param userId
	 * @return
	 */
	SysUser findByUserId(Long userId);

	/**
	 * 查找所有用户
	 * @return
	 */
	List<SysUser> findAll();

}
