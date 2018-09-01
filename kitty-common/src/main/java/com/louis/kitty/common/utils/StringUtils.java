package com.louis.kitty.common.utils;

/**
 * 字符串工具类
 * @author Louis
 * @date Sep 1, 2018
 */
public class StringUtils {

	public static boolean isBlank(String value) {
		return value == null || "".equals(value) || "null".equals(value) || "undefined".equals(value);
	}

}
