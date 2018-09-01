package com.louis.kitty.admin.sevice;

import java.util.Set;

import com.louis.kitty.admin.model.SysUser;
import com.louis.kitty.core.service.CurdService;

public interface SysUserService extends CurdService<SysUser> {

	SysUser findByUserName(String username);

	/**
	 * 查找用户的菜单权限标识集合
	 * @param userName
	 * @return
	 */
	Set<String> findPermissions(String userName);

}
