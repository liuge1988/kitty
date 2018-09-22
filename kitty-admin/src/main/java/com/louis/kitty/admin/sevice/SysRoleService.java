package com.louis.kitty.admin.sevice;

import java.util.List;

import com.louis.kitty.admin.model.SysRole;
import com.louis.kitty.admin.model.SysRoleMenu;
import com.louis.kitty.core.service.CurdService;

public interface SysRoleService extends CurdService<SysRole> {

	/**
	 * 查询全部
	 * @return
	 */
	List<SysRole> findAll();

	/**
	 * 查询角色菜单集合
	 * @return
	 */
	List<SysRoleMenu> findMenus(Long roleId);

	/**
	 * 保存角色菜单
	 * @param records
	 * @return
	 */
	int saveRoleMenus(List<SysRoleMenu> records);

}
