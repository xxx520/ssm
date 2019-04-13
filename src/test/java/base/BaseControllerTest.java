package base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.junit.Assert;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
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
@SpringBootTest(classes=BootApplication.class)
public class BaseControllerTest {
	 @Value("${boot.tologinurl}")
    private String tologinurl;
    @Value("${boot.loginurl}")
    private String loginurl;
	protected MockMvc mockMvc;
	public static final String  ContentType_json="json";
	public static final String  ContentType_html="html";
	public static final String  ContentType_text="text";
	public static final String  ContentType_xml="xml";
	public static final String  ContentType_file="file";
	public static final String  ContentType_form="form";
	
	
	 @Autowired  
    private WebApplicationContext wac; // 注入WebApplicationContext  
	
	 @Before // 在测试开始前初始化工作  
    public void setup() {  
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();  
        
    }  
	
 /**
  * 模拟登陆
  * @param username
  * @param password
  */
	protected void mockLogin(String username,String password){
		List<GrantedAuthority> authorities = new ArrayList<>();
		User principal = new User(username, "", authorities);
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(principal, null, authorities);
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}
	 
    protected String postString(String uri,Map<String, String>  params){
    	return postString(uri, turnMap2MultiMap(params),ContentType_json);
    }
    protected String postString(String uri,Map<String, String>  params,String contentType){
    	return postString(uri, turnMap2MultiMap(params),contentType);
    }

	protected String postString(String uri,MultiValueMap<String, String>  params,String ContentType){
    	MvcResult mvcResult;
  		try {
  			//序列化 post params
  			mvcResult = mockMvc.perform(
  					MockMvcRequestBuilders.post(uri).params(params).accept(getContentType(ContentType))).andReturn();
  			System.out.println(new Gson().toJson(mvcResult.getResponse()));
  			int status = mvcResult.getResponse().getStatus();
  			Assert.assertTrue("成功", status==200);
  			String content = mvcResult.getResponse().getContentAsString();
  			return content;
  		}catch(Exception e){
  			e.printStackTrace();
  		}
     	return null;
    }
    protected String getString(String uri,Map<String, String> params){
    	return getString(uri, turnMap2MultiMap(params),ContentType_json);
    }
    protected String getString(String uri,Map<String, String> params,String contentType){
    	return getString(uri, turnMap2MultiMap(params),contentType);
    }
    protected String getString(String uri,MultiValueMap<String, String> params,String contentType){
    	 MvcResult mvcResult;
 		try {
 			mvcResult = mockMvc.perform(
 					MockMvcRequestBuilders.get(uri).params(params).accept(getContentType(contentType))).andReturn();
 			int status = mvcResult.getResponse().getStatus();
 			Assert.assertTrue("成功", status==200);
 			String content = mvcResult.getResponse().getContentAsString();
 			return content;
 		}catch(Exception e){
 			e.printStackTrace();
 		}
    	return null;
    }
    
    private MultiValueMap<String, String> turnMap2MultiMap(Map<String, String> params) {
    	MultiValueMap<String, String> params2 = new LinkedMultiValueMap<>();
    	Set<Entry<String, String>> entrySet = params.entrySet();
    	for (Entry<String, String> en:entrySet) {
    		List<String> list=new ArrayList<String>();
    		list.add(en.getValue());
    		params2.put(en.getKey(),list);
		}
		return params2;
	}
    
	private MediaType getContentType(String contentType) {
		switch (contentType) {
		case ContentType_json:
			return MediaType.APPLICATION_JSON_UTF8;
		case ContentType_html:
			return MediaType.TEXT_HTML;
		case ContentType_text:
			return MediaType.APPLICATION_JSON_UTF8;
		case ContentType_xml:
			return MediaType.APPLICATION_XML;
		case ContentType_form:
			return MediaType.APPLICATION_FORM_URLENCODED;
		}
		
		return null;
	}
	
}
