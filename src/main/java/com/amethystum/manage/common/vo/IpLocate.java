package com.amethystum.manage.common.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author Amethystum
 */
@Data
public class IpLocate implements Serializable {

    private String retCode;

    private City result;
}

