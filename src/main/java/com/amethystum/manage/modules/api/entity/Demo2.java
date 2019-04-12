package com.amethystum.manage.modules.api.entity;

import com.amethystum.manage.base.BaseEntity;
import com.amethystum.manage.common.utils.UUIdUtil;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.TableId;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Amethystum
 */
@Data
@Entity
@Table(name = "t_demo2")
@TableName("t_demo2")
@ApiModel(value = "")
public class Demo2{

    private static final long serialVersionUID = 1L;
    @Id
    @TableId
    @ApiModelProperty(value = "唯一标识")
    private String id = UUIdUtil.getUUid();

}