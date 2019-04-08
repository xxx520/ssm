package service;

import java.util.List;

import org.hamcrest.Matchers;
import org.json.JSONObject;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.amethystum.manage.BootApplication;
import com.amethystum.manage.modules.api.entity.Demo;
import com.amethystum.manage.modules.api.service.DemoService;
import com.amethystum.manage.modules.base.entity.Dict;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = BootApplication.class)
//@DataJpaTest
//// 加入 AutoConfigureTestDatabase 注解
//@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class DemoServiceTest {

    @Autowired
    private DemoService DemoService;
    @Autowired
    private com.amethystum.manage.modules.base.service.DictService DictService;

//    @Test
//    public void testSave() {
//        List<Demo> all = DemoService.getAll();
//        Assert.assertEquals(all.size(), 0);
////        assertThat(detail.getName(), Matchers.is(employeeDao.save(employee).getDetail().getName()));;
//    }
    @Test
    public void testDict() {
    	List<Dict> all = DictService.getAll();
    	System.out.println(new Gson().toJson(all));
    	Assert.assertNotEquals(all.size(), 0);
//        assertThat(detail.getName(), Matchers.is(employeeDao.save(employee).getDetail().getName()));;
    }
}


