package com.amethystum.manage.modules.base.dao;

import com.amethystum.manage.base.BaseDao;
import com.amethystum.manage.modules.base.entity.Role;

import java.util.List;

/**
 * 角色数据处理层
 * @author Amethystum
 */
public interface RoleDao extends BaseDao<Role,String> {

    /**
     * 获取默认角色
     * @param defaultRole
     * @return
     */
    List<Role> findByDefaultRole(Boolean defaultRole);
}
