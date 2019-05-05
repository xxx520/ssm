package base;


import org.junit.Rule;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.amethystum.manage.BootApplication;
import com.github.houbb.junitperf.core.rule.JunitPerfRule;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = BootApplication.class)
public class BaseServiceTest {
	@Rule
    public JunitPerfRule junitPerfRule = new JunitPerfRule();
    
}


