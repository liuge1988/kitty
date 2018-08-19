package com.louis.kitty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.admin.sevice.SysUserService;
import com.louis.kitty.core.http.HttpResult;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("user")
public class SysUserController {

	@Autowired
	private SysUserService sysUserService;
	
	@GetMapping(value="/findByUserId")
	public HttpResult findByUserId(@RequestParam Long userId) {
		return HttpResult.ok(sysUserService.findById(userId));
	}
	
	@GetMapping(value="/findAll")
	public HttpResult findAll() {
		return HttpResult.ok(sysUserService.findAll());
	}
}
