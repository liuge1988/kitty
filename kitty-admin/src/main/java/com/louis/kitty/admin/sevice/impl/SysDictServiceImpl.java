package com.louis.kitty.admin.sevice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.louis.kitty.admin.dao.SysDictMapper;
import com.louis.kitty.admin.model.SysDict;
import com.louis.kitty.admin.sevice.SysDictService;
import com.louis.kitty.core.page.MybatisPageHelper;
import com.louis.kitty.core.page.PageRequest;
import com.louis.kitty.core.page.PageResult;

@Service
public class SysDictServiceImpl  implements SysDictService {

	@Autowired
	private SysDictMapper sysDictMapper;

	@Override
	public int save(SysDict record) {
		return sysDictMapper.insertSelective(record);
	}

	@Override
	public int update(SysDict record) {
		return sysDictMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int delete(SysDict record) {
		return sysDictMapper.deleteByPrimaryKey(record.getId());
	}

	@Override
	public int delete(List<SysDict> records) {
		for(SysDict record:records) {
			delete(record);
		}
		return 1;
	}

	@Override
	public SysDict findById(Long id) {
		return sysDictMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageResult findPage(PageRequest pageRequest) {
		return MybatisPageHelper.findPage(pageRequest, sysDictMapper);
	}
	
}
