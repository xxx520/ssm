package com.amethystum.manage.modules.base.dao;

import com.amethystum.manage.base.BaseDao;
import com.amethystum.manage.modules.base.entity.QuartzJob;

import java.util.List;

/**
 * 定时任务数据处理层
 * @author Amethystum
 */
public interface QuartzJobDao extends BaseDao<QuartzJob,String> {

    /**
     * 通过类名获取
     * @param jobClassName
     * @return
     */
    List<QuartzJob> findByJobClassName(String jobClassName);
}