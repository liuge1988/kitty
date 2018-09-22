package com.louis.kitty.admin.sevice;

import java.util.List;
import java.util.Set;

import com.louis.kitty.admin.model.SysUser;
import com.louis.kitty.admin.model.SysUserRole;
import com.louis.kitty.core.service.CurdService;

public interface SysUserService extends CurdService<SysUser> {

	SysUser findByName(String username);

	/**
	 * 查找用户的菜单权限标识集合
	 * @param userName
	 * @return
	 */
	Set<String> findPermissions(String userName);

	/**
	 * 查找用户的角色集合
	 * @param userName
	 * @return
	 */
	List<SysUserRole> findUserRoles(Long userId);

}
