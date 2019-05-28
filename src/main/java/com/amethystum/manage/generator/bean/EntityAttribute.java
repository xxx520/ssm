package com.amethystum.manage.generator.bean;

import lombok.Data;

/**
 * 属性
 * @author Administrator
 *
 */
@Data
public class EntityAttribute {
	String name;
	String jdbcType;
	String javaType;
	String comment;
	int lenth;
	Object defaultValue;
	boolean isNull;
	boolean privateKey;
	boolean isUnique;
	
	
}
