package controller;

import java.util.HashMap;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.transaction.annotation.Transactional;

import base.BaseControllerTest;

import com.amethystum.manage.common.vo.Result;
import com.google.gson.Gson;


public class DemoControllerTest extends BaseControllerTest{
	@Test
	@Transactional
	public void testDemo(){
		Map<String, String> params = new HashMap<>();
    	String uri = "/api/demo2/test";
		try {
			
			mockLogin( "admin", "123456");
			String content = getString(uri, params);
			System.out.println(content);
			Result result = new Gson().fromJson(content, Result.class);
			Assert.assertTrue("成功", result.getCode()==200);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void testDict(){
		Map<String, String> params = new HashMap<>();
		String uri = "/xboot/dict/getAll";
		try {
			String content = getString(uri, params);
			System.out.println(content);
			Result result = new Gson().fromJson(content, Result.class);
			Assert.assertTrue("成功", result.getCode()==200);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
