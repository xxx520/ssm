package com.amethystum.manage.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.concurrent.TimeUnit;

/**
 * 自定义redis缓存注解
 * 
 * @author Administrator
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD })
public @interface BizCacheable {
	
	String name() default ""; 

	String key() default ""; //要存储的key,默认是查询条件的第一个参数
	
	int expireTime() default 30;//默认30分钟
	
	TimeUnit unit() default TimeUnit.MINUTES;  //默认值是以分钟为单位
	
}

