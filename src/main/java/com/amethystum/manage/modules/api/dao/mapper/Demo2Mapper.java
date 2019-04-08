package com.amethystum.manage.modules.api.dao.mapper;

import com.amethystum.manage.modules.api.entity.Demo;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Amethystum
 */
public interface Demo2Mapper extends BaseMapper<Demo> {

    /**
     * 通过用户id获取
     * @param userId
     * @return
     */
    List<Demo> findById(@Param("id") String id);
}
