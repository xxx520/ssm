package controller;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import base.BaseControllerTest;

/**
 * 用户相关接口测试
 * @author Administrator
 *
 */
public class UserControllerTest extends BaseControllerTest{
	
//	@Test
	public void testLogin(){
		String uri="/ops-manage/xboot/login";
		Map<String, String>params=new HashMap<String, String>();
		params.put( "username", "admin");
		params.put( "password", "123456");
		params.put( "saveLogin", "true");
		String content = postString(uri, params,ContentType_form);
		System.out.println(content);
	}
	@Test
	public void testLogin2(){
		System.out.println(1234);
//		try {
//			String content = login( "admin",  "123456");
//			System.out.println(content);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
}
