package com.louis.kitty.admin.dao;

import java.util.List;

import com.louis.kitty.admin.model.SysMenu;

public interface SysMenuMapper {
    int deleteByPrimaryKey(Long menuId);

    int insert(SysMenu record);

    int insertSelective(SysMenu record);

    SysMenu selectByPrimaryKey(Long menuId);

    int updateByPrimaryKeySelective(SysMenu record);

    int updateByPrimaryKey(SysMenu record);
    
    /**
     * 分页查询
     * @return
     */
	List<SysMenu> selectPage();
}
