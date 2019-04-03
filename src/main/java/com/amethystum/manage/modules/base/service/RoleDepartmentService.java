package com.amethystum.manage.modules.base.service;

import com.amethystum.manage.base.BaseService;
import com.amethystum.manage.modules.base.entity.RoleDepartment;

import java.util.List;

/**
 * 角色部门接口
 * @author Amethystum
 */
public interface RoleDepartmentService extends BaseService<RoleDepartment,String> {

    /**
     * 通过roleId获取
     * @param roleId
     * @return
     */
    List<RoleDepartment> findByRoleId(String roleId);

    /**
     * 通过角色id删除
     * @param roleId
     */
    void deleteByRoleId(String roleId);

    /**
     * 通过角色id删除
     * @param departmentId
     */
    void deleteByDepartmentId(String departmentId);
}