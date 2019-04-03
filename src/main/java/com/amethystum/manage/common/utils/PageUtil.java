package com.amethystum.manage.common.utils;

import com.amethystum.manage.common.vo.PageVo;
import org.springframework.util.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;


/**
 * @author Amethystum
 */
public class PageUtil {

    public static Pageable initPage(PageVo page){

        Pageable pageable=null;
        int pageNumber=page.getPageNumber();
        int pageSize=page.getPageSize();
        String sort=page.getSort();
        String order=page.getOrder();

        if(pageNumber<1){
            pageNumber=1;
        }
        if(pageSize<1){
            pageSize=10;
        }
        if(!StringUtils.isEmpty(sort)) {
            Sort.Direction d;
            if(StringUtils.isEmpty(order)) {
                d = Sort.Direction.DESC;
            }else {
                d = Sort.Direction.valueOf(order.toUpperCase());
            }
            Sort s = new Sort(d,sort);
            pageable = PageRequest.of(pageNumber-1, pageSize,s);
        }else {
            pageable = PageRequest.of(pageNumber-1, pageSize);
        }
        return pageable;
    }
}
