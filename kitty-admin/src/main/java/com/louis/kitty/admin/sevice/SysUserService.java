package com.louis.kitty.admin.sevice;

import com.louis.kitty.admin.model.SysUser;
import com.louis.kitty.core.service.CurdService;

public interface SysUserService extends CurdService<SysUser> {

	SysUser findByUserName(String username);

}
