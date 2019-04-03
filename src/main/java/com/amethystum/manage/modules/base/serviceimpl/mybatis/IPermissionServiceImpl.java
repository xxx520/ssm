package com.amethystum.manage.modules.base.serviceimpl.mybatis;

import com.amethystum.manage.modules.base.dao.mapper.PermissionMapper;
import com.amethystum.manage.modules.base.entity.Permission;
import com.amethystum.manage.modules.base.service.mybatis.IPermissionService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Amethystum
 */
@Service
public class IPermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

    @Autowired
    private PermissionMapper permissionMapper; ;

    @Override
    public List<Permission> findByUserId(String userId) {

        return permissionMapper.findByUserId(userId);
    }
}
