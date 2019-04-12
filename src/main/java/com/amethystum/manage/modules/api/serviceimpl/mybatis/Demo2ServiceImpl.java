package com.amethystum.manage.modules.api.serviceimpl.mybatis;

import com.amethystum.manage.modules.api.dao.mapper.Demo2Mapper;
import com.amethystum.manage.modules.api.entity.Demo2;
import com.amethystum.manage.modules.api.service.mybatis.Demo2Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;


/**
 * 接口实现
 * @author Amethystum
 */
@Service
public class Demo2ServiceImpl extends ServiceImpl<Demo2Mapper, Demo2> implements Demo2Service {
    @Autowired
    private Demo2Mapper demo2Mapper;
    
}