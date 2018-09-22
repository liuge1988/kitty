package com.louis.kitty.backup.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.louis.kitty.backup.constants.BackupConstants;
import com.louis.kitty.backup.datasource.BackupDataSourceProperties;
import com.louis.kitty.backup.service.MysqlBackupService;
import com.louis.kitty.backup.util.FileUtils;
import com.louis.kitty.backup.util.HttpResult;

/**
 * 系统数据备份还原
 * 采用MYSQL备份还原命令
 * @author Louis
 * @date Sep 20, 2018
 */
@RestController
@RequestMapping("/backup")
public class MySqlBackupController {

	@Autowired
	MysqlBackupService mysqlBackupService;
	@Autowired
	BackupDataSourceProperties properties;

	@GetMapping("/backup")
	public HttpResult backup() {
		String host = properties.getHost();
		String userName = properties.getUserName();
		String password = properties.getPassword();
		String database = properties.getDatabase();
		String backupFodlerName = BackupConstants.DEFAULT_BACKUP_NAME+ "_" + (new SimpleDateFormat(BackupConstants.DATE_FORMAT)).format(new Date());
		String backupFolderPath = BackupConstants.BACKUP_FOLDER + backupFodlerName + File.separator;
		String fileName = BackupConstants.BACKUP_FILE_NAME;
		try {
			mysqlBackupService.backup(host, userName, password, backupFolderPath, fileName, database);
		} catch (Exception e) {
			return HttpResult.error(500, e.getMessage());
		}
		return HttpResult.ok();
	}

	@GetMapping("/restore")
	public HttpResult restore(@RequestParam String name) {
		String host = properties.getHost();
		String userName = properties.getUserName();
		String password = properties.getPassword();
		String database = properties.getDatabase();
		String restoreFilePath = BackupConstants.RESTORE_FOLDER + name;
		try {
			mysqlBackupService.restore(restoreFilePath, host, userName, password, database);
		} catch (Exception e) {
			return HttpResult.error(500, e.getMessage());
		}
		return HttpResult.ok();
	}
	
	@GetMapping("/findRecords")
	public HttpResult findBackupRecords() {
		List<Map<String, Object>> backupRecords = new ArrayList<>();
		File restoreFolderFile = new File(BackupConstants.RESTORE_FOLDER);
		if(restoreFolderFile.exists()) {
			for(File file:restoreFolderFile.listFiles()) {
				Map<String, Object> bean = new HashMap<>();
				bean.put("name", file.getName());
				bean.put("title", file.getName());
				if(BackupConstants.DEFAULT_BACKUP_NAME.equals(file.getName())) {
					bean.put("title", "系统默认备份");
				}
				backupRecords.add(bean);
			}
		}
		return HttpResult.ok(backupRecords);
	}
	
	@GetMapping("/delete")
	public HttpResult deleteBackupRecord(@RequestParam String name) {
		if(BackupConstants.DEFAULT_BACKUP_NAME.equals(name)) {
			return HttpResult.error("系统默认备份无法删除!");
		}
		String restoreFilePath = BackupConstants.RESTORE_FOLDER + name;
		try {
			FileUtils.deleteFile(new File(restoreFilePath));
		} catch (Exception e) {
			return HttpResult.error(500, e.getMessage());
		}
		return HttpResult.ok();
	}

}
