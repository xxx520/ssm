package com.amethystum.manage.modules.base.controller.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.amethystum.manage.common.utils.ResultUtil;
import com.amethystum.manage.common.vo.Result;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Amethystum
 */
@Slf4j
@RestController
@Api(description = "Security相关接口")
@RequestMapping("/xboot/common")
@Transactional
public class SecurityController {

    @RequestMapping(value = "/needLogin",method = RequestMethod.GET)
    @ApiOperation(value = "没有登录")
    public Result<Object> needLogin(){

        return new ResultUtil<Object>().setErrorMsg(401, "您还未登录");
    }
//  	@Autowired
//      private AuthenticationManager authenticationManager;
//  	
//  	@RequestMapping(value="/userlogin",method = RequestMethod.POST)
//  	@ApiOperation(value = "没有登录")
//  	public Result customLoginAction(@RequestParam(defaultValue="") String username,
//  			 @RequestParam(defaultValue="") String password,
//  			 HttpServletRequest request){
//  		//
//  		username = username.trim();
//   
//  		if(username==null||username.isEmpty()||password==null||password.isEmpty())
//  		{
//  			return  new ResultUtil<Object>().setErrorMsg(403, "账号密码错误");		
//  		}
//  		
//  		UsernamePasswordAuthenticationToken authRequest = 
//  				new UsernamePasswordAuthenticationToken(username, password);
//  	    //
//  		try {
//  			Authentication authentication = authenticationManager.authenticate(authRequest);
//  	        SecurityContextHolder.getContext().setAuthentication(authentication);
//  	        
//  	    } catch (AuthenticationException ex) {
//  	    	return  new ResultUtil<Object>().setErrorMsg(403, "账号密码错误");
//  	    }
//  	    return  new ResultUtil<Object>().setData( "",  "成功");
//  	}
//  	
}
