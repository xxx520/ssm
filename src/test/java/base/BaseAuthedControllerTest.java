package base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.security.SecurityProperties.Filter;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;

import com.amethystum.manage.BootApplication;
import com.google.gson.Gson;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = BootApplication.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@Rollback
@Transactional
@ActiveProfiles(profiles = "dev")
public class BaseAuthedControllerTest {
	 @Value("${boot.tologinurl}")
    private String tologinurl;
    @Value("${boot.loginurl}")
    private String loginurl;
    @Autowired
    protected TestRestTemplate restTemplate;

    @Autowired
    protected WebApplicationContext wac;

//    @Autowired
//    private Filter springSecurityFilterChain;
//
//    @Autowired
//    private Filter invoiceContextFilter;

    protected MockMvc mockMvc;

    protected MockHttpSession session;

    @PostConstruct
    public void setup() throws Exception {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(wac)
//                .addFilters(springSecurityFilterChain, invoiceContextFilter)
                .build();
        this.session = new MockHttpSession();
//        login();
        getLoginSession("testuser", "789456a");
    }
   protected void login() throws Exception {
        MvcResult result = this.mockMvc
                .perform(get("/login"))
                .andReturn();
        Assert.assertNotNull(result.getModelAndView());
    }
    /**
     * 获取登入信息session
     *
     * @return
     * @throws Exception
     */
    protected void getLoginSession(String name, String pwd) throws Exception {

        MvcResult result = this.mockMvc
                .perform(post("/xboot/common/userlogin").contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("username", name).param("password",pwd)
                        .param("verifiCode", "ABCD"))
//                .andExpect(status().isFound())
                .andReturn();
        int status = result.getResponse().getStatus();
        String contentAsString = result.getResponse().getContentAsString();
        System.out.println(contentAsString);
        MockHttpSession mockHttpSession = (MockHttpSession) result.getRequest().getSession();
        this.mockMvc
                .perform(get("/success").session(mockHttpSession))
//                .andExpect(status().isOk())
                 .andReturn();
                ;
        this.session = mockHttpSession;
    }
    @Test
    public void test(){
    	System.out.println(1234);
    }
}
