package com.louis.kitty.admin.sevice;

import java.util.List;

import com.louis.kitty.admin.model.SysDept;
import com.louis.kitty.core.service.CurdService;

public interface SysDeptService extends CurdService<SysDept> {

	/**
	 * 查询机构树
	 * @param userId 
	 * @return
	 */
	List<SysDept> findTree();
}
