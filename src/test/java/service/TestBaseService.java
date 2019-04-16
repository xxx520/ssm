package service;

import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.amethystum.manage.BootApplication;
import com.amethystum.manage.modules.api.dao.mapper.Demo2Mapper;
import com.amethystum.manage.modules.api.entity.Demo;
import com.amethystum.manage.modules.api.service.DemoService;
import com.amethystum.manage.modules.base.entity.Dict;
import com.amethystum.manage.modules.base.entity.Permission;
import com.amethystum.manage.modules.base.entity.Role;
import com.amethystum.manage.modules.base.entity.UserRole;
import com.amethystum.manage.modules.base.service.mybatis.IPermissionService;
import com.amethystum.manage.modules.base.service.mybatis.IUserRoleService;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.gson.Gson;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = BootApplication.class)
public class TestBaseService {

    @Autowired
    private DemoService DemoService;
    @Autowired
    private Demo2Mapper Demo2Mapper;
    @Autowired
    private com.amethystum.manage.modules.base.service.DictService DictService;

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

