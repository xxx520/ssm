package service;

import java.util.Date;
import java.util.List;

import org.databene.contiperf.PerfTest;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import base.BaseServiceTest;
import com.amethystum.manage.modules.api.dao.mapper.Demo2Mapper;
import com.amethystum.manage.modules.api.entity.Demo;
import com.amethystum.manage.modules.api.service.DemoService;
import com.amethystum.manage.modules.base.entity.Dict;
import com.amethystum.manage.modules.base.entity.Role;
import com.amethystum.manage.modules.base.service.mybatis.IPermissionService;
import com.amethystum.manage.modules.base.service.mybatis.IUserRoleService;
import com.github.houbb.junitperf.core.annotation.JunitPerfConfig;
import com.google.gson.Gson;

public class TestBaseService extends BaseServiceTest{

    @Autowired
    private DemoService DemoService;
    @Autowired
    private Demo2Mapper Demo2Mapper;
    @Autowired
    private com.amethystum.manage.modules.base.service.DictService DictService;
    
  //10个线程 执行100次
    @Test
    @PerfTest(invocations = 100,threads = 10)
    public void test(){
        Long id = (long) (Math.random()*100);
        Demo demo = DemoService.get(id+"");
        System.out.println(new Gson().toJson(demo));
    }

    /**
     * 单一线程，执行 1000ms，默认以 html 输出测试结果
     * @throws InterruptedException if any
     */
    @Test
    @JunitPerfConfig(duration = 1000)
    public void helloWorldTest() throws InterruptedException {
        //This is what you want to test.
        System.out.println("hello world");
        Thread.sleep(20);
    }

//    @Test
//    public void testSave() {
//        List<Demo> all = DemoService.getAll();
//        Assert.assertEquals(all.size(), 0);
////        assertThat(detail.getName(), Matchers.is(employeeDao.save(employee).getDetail().getName()));;
//    }
    @Test
    public void listDict() {
    	List<Dict> all = DictService.getAll();
    	System.out.println(new Gson().toJson(all));
    	Assert.assertNotEquals(all.size(), 0);
//        assertThat(detail.getName(), Matchers.is(employeeDao.save(employee).getDetail().getName()));;
    }
    
    @Test
    @Transactional //如需要回滚
    public void AddDict() {
    	Dict entity=new Dict();
    	entity.setCreateBy( "xxx");
    	entity.setCreateTime(new Date());
    	entity.setTitle( "dict");
    	entity=DictService.save(entity);
    	Assert.assertNotEquals(entity.getId(), "");
//        assertThat(detail.getName(), Matchers.is(employeeDao.save(employee).getDetail().getName()));;
    }
    
    @Autowired
    IPermissionService IPermissionService;
    
    @Autowired
    IUserRoleService IUserRoleService;
    @Test
    public void testCache(){
//    	List<Permission> list = IPermissionService.findByUserId( "123");
    	List<Role> list = IUserRoleService.findByUserId( "123");
    	System.out.println(list.size());
    }
    
    
    
}


