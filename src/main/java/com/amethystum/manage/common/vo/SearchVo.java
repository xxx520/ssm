package com.amethystum.manage.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author Amethystum
 */
@Data
public class SearchVo implements Serializable {

    private String startDate;

    private String endDate;
}
