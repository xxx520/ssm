package com.amethystum.manage.modules.base.serviceimpl.elasticsearch;

import com.amethystum.manage.common.utils.DateUtil;
import com.amethystum.manage.common.vo.SearchVo;
import com.amethystum.manage.modules.base.dao.elasticsearch.EsLogDao;
import com.amethystum.manage.modules.base.entity.elasticsearch.EsLog;
import com.amethystum.manage.modules.base.service.elasticsearch.EsLogService;

import org.springframework.util.StringUtils;

import lombok.extern.slf4j.Slf4j;

import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Amethystum
 */
@Service
@Transactional
@Slf4j
public class EsLogServiceImpl implements EsLogService {

    @Autowired
    private EsLogDao logDao;

    @Override
    public EsLog saveLog(EsLog esLog) {

        return logDao.save(esLog);
    }

    @Override
    public void deleteLog(String id) {

        logDao.deleteById(id);
    }

    @Override
    public void deleteAll() {

        logDao.deleteAll();
    }
    @Override
    public Page<EsLog> findByConfition(Integer type, String key, SearchVo searchVo, Pageable pageable) {

        if(type==null&&StringUtils.isEmpty(key)&&StringUtils.isEmpty(searchVo.getStartDate())){
            // 无过滤条件获取全部
            return logDao.findAll(pageable);
        }else if(type!=null&&StringUtils.isEmpty(key)&&StringUtils.isEmpty(searchVo.getStartDate())){
            // 仅有type
            return logDao.findByLogType(type, pageable);
        }

        QueryBuilder qb;

        QueryBuilder qb0 = QueryBuilders.termQuery("logType", type);
        QueryBuilder qb1 = QueryBuilders.multiMatchQuery(key, "name", "requestUrl", "requestType","requestParam","username","ip","ipInfo");
        // 在有type条件下
        if(!StringUtils.isEmpty(key)&&StringUtils.isEmpty(searchVo.getStartDate())&&StringUtils.isEmpty(searchVo.getEndDate())){
            // 仅有key
            qb = QueryBuilders.boolQuery().must(qb0).must(qb1);
        }else if(StringUtils.isEmpty(key)&&!StringUtils.isEmpty(searchVo.getStartDate())&&!StringUtils.isEmpty(searchVo.getEndDate())){
            // 仅有时间范围
            Long start = DateUtil.parseDate(searchVo.getStartDate()).getTime();
            Long end = DateUtil.parseDate(searchVo.getEndDate()).getTime();
            QueryBuilder qb2 = QueryBuilders.rangeQuery("timeMillis").gte(start).lte(end);
            qb = QueryBuilders.boolQuery().must(qb0).must(qb2);
        }else{
            // 两者都有
        	Long start = DateUtil.parseDate(searchVo.getStartDate()).getTime();
            Long end = DateUtil.parseDate(searchVo.getEndDate()).getTime();
            QueryBuilder qb2 = QueryBuilders.rangeQuery("timeMillis").gte(start).lte(end);
            qb = QueryBuilders.boolQuery().must(qb0).must(qb1).must(qb2);
        }

        //多字段搜索
        return logDao.search(qb, pageable);
    }
}
