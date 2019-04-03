package com.amethystum.manage.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author Amethystum
 */
@Data
public class City implements Serializable {

    String country;

    String province;

    String city;
}
