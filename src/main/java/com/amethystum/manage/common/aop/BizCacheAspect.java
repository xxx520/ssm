package com.amethystum.manage.common.aop;

import java.lang.reflect.Method;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.amethystum.manage.common.annotation.BizCacheable;
import com.google.gson.Gson;

@Component
@Aspect
public class BizCacheAspect {
	@Value("${boot.selfExpireTime}")
	private int selfExpireTime;
	
	@Autowired
    private RedisTemplate<Object, Object> redisTemplate;

	@Pointcut(value = "@annotation(com.amethystum.manage.common.annotation.BizCacheable)")
	public void getCache() {
	}

	@Around(value = "getCache()")
	public Object cache(ProceedingJoinPoint joinPoint) throws Throwable {
//		String cacheKey = getCacheableKey(joinPoint);
		MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
		Method method = methodSignature.getMethod();
		
		BizCacheable cacheable = method.getAnnotation(BizCacheable.class);
		String key = cacheable.key();
		String cacheKey= method.getName()+":"+key;
		Object proceed = null;
		if (!StringUtils.isEmpty(cacheKey)) {
			// 查询缓存
//			Class returnType = method.getReturnType();
			Object value = redisTemplate.opsForValue().get(cacheKey);
			if (null != value) {
				return  value;
			}
			proceed = joinPoint.proceed();
			redisTemplate.opsForValue().set(cacheKey, proceed,
					cacheable.expireTime()==0?selfExpireTime:cacheable.expireTime(),
					cacheable.unit());
			
		}
		return proceed;
	}
	
	public String getCacheableKey(ProceedingJoinPoint joinPoint) {
		MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
		Method method = methodSignature.getMethod();
		
		BizCacheable cacheable = method.getAnnotation(BizCacheable.class);
		cacheable.name();
		String key = cacheable.key();
		return method.getClass().getCanonicalName()+method.getName()+key;
//		Object[] args = joinPoint.getArgs();
//		return cacheKey+=args[0];
	}


}
