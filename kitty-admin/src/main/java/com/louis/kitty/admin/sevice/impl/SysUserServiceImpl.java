package com.louis.kitty.admin.sevice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.louis.kitty.admin.dao.SysUserMapper;
import com.louis.kitty.admin.model.SysUser;
import com.louis.kitty.admin.sevice.SysUserService;
import com.louis.kitty.core.page.ColumnFilter;
import com.louis.kitty.core.page.MybatisPageHelper;
import com.louis.kitty.core.page.PageRequest;
import com.louis.kitty.core.page.PageResult;

@Service
public class SysUserServiceImpl  implements SysUserService {

	@Autowired
	private SysUserMapper sysUserMapper;

	@Override
	public int save(SysUser record) {
		return sysUserMapper.insertSelective(record);
	}

	@Override
	public int update(SysUser record) {
		return sysUserMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int delete(SysUser record) {
		return sysUserMapper.deleteByPrimaryKey(record.getUserId());
	}

	@Override
	public int delete(List<SysUser> records) {
		for(SysUser record:records) {
			delete(record);
		}
		return 1;
	}

	@Override
	public SysUser findById(Long id) {
		return sysUserMapper.selectByPrimaryKey(id);
	}

	@Override
	public SysUser findByUserName(String username) {
		return sysUserMapper.findByUserName(username);
	}
	
	@Override
	public PageResult findPage(PageRequest pageRequest) {
		ColumnFilter columnFilter = pageRequest.getColumnFilter(NAME);
		if(columnFilter != null) {
			return MybatisPageHelper.findPage(pageRequest, sysUserMapper, "findPageByName", columnFilter.getValue());
		}
		return MybatisPageHelper.findPage(pageRequest, sysUserMapper);
	}

}
