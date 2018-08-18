package com.louis.kitty.admin.sevice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.louis.kitty.admin.dao.SysMenuMapper;
import com.louis.kitty.admin.model.SysMenu;
import com.louis.kitty.admin.page.PageRequest;
import com.louis.kitty.admin.page.PageResult;
import com.louis.kitty.admin.page.PageUtils;
import com.louis.kitty.admin.sevice.SysMenuService;
@Service
public class SysMenuServiceImpl implements SysMenuService {

	@Autowired
	private SysMenuMapper sysMenuMapper;
	
	@Override
	public PageResult findPage(PageRequest pageRequest) {
		return PageUtils.getPageResult(pageRequest, getPageInfo(pageRequest));
	}
	
	/**
	 * 调用分页插件完成分页
	 * @param pageQuery
	 * @return
	 */
	private PageInfo<SysMenu> getPageInfo(PageRequest pageRequest) {
		int pageNum = pageRequest.getPageNum();
		int pageSize = pageRequest.getPageSize();
		PageHelper.startPage(pageNum, pageSize);
		List<SysMenu> sysMenus = sysMenuMapper.selectPage();
		return new PageInfo<SysMenu>(sysMenus);
	}

}
