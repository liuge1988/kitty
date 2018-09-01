package com.louis.kitty.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.admin.model.SysMenu;
import com.louis.kitty.admin.sevice.SysMenuService;
import com.louis.kitty.core.http.HttpResult;
import com.louis.kitty.core.page.PageRequest;

@RestController
@RequestMapping("menu")
public class SysMenuController {

	@Autowired
	private SysMenuService sysMenuService;
	
	@PostMapping(value="/save")
	public HttpResult save(@RequestBody SysMenu record) {
		return HttpResult.ok(sysMenuService.save(record));
	}

	@PostMapping(value="/update")
	public HttpResult update(@RequestBody SysMenu record) {
		return HttpResult.ok(sysMenuService.update(record));
	}

	@PostMapping(value="/delete")
	public HttpResult delete(@RequestBody SysMenu record) {
		return HttpResult.ok(sysMenuService.delete(record));
	}

	@PostMapping(value="/deleteBatch")
	public HttpResult delete(@RequestBody List<SysMenu> records) {
		return HttpResult.ok(sysMenuService.delete(records));
	}

	@GetMapping(value="/findTree")
	public HttpResult findTree(String userName) {
		return HttpResult.ok(sysMenuService.findTree(userName));
	}
}
