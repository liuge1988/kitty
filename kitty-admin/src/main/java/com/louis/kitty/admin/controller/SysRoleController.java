package com.louis.kitty.admin.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.admin.constants.SysConstants;
import com.louis.kitty.admin.dao.SysRoleMapper;
import com.louis.kitty.admin.model.SysRole;
import com.louis.kitty.admin.model.SysRoleMenu;
import com.louis.kitty.admin.sevice.SysRoleService;
import com.louis.kitty.core.http.HttpResult;
import com.louis.kitty.core.page.PageRequest;

/**
 * 角色控制器
 * @author Louis
 * @date Oct 29, 2018
 */
@RestController
@RequestMapping("role")
public class SysRoleController {

	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysRoleMapper sysRoleMapper;
	
	@RequiresPermissions({"sys:role:add", "sys:role:edit"})
	@PostMapping(value="/save")
	public HttpResult save(@RequestBody SysRole record) {
		SysRole role = sysRoleService.findById(record.getId());
		if(role != null) {
			if(SysConstants.ADMIN.equalsIgnoreCase(role.getName())) {
				return HttpResult.error("超级管理员不允许修改!");
			}
		}
		// 新增角色
		if((record.getId() == null || record.getId() ==0) && !sysRoleService.findByName(record.getName()).isEmpty()) {
			return HttpResult.error("角色名已存在!");
		}
		return HttpResult.ok(sysRoleService.save(record));
	}

	@RequiresPermissions("sys:role:delete")
	@PostMapping(value="/delete")
	public HttpResult delete(@RequestBody List<SysRole> records) {
		return HttpResult.ok(sysRoleService.delete(records));
	}

	@RequiresPermissions("sys:role:view")
	@PostMapping(value="/findPage")
	public HttpResult findPage(@RequestBody PageRequest pageRequest) {
		return HttpResult.ok(sysRoleService.findPage(pageRequest));
	}
	
	@RequiresPermissions("sys:role:view")
	@GetMapping(value="/findAll")
	public HttpResult findAll() {
		return HttpResult.ok(sysRoleService.findAll());
	}
	
	@RequiresPermissions("sys:role:view")
	@GetMapping(value="/findRoleMenus")
	public HttpResult findRoleMenus(@RequestParam Long roleId) {
		return HttpResult.ok(sysRoleService.findRoleMenus(roleId));
	}
	
	@RequiresPermissions("sys:role:view")
	@PostMapping(value="/saveRoleMenus")
	public HttpResult saveRoleMenus(@RequestBody List<SysRoleMenu> records) {
		for(SysRoleMenu record:records) {
			SysRole sysRole = sysRoleMapper.selectByPrimaryKey(record.getRoleId());
			if(SysConstants.ADMIN.equalsIgnoreCase(sysRole.getName())) {
				// 如果是超级管理员，不允许修改
				return HttpResult.error("超级管理员拥有所有菜单权限，不允许修改！");
			}
		}
		return HttpResult.ok(sysRoleService.saveRoleMenus(records));
	}
}
