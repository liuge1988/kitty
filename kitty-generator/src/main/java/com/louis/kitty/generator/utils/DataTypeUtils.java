package com.louis.kitty.generator.utils;

/**
 * 数据类型工具类
 * @author Louis
 * @date Nov 10, 2018
 */
public class DataTypeUtils {

	public static final String String = "String";
	public static final String Byte = "Byte";
	public static final String Short = "Short";
	public static final String Integer = "Integer";
	public static final String Long = "Long";
	public static final String Float = "Float";
	public static final String Double = "Double";
	public static final String Character = "Character";
	public static final String Boolean = "Boolean";
	public static final String Date = "java.util.Date";

	public static final String CHAR = "CHAR";
	public static final String TEXT = "TEXT";
	public static final String BLOB = "BLOB";
	public static final String BIT = "BIT";
	public static final String INT = "INT";
	public static final String BIGINT = "BIGINT";
	public static final String LONG = "LONG";
	public static final String FLOAT = "FLOAT";
	public static final String NUMBER = "NUMBER";
	public static final String DECIMAL = "DECIMAL";
	public static final String DOUBLE = "DOUBLE";
	public static final String BOOLEAN = "BOOL";
	public static final String DATE = "DATE";
	public static final String TIME = "TIME";
	
	public static final String INTEGER = "INTEGER";
	public static final String TIMESTAMP = "TIMESTAMP";
	  
	/**
	 * 根据数据库类型获取对应的JAVA类型
	 * @param dataType
	 * @return
	 */
	public static String getJavaType(String dataType) {
		String javaType = String;
		if (dataType != null) {
			dataType = dataType.toUpperCase();
			if (dataType.contains(CHAR) || dataType.contains(TEXT) || dataType.contains(BLOB)) {
				javaType = String;
			} else if (dataType.contains(LONG) || dataType.contains(BIGINT)) {
				javaType = Long;
			} else if (dataType.contains(INT) || dataType.contains(BIT)) {
				javaType = Integer;
			}  else if (dataType.contains(FLOAT)) {
				javaType = Float;
			} else if (dataType.contains(NUMBER) || dataType.contains(DECIMAL) || dataType.contains(DOUBLE)) {
				javaType = Double;
			} else if (dataType.contains(BOOLEAN)) {
				javaType = Boolean;
			} else if (dataType.contains(DATE) || dataType.contains(TIME)) {
				javaType = Date;
			}
		}
		return javaType;
	}
	
	/**
	 * 根据数据库类型获取对应JdbcType
	 * @param dataType
	 * @return
	 */
	public static String getJdbcType(String dataType) {
		String jdbcType = dataType.toUpperCase();
		if (jdbcType.equalsIgnoreCase(INT)) {
			jdbcType = INTEGER;
		} else if(dataType.contains(DATE)) {
			jdbcType = TIMESTAMP;
		}
		return jdbcType;
	}

}
