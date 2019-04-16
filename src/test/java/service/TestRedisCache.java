package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.amethystum.manage.common.annotation.BizCacheable;

public class TestRedisCache extends TestBaseService{
	
	
	@Test
	public void testCache(){
		System.out.println(132);
		List list = getList();
		System.out.println(list);
	}
	
	@BizCacheable
	public List getList(){
		Map<String, Object>entity=new HashMap<String, Object>();
		
		List list=new ArrayList();
		list.add(entity);
		return list;
	}
}
