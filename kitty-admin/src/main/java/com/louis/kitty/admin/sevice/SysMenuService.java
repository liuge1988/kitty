package com.louis.kitty.admin.sevice;

import java.util.List;

import com.louis.kitty.admin.model.SysMenu;
import com.louis.kitty.core.service.CurdService;

public interface SysMenuService extends CurdService<SysMenu> {

	/**
	 * 查询菜单树,用户ID和用户名为空则查询全部
	 * @param userId 
	 * @return
	 */
	List<SysMenu> findTree(String userName);

	/**
	 * 根据用户名查找菜单列表
	 * @param userName
	 * @return
	 */
	List<SysMenu> findByUser(String userName);
}
