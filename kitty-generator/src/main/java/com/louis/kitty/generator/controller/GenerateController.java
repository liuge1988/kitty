package com.louis.kitty.generator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.core.http.HttpResult;
import com.louis.kitty.dbms.vo.ConnParam;
import com.louis.kitty.generator.service.GenerateService;
import com.louis.kitty.generator.vo.GenerateModel;

/**
 * 代码生成控制器
 * @author Louis
 * @date Nov 9, 2018
 */
@RestController
@RequestMapping("")
public class GenerateController {

	@Autowired
	GenerateService generatorService;
	
	@PostMapping("/testConnection")
	public HttpResult testConnection(@RequestBody ConnParam connParam) {
		return HttpResult.ok(generatorService.testConnection(connParam));
	}

	@PostMapping("/getTables")
	public HttpResult getTables(@RequestBody ConnParam connParam) {
		return HttpResult.ok(generatorService.getTables(connParam));
	}
	
	@PostMapping("/getGenerateModel")
	public HttpResult getGenerateModel(@RequestBody GenerateModel generateModel) {
		return HttpResult.ok(generatorService.getGenerateModel(generateModel));
	}
	
	@PostMapping("/generateModels")
	public HttpResult generateModels(@RequestBody GenerateModel generateModel) throws Exception {
		return HttpResult.ok(generatorService.generateModels(generateModel));
	}
	
}
