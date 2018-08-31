package com.louis.kitty.admin.sevice;

import java.util.List;

import com.louis.kitty.admin.model.SysRole;
import com.louis.kitty.core.service.CurdService;

public interface SysRoleService extends CurdService<SysRole> {

	/**
	 * 查询全部
	 * @return
	 */
	List<SysRole> findAll();

}
