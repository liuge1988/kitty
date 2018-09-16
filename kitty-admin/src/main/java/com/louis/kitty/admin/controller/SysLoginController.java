package com.louis.kitty.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.admin.model.SysUser;
import com.louis.kitty.admin.model.SysUserToken;
import com.louis.kitty.admin.sevice.SysUserService;
import com.louis.kitty.admin.sevice.SysUserTokenService;
import com.louis.kitty.admin.util.PasswordUtils;
import com.louis.kitty.admin.util.ShiroUtils;
import com.louis.kitty.admin.vo.LoginBean;
import com.louis.kitty.core.http.HttpResult;

@RestController
public class SysLoginController {

//	@Autowired
//	private Producer producer;
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysUserTokenService sysUserTokenService;

	@GetMapping("captcha.jpg")
	public void captcha(HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-store, no-cache");
		response.setContentType("image/jpeg");

//		// 生成文字验证码
//		String text = producer.createText();
//		// 生成图片验证码
//		BufferedImage image = producer.createImage(text);
//		// 保存到shiro session
//		ShiroUtils.setSessionAttribute(KaptchaConstants.KAPTCHA_SESSION_KEY, text);
//
//		ServletOutputStream out = response.getOutputStream();
//		ImageIO.write(image, "jpg", out);	
//		IOUtils.closeQuietly(out);
	}

	/**
	 * 登录接口
	 */
	@PostMapping(value = "/login")
	public HttpResult login(@RequestBody LoginBean loginBean) throws IOException {
		String userName = loginBean.getAccount();
		String password = loginBean.getPassword();

		// 用户信息
		SysUser user = sysUserService.findByName(userName);

		// 账号不存在、密码错误
		if (user == null) {
			return HttpResult.error("账号不存在");
		}
		
		if (!match(user, password)) {
			return HttpResult.error("密码不正确");
		}

		// 账号锁定
		if (user.getStatus() == 0) {
			return HttpResult.error("账号已被锁定,请联系管理员");
		}

		// 生成token，并保存到数据库
		SysUserToken data = sysUserTokenService.createToken(user.getId());
		return HttpResult.ok(data);
	}

	/**
	 * 验证用户密码
	 * @param user
	 * @param password
	 * @return
	 */
	public boolean match(SysUser user, String password) {
		return user.getPassword().equals(PasswordUtils.encrypte(password, user.getSalt()));
	}
	
	/**
	 * 登出接口
	 */
	@GetMapping(value = "/logout")
	public HttpResult logout() {
		ShiroUtils.logout();
		return HttpResult.ok();
	}
}
