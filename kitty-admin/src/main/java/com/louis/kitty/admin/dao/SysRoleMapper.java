package com.louis.kitty.admin.dao;

import com.louis.kitty.admin.model.SysRole;

public interface SysRoleMapper {
    int deleteByPrimaryKey(Long roleId);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(Long roleId);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);
}