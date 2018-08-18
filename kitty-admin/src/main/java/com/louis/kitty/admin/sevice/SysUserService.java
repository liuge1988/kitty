package com.louis.kitty.admin.sevice;

import java.util.List;

import com.louis.kitty.admin.model.SysUser;
import com.louis.kitty.core.service.CurdService;

public interface SysUserService extends CurdService<SysUser> {


	/**
	 * 查找所有用户
	 * @return
	 */
	List<SysUser> findAll();

}
