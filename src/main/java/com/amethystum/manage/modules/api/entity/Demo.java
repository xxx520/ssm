package com.amethystum.manage.modules.api.entity;

import com.amethystum.manage.base.BaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Amethystum
 */
@Data
@Entity
@Table(name = "t_demo")
@TableName("t_demo")
@ApiModel(value = "")
public class Demo extends BaseEntity {

    private static final long serialVersionUID = 1L;

}