package com.amethystum.manage.modules.base.service;


import com.amethystum.manage.base.BaseService;
import com.amethystum.manage.modules.base.entity.Role;

import java.util.List;

/**
 * 角色接口
 * @author Amethystum
 */
public interface RoleService extends BaseService<Role,String> {

    /**
     * 获取默认角色
     * @param defaultRole
     * @return
     */
    List<Role> findByDefaultRole(Boolean defaultRole);
}
