package com.amethystum.manage.modules.base.service;


import com.amethystum.manage.base.BaseService;
import com.amethystum.manage.common.vo.SearchVo;
import com.amethystum.manage.modules.base.entity.Log;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 日志接口
 * @author Amethystum
 */
public interface LogService extends BaseService<Log,String> {

    /**
     * 分页搜索获取日志
     * @param type
     * @param key
     * @param searchVo
     * @param pageable
     * @return
     */
    Page<Log> findByConfition(Integer type, String key, SearchVo searchVo, Pageable pageable);
    /**
     * 删除所有
     */
    void deleteAll();
}
