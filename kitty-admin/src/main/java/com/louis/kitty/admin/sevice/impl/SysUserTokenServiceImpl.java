package com.louis.kitty.admin.sevice.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.louis.kitty.admin.dao.SysUserTokenMapper;
import com.louis.kitty.admin.model.SysUserToken;
import com.louis.kitty.admin.sevice.SysUserTokenService;
import com.louis.kitty.admin.util.TokenGenerator;
import com.louis.kitty.core.page.MybatisPageHelper;
import com.louis.kitty.core.page.PageRequest;
import com.louis.kitty.core.page.PageResult;


@Service
public class SysUserTokenServiceImpl implements SysUserTokenService {
	
	@Autowired
	private SysUserTokenMapper sysUserTokenMapper;
	// 12小时后过期
	private final static int EXPIRE = 3600 * 12;

	@Override
	public SysUserToken findByUserId(Long userId) {
		return sysUserTokenMapper.findByUserId(userId);
	}

	@Override
	public SysUserToken findByToken(String token) {
		return sysUserTokenMapper.findByToken(token);
	}

	@Override
	public int save(SysUserToken record) {
		return sysUserTokenMapper.insertSelective(record);
	}

	@Override
	public int update(SysUserToken record) {
		return sysUserTokenMapper.updateByPrimaryKey(record);
	}

	@Override
	public int delete(SysUserToken record) {
		return sysUserTokenMapper.deleteByPrimaryKey(record.getId());
	}

	@Override
	public int delete(List<SysUserToken> records) {
		for(SysUserToken record:records) {
			delete(record);
		}
		return 1;
	}

	@Override
	public SysUserToken findById(Long id) {
		return sysUserTokenMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageResult findPage(PageRequest pageRequest) {
		return MybatisPageHelper.findPage(pageRequest, sysUserTokenMapper);
	}

	@Override
	public SysUserToken createToken(long userId) {
		//生成一个token
		String token = TokenGenerator.generateToken();

		//当前时间
		Date now = new Date();
		//过期时间
		Date expireTime = new Date(now.getTime() + EXPIRE * 1000);

		//判断是否生成过token
		SysUserToken sysUserToken = findByUserId(userId);
		if(sysUserToken == null){
			sysUserToken = new SysUserToken();
			sysUserToken.setUserId(userId);
			sysUserToken.setToken(token);
			sysUserToken.setLastUpdateTime(now);
			sysUserToken.setExpireTime(expireTime);

			//保存token
			save(sysUserToken);
		} else{
			sysUserToken.setToken(token);
			sysUserToken.setLastUpdateTime(now);
			sysUserToken.setExpireTime(expireTime);

			//更新token
			update(sysUserToken);
		}
		return sysUserToken;
	}
}
