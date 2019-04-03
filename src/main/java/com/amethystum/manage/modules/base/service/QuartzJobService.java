package com.amethystum.manage.modules.base.service;

import com.amethystum.manage.base.BaseService;
import com.amethystum.manage.modules.base.entity.QuartzJob;

import java.util.List;

/**
 * 定时任务接口
 * @author Amethystum
 */
public interface QuartzJobService extends BaseService<QuartzJob,String> {

    /**
     * 通过类名获取
     * @param jobClassName
     * @return
     */
    List<QuartzJob> findByJobClassName(String jobClassName);
}