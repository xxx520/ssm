package com.amethystum.manage.modules.base.dao;

import com.amethystum.manage.base.BaseDao;
import com.amethystum.manage.modules.base.entity.DictData;

import java.util.List;

/**
 * 字典数据数据处理层
 * @author Amethystum
 */
public interface DictDataDao extends BaseDao<DictData,String> {


    /**
     * 通过dictId和状态获取
     * @param dictId
     * @param status
     * @return
     */
    List<DictData> findByDictIdAndStatusOrderBySortOrder(String dictId, Integer status);

    /**
     * 通过dictId删除
     * @param dictId
     */
    void deleteByDictId(String dictId);
}