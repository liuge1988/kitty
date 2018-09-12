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
import com.louis.kitty.core.http.HttpResult;
import com.louis.kitty.core.page.PageRequest;

@RestController
@RequestMapping("user")
public class SysUserController {

	@Autowired
	private SysUserService sysUserService;
	
	@PostMapping(value="/save")
	public HttpResult save(@RequestBody SysUser record) {
		return HttpResult.ok(sysUserService.save(record));
	}

	@PostMapping(value="/delete")
	public HttpResult delete(@RequestBody List<SysUser> records) {
		return HttpResult.ok(sysUserService.delete(records));
	}
	
	@GetMapping(value="/findByUserName")
	public HttpResult findByUserName(@RequestParam String userName) {
		return HttpResult.ok(sysUserService.findByUserName(userName));
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
//		SysUser user = ShiroUtils.getUser();
//		password = PasswordUtils.encrypte(password, user.getSalt());
//		newPassword = PasswordUtils.encrypte(newPassword, user.getSalt());
//		// 更新密码
//		int count = HttpResult.ok(sysUserService.updatePassword(user.getUserId(), password, newPassword);
//		if (count == 0) {
//			return HttpResult.error("原密码不正确");
//		}
		return HttpResult.ok();
	}

}
