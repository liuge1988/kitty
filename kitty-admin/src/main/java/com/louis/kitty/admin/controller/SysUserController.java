package com.louis.kitty.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.admin.model.SysUser;
import com.louis.kitty.admin.sevice.SysUserService;
import com.louis.kitty.core.page.PageRequest;
import com.louis.kitty.core.page.PageResult;

@RestController
@RequestMapping("user")
public class SysUserController {

	@Autowired
	private SysUserService sysUserService;
	
	@PostMapping(value="/save")
	public int save(SysUser record) {
		return sysUserService.save(record);
	}

	@PostMapping(value="/update")
	public int update(SysUser record) {
		return sysUserService.update(record);
	}

	@PostMapping(value="/delete")
	public int delete(SysUser record) {
		return sysUserService.delete(record);
	}

	@PostMapping(value="/delete")
	public int delete(List<SysUser> records) {
		return sysUserService.delete(records);
	}

	@GetMapping(value="/findById")
	public SysUser findById(Long id) {
		return sysUserService.findById(id);
	}

	@PostMapping(value="/update")
	public PageResult findPage(PageRequest pageRequest) {
		return sysUserService.findPage(pageRequest);
	}
}
