package com.louis.kitty.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.admin.model.SysRole;
import com.louis.kitty.admin.sevice.SysRoleService;
import com.louis.kitty.core.http.HttpResult;
import com.louis.kitty.core.page.PageRequest;

@RestController
@RequestMapping("role")
public class SysRoleController {

	@Autowired
	private SysRoleService sysRoleService;
	
	@PostMapping(value="/save")
	public HttpResult save(@RequestBody SysRole record) {
		return HttpResult.ok(sysRoleService.save(record));
	}

	@PostMapping(value="/update")
	public HttpResult update(@RequestBody SysRole record) {
		return HttpResult.ok(sysRoleService.update(record));
	}

	@PostMapping(value="/delete")
	public HttpResult delete(@RequestBody SysRole record) {
		return HttpResult.ok(sysRoleService.delete(record));
	}

	@PostMapping(value="/deleteBatch")
	public HttpResult delete(@RequestBody List<SysRole> records) {
		return HttpResult.ok(sysRoleService.delete(records));
	}

	@PostMapping(value="/findPage")
	public HttpResult findPage(@RequestBody PageRequest pageRequest) {
		return HttpResult.ok(sysRoleService.findPage(pageRequest));
	}
	
	@GetMapping(value="/findAll")
	public HttpResult findAll() {
		return HttpResult.ok(sysRoleService.findAll());
	}
}
