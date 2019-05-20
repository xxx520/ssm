package com.amethystum.manage.generator.bean;

import java.util.List;

import lombok.Data;

/**
 * @author Amethystum
 */
@Data
public class EntityOfEntity {

    private String entityPackage;

    private String daoPackage;

    private String servicePackage;

    private String serviceImplPackage;

    private String controllerPackage;

    private String author;

    private String className;

    private String classNameLowerCase;

    private String tableName;

    private String description;

    private String primaryKeyType;
    
    List<EntityAttribute> attributes;
    /**
     * 对于java属性列表
     */
    private String javaTypeList;
}
