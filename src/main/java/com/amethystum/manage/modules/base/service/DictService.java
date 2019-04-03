package com.amethystum.manage.modules.base.service;

import com.amethystum.manage.base.BaseService;
import com.amethystum.manage.modules.base.entity.Dict;

import java.util.List;

/**
 * 字典接口
 * @author Amethystum
 */
public interface DictService extends BaseService<Dict,String> {

    /**
     * 排序获取全部
     * @return
     */
    List<Dict> findAllOrderBySortOrder();

    /**
     * 通过type获取
     * @param type
     * @return
     */
    Dict findByType(String type);

    /**
     * 模糊搜索
     * @param key
     * @return
     */
    List<Dict> findByTitleOrTypeLike(String key);
}