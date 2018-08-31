package com.louis.kitty.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.louis.kitty.admin.model.SysUser;

public interface SysUserMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Long userId);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);
    
    List<SysUser> findPage();
    
    SysUser findByUserName(@Param(value="username") String username);
    
	List<SysUser> findPageByUserName(@Param(value="username") String username);

}