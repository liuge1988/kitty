package com.louis.kitty.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.admin.model.SysUser;
import com.louis.kitty.admin.sevice.SysUserService;
import com.louis.kitty.admin.util.PasswordUtils;
import com.louis.kitty.admin.util.ShiroUtils;
import com.louis.kitty.core.http.HttpResult;
import com.louis.kitty.core.page.PageRequest;

@RestController
@RequestMapping("user")
public class SysUserController {

	@Autowired
	private SysUserService sysUserService;
	
	@PostMapping(value="/save")
	public HttpResult save(@RequestBody SysUser record) {
		if(record.getPassword() != null) {
			SysUser user = sysUserService.findById(record.getId());
			if(user == null || !record.getPassword().equals(user.getPassword())) {
				String salt = PasswordUtils.getSalt();
				String password = PasswordUtils.encrypte(record.getPassword(), salt);
				record.setSalt(salt);
				record.setPassword(password);
			}
		}
		return HttpResult.ok(sysUserService.save(record));
	}

	@PostMapping(value="/delete")
	public HttpResult delete(@RequestBody List<SysUser> records) {
		return HttpResult.ok(sysUserService.delete(records));
	}
	
	@GetMapping(value="/findByName")
	public HttpResult findByUserName(@RequestParam String name) {
		return HttpResult.ok(sysUserService.findByName(name));
	}
	
	@GetMapping(value="/findPermissions")
	public HttpResult findPermissions(@RequestParam String name) {
		return HttpResult.ok(sysUserService.findPermissions(name));
	}

	@PostMapping(value="/findPage")
	public HttpResult findPage(@RequestBody PageRequest pageRequest) {
		return HttpResult.ok(sysUserService.findPage(pageRequest));
	}
	
	/**
	 * 修改登录用户密码
	 */
	@GetMapping("/updatePassword")
	public HttpResult updatePassword(@RequestParam String password, @RequestParam String newPassword) {
		SysUser user = ShiroUtils.getUser();
		if(user != null && password != null && newPassword != null) {
			String oldPassword = PasswordUtils.encrypte(password, user.getSalt());
			if(!oldPassword.equals(user.getPassword())) {
				return HttpResult.error("原密码不正确");
			}
			user.setPassword(PasswordUtils.encrypte(newPassword, user.getSalt()));
			HttpResult.ok(sysUserService.save(user));
		}
		return HttpResult.error();
	}

}
