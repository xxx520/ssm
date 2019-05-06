package com.amethystum.manage;

import org.beetl.ext.fn.Json;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import com.google.gson.Gson;

/**
 * @author Amethystum
 */
@SpringBootApplication
//启用JPA审计
@EnableJpaAuditing
//启用缓存
@EnableCaching
public class BootApplication {
	private static ConfigurableApplicationContext context=null;
	static{
		System.out.println("@@@Boot Application::::");
	}
	{
		System.out.println("@@@Boot Application init()");
		System.out.println(new Gson().toJson(this));
	}
    public static ApplicationContext getContext(){
    	return context;
    }
	public static void main(String[] args) {
		System.out.println("@@@main method!");
        context = SpringApplication.run(BootApplication.class, args);
//        SpringApplication.
    }
    
}
