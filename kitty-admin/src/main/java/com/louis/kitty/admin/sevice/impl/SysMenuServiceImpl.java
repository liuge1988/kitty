package com.louis.kitty.admin.sevice.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.louis.kitty.admin.dao.SysMenuMapper;
import com.louis.kitty.admin.dao.SysRoleMenuMapper;
import com.louis.kitty.admin.model.SysMenu;
import com.louis.kitty.admin.sevice.SysMenuService;
import com.louis.kitty.core.page.ColumnFilter;
import com.louis.kitty.core.page.MybatisPageHelper;
import com.louis.kitty.core.page.PageRequest;
import com.louis.kitty.core.page.PageResult;

@Service
public class SysMenuServiceImpl implements SysMenuService {

	@Autowired
	private SysMenuMapper sysMenuMapper;
	@Autowired
	private SysRoleMenuMapper sysRoleMenuMapper;

	@Override
	public int save(SysMenu record) {
		return sysMenuMapper.insertSelective(record);
	}

	@Override
	public int update(SysMenu record) {
		return sysMenuMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int delete(SysMenu record) {
		return sysMenuMapper.deleteByPrimaryKey(record.getMenuId());
	}

	@Override
	public int delete(List<SysMenu> records) {
		for(SysMenu record:records) {
			delete(record);
		}
		return 1;
	}

	@Override
	public SysMenu findById(Long id) {
		return sysMenuMapper.selectByPrimaryKey(id);
	}


	@Override
	public PageResult findPage(PageRequest pageRequest) {
		ColumnFilter columnFilter = pageRequest.getColumnFilter(NAME);
		if(columnFilter != null) {
			return MybatisPageHelper.findPage(pageRequest, sysMenuMapper, "findPageByName", columnFilter.getValue());
		}
		return MybatisPageHelper.findPage(pageRequest, sysMenuMapper);
	}
	
	@Override
	public List<SysMenu> findTree(String userName) {
		List<SysMenu> sysMenus = new ArrayList<>();
		List<SysMenu> menus = findByUser(userName);
		for (SysMenu menu : menus) {
			if (menu.getParentId() == null || menu.getParentId() == 0) {
				sysMenus.add(menu);
			}
		}
		findChildren(sysMenus, menus);
		return sysMenus;
	}

	private List<SysMenu> findByUser(String userName) {
		if(userName == null) {
			return sysMenuMapper.findAll();
		}
		return sysMenuMapper.findPageByUserName(userName);
	}

	private void findChildren(List<SysMenu> SysMenus, List<SysMenu> menus) {
		for (SysMenu SysMenu : SysMenus) {
			List<SysMenu> children = new ArrayList<>();
			for (SysMenu menu : menus) {
				if (SysMenu.getMenuId() != null && SysMenu.getMenuId().equals(menu.getParentId())) {
					children.add(menu);
				}
			}
			SysMenu.setChildren(children);
			findChildren(children, menus);
		}
	}
	
}
