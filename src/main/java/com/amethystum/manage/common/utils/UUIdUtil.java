package com.amethystum.manage.common.utils;

import java.util.UUID;

public class UUIdUtil {
	
	public static String getUUid(){
		return UUID.randomUUID().toString().replaceAll( "-", "");
	}
	
	public static void main(String[] args) {
		System.out.println(getUUid());
	}
}
