package com.louis.kitty.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.admin.model.SysRole;
import com.louis.kitty.admin.sevice.SysRoleService;
import com.louis.kitty.core.page.PageRequest;
import com.louis.kitty.core.page.PageResult;

@RestController
@RequestMapping("role")
public class SysRoleController {

	@Autowired
	private SysRoleService sysRoleService;
	
	@PostMapping(value="/save")
	public int save(SysRole record) {
		return sysRoleService.save(record);
	}

	@PostMapping(value="/update")
	public int update(SysRole record) {
		return sysRoleService.update(record);
	}

	@PostMapping(value="/delete")
	public int delete(SysRole record) {
		return sysRoleService.delete(record);
	}

	@PostMapping(value="/delete")
	public int delete(List<SysRole> records) {
		return sysRoleService.delete(records);
	}

	@GetMapping(value="/findById")
	public SysRole findById(Long id) {
		return sysRoleService.findById(id);
	}

	@PostMapping(value="/update")
	public PageResult findPage(PageRequest pageRequest) {
		return sysRoleService.findPage(pageRequest);
	}
}
