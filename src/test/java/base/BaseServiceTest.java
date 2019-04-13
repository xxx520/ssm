package base;

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
public class BaseServiceTest {

    
}


