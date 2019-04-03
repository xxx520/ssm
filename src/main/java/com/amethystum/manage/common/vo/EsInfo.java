package com.amethystum.manage.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author Amethystum
 */
@Data
public class EsInfo implements Serializable{

    private String cluster_name;

    private String status;

    private String number_of_nodes;

    private Integer count;
}
