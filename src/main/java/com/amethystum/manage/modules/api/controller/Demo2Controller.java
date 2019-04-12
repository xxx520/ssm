package com.amethystum.manage.modules.api.controller;

import com.amethystum.manage.base.MybatisBaseController;
import com.amethystum.manage.modules.api.entity.Demo2;
import com.amethystum.manage.modules.api.service.mybatis.Demo2Service;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
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
@RequestMapping("/api/demo2")
@Transactional
public class Demo2Controller extends MybatisBaseController<Demo2, String>{

    @Autowired
    private Demo2Service demo2Service;

    @Override
    public ServiceImpl<BaseMapper<Demo2>, Demo2> getService() {
        return (ServiceImpl<BaseMapper<Demo2>, Demo2>) demo2Service;
    }

}
