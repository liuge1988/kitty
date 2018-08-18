package com.louis.kitty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.admin.page.PageRequest;
import com.louis.kitty.admin.sevice.SysMenuService;

@RestController
@RequestMapping("menu")
public class SysMenuController {

	@Autowired
	private SysMenuService sysMenuService;
	
	
	@PostMapping(value="/findPage")
	public Object findPage(@RequestBody PageRequest pageQuery) {
		return sysMenuService.findPage(pageQuery);
	}
}
