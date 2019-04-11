package com.amethystum.manage.base;

import com.amethystum.manage.common.utils.ResultUtil;
import com.amethystum.manage.common.vo.Result;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.Serializable;
import java.util.List;

/**
 * @author Amethystum
 */
public abstract class MybatisBaseController<E, ID extends Serializable> {

	
    /**
     * 获取service
     * @return
     */
    @Autowired
    public abstract ServiceImpl<BaseMapper<E>, E> getService();

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "通过id获取")
    public Result<E> get(@PathVariable ID id){

        E entity = getService().selectById(id);
        return new ResultUtil<E>().setData(entity);
    }

    @RequestMapping(value = "",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取全部数据")
    public Result<List<E>> getAll(){
    	
        List<E> list = getService().selectList(null);
        return new ResultUtil<List<E>>().setData(list);
    }


    @RequestMapping(value = "",method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "保存数据")
    public Result<E> save(@ModelAttribute E entity){

        getService().insert(entity);
        return new ResultUtil<E>().setData(entity);
    }

    @RequestMapping(value = "",method = RequestMethod.PUT)
    @ResponseBody
    @ApiOperation(value = "更新数据")
    public Result<E> update(@ModelAttribute E entity){

        getService().updateById(entity);
        return new ResultUtil<E>().setData(entity);
    }

    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@PathVariable ID[] ids){

        for(ID id:ids){
            getService().deleteById(id);
        }
        return new ResultUtil<Object>().setSuccessMsg("批量通过id删除数据成功");
    }
}
