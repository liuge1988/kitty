package com.louis.kitty.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.admin.model.SysLog;
import com.louis.kitty.admin.sevice.SysLogService;
import com.louis.kitty.core.http.HttpResult;
import com.louis.kitty.core.page.PageRequest;

@RestController
@RequestMapping("log")
public class SysLogController {

	@Autowired
	private SysLogService sysLogService;
	
	@PostMapping(value="/save")
	public HttpResult save(@RequestBody SysLog record) {
		return HttpResult.ok(sysLogService.save(record));
	}

	@PostMapping(value="/update")
	public HttpResult update(@RequestBody SysLog record) {
		return HttpResult.ok(sysLogService.update(record));
	}

	@PostMapping(value="/delete")
	public HttpResult delete(@RequestBody SysLog record) {
		return HttpResult.ok(sysLogService.delete(record));
	}

	@PostMapping(value="/deleteBatch")
	public HttpResult delete(@RequestBody List<SysLog> records) {
		return HttpResult.ok(sysLogService.delete(records));
	}

	@GetMapping(value="/findById")
	public HttpResult findById(@RequestParam Long id) {
		return HttpResult.ok(sysLogService.findById(id));
	}

	@PostMapping(value="/findPage")
	public HttpResult findPage(@RequestBody PageRequest pageRequest) {
		return HttpResult.ok(sysLogService.findPage(pageRequest));
	}
}
