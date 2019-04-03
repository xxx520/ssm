package com.amethystum.manage.modules.base.controller.manage;

import com.amethystum.manage.common.utils.HttpUtil;
import com.amethystum.manage.common.utils.ResultUtil;
import com.amethystum.manage.common.vo.EsCount;
import com.amethystum.manage.common.vo.EsInfo;
import com.amethystum.manage.common.vo.Result;
import com.amethystum.manage.common.exception.XbootException;

import org.springframework.util.StringUtils;

import com.google.gson.Gson;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;


/**
 * @author Amethystum
 */
@Slf4j
@RestController
@Api(description = "Elasticsearch信息接口")
@RequestMapping("/xboot/es")
@Transactional
public class EsController {

    @Value("${xboot.elasticsearch.nodeClient}")
    private String ES_NODE_CLIENT;

    @RequestMapping(value = "/info",method = RequestMethod.GET)
    @ApiOperation(value = "获取es状态")
    public Result<EsInfo> getAllByPage(){

        String healthUrl="http://"+ES_NODE_CLIENT+"/_cluster/health";
        String countUrl="http://"+ES_NODE_CLIENT+"/_count";
        String healthResult= HttpUtil.sendHttpGet(healthUrl);
        String countResult=HttpUtil.sendHttpGet(countUrl);
        if(StringUtils.isEmpty(healthResult)||StringUtils.isEmpty(countResult)){
            throw new XbootException("连接ES失败，请检查ES运行状态");
        }
        EsInfo esInfo=new EsInfo();
        EsCount esCount=new EsCount();
        try {
            esInfo=new Gson().fromJson(healthResult,EsInfo.class);
            esCount=new Gson().fromJson(countResult,EsCount.class);
            esInfo.setCount(esCount.getCount());
        }catch (Exception e){
            e.printStackTrace();
            throw new XbootException("获取ES信息出错");
        }
        return new ResultUtil<EsInfo>().setData(esInfo);
    }
}
