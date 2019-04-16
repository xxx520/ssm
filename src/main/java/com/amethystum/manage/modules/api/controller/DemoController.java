package com.amethystum.manage.modules.api.controller;

import java.util.ArrayList;
import java.util.List;

import com.amethystum.manage.base.BaseController;
import com.amethystum.manage.common.annotation.BizCacheable;
import com.amethystum.manage.common.annotation.SystemLog;
import com.amethystum.manage.common.utils.PageUtil;
import com.amethystum.manage.common.utils.ResultUtil;
import com.amethystum.manage.common.vo.PageVo;
import com.amethystum.manage.common.vo.Result;
import com.amethystum.manage.modules.api.entity.Demo;
import com.amethystum.manage.modules.api.service.DemoService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author Amethystum
 */
@Slf4j
@RestController
@Api(description = "管理接口")
@RequestMapping("/api/demo")
@Transactional
public class DemoController extends BaseController<Demo, String>{

    @Autowired
    private DemoService demoService;

    @Override
    public DemoService getService() {
        return demoService;
    }

    @RequestMapping(value = "/test",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "for test unauth method")
    @SystemLog
    @BizCacheable(key="xxx",expireTime=1)
    public Result<List<Demo>> test(){
    	log.info( "test info method");
    	log.debug( "test debug method");
    	log.error( "test error method");
        return new ResultUtil<List<Demo>>().setData(new ArrayList<Demo>());
    }
    
}
