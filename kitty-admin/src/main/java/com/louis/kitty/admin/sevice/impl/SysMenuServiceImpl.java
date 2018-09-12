package com.louis.kitty.admin.sevice.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.louis.kitty.admin.constants.SysConstants;
import com.louis.kitty.admin.dao.SysMenuMapper;
import com.louis.kitty.admin.model.SysMenu;
import com.louis.kitty.admin.sevice.SysMenuService;
import com.louis.kitty.core.page.MybatisPageHelper;
import com.louis.kitty.core.page.PageRequest;
import com.louis.kitty.core.page.PageResult;

@Service
public class SysMenuServiceImpl implements SysMenuService {

	@Autowired
	private SysMenuMapper sysMenuMapper;

	@Override
	public int save(SysMenu record) {
		if(record.getMenuId() == null || record.getMenuId() == 0) {
			return sysMenuMapper.insertSelective(record);
		}
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
		return MybatisPageHelper.findPage(pageRequest, sysMenuMapper);
	}
	
	@Override
	public List<SysMenu> findTree(String userName, int menuType) {
		List<SysMenu> sysMenus = new ArrayList<>();
		List<SysMenu> menus = findByUser(userName);
		for (SysMenu menu : menus) {
			if (menu.getParentId() == null || menu.getParentId() == 0) {
				sysMenus.add(menu);
			}
		}
		findChildren(sysMenus, menus, menuType);
		return sysMenus;
	}

	@Override
	public List<SysMenu> findByUser(String userName) {
		if(userName == null || "".equals(userName) || SysConstants.ADMIN.equalsIgnoreCase(userName)) {
			return sysMenuMapper.findAll();
		}
		return sysMenuMapper.findByUserName(userName);
	}

	private void findChildren(List<SysMenu> SysMenus, List<SysMenu> menus, int menuType) {
		for (SysMenu SysMenu : SysMenus) {
			List<SysMenu> children = new ArrayList<>();
			for (SysMenu menu : menus) {
				if(menuType == 1 && menu.getType() == 2) {
					// 如果是获取类型不需要按钮，且菜单类型是按钮的，直接过滤掉
					continue ;
				}
				if (SysMenu.getMenuId() != null && SysMenu.getMenuId().equals(menu.getParentId())) {
					children.add(menu);
				}
			}
			SysMenu.setChildren(children);
			findChildren(children, menus, menuType);
		}
	}
	
}
