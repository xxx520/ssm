package com.amethystum.manage.modules.base.serviceimpl.mybatis;

import com.amethystum.manage.modules.base.dao.mapper.UserRoleMapper;
import com.amethystum.manage.modules.base.entity.Role;
import com.amethystum.manage.modules.base.entity.UserRole;
import com.amethystum.manage.modules.base.service.mybatis.IUserRoleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Amethystum
 */
@Service
public class IUserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public List<Role> findByUserId(String userId) {

        return userRoleMapper.findByUserId(userId);
    }

    @Override
    public List<String> findDepIdsByUserId(String userId) {

        return userRoleMapper.findDepIdsByUserId(userId);
    }
}
