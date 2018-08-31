package com.louis.kitty.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.louis.kitty.admin.model.SysMenu;

public interface SysMenuMapper {
    int deleteByPrimaryKey(Long menuId);

    int insert(SysMenu record);

    int insertSelective(SysMenu record);

    SysMenu selectByPrimaryKey(Long menuId);

    int updateByPrimaryKeySelective(SysMenu record);

    int updateByPrimaryKey(SysMenu record);
    
	List<SysMenu> findPage();

	List<SysMenu> findPageByName(@Param(value="name") String name);
	
	List<SysMenu> findAll();

	List<SysMenu> findPageByUserName(@Param(value="username") String username);
}