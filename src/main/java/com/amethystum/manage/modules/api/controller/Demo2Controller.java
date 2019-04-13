package com.amethystum.manage.modules.api.controller;

import java.util.ArrayList;
import java.util.List;

import com.amethystum.manage.base.MybatisBaseController;
import com.amethystum.manage.common.annotation.SystemLog;
import com.amethystum.manage.common.utils.ResultUtil;
import com.amethystum.manage.common.utils.SecurityUtil;
import com.amethystum.manage.common.vo.Result;
import com.amethystum.manage.modules.api.entity.Demo;
import com.amethystum.manage.modules.api.entity.Demo2;
import com.amethystum.manage.modules.api.service.mybatis.Demo2Service;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.gson.Gson;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author Amethystum
 */
@Slf4j
@RestController
@Api(description = "管理接口")
@RequestMapping("/api/demo2")
@Transactional
public class Demo2Controller extends MybatisBaseController<Demo2, String>{

    @Autowired
    private Demo2Service demo2Service;
    
    @Autowired
    SecurityUtil SecurityUtil;
    
    @Override
    public ServiceImpl<BaseMapper<Demo2>, Demo2> getService() {
        return (ServiceImpl<BaseMapper<Demo2>, Demo2>) demo2Service;
    }
    @RequestMapping(value = "/test",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "for test unauth method")
    @SystemLog
    public Result<List<Demo2>> test(){
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	Object principal = authentication.getPrincipal();
    	System.out.println(new Gson().toJson(principal));
    	log.info( "test info method");
    	log.debug( "test debug method");
    	log.error( "test error method");
        return new ResultUtil<List<Demo2>>().setData(getService().selectList(null));
    }
}
