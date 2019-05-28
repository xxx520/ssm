package com.amethystum.manage.generator;

import com.amethystum.manage.generator.bean.EntityAttribute;
import com.amethystum.manage.generator.bean.EntityOfEntity;
import com.amethystum.manage.generator.util.DBUtil;
import com.google.gson.Gson;

import org.springframework.util.StringUtils;

import lombok.extern.slf4j.Slf4j;

import org.beetl.core.Configuration;
import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.core.resource.FileResourceLoader;

import java.io.Console;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Scanner;

/**
 * mybatis模板代码生成器
 * @author Amethystum
 */
@Slf4j
public class MybatisXGenerator {
    private static  String className = "Demo";
    private static  String description = "";
    private static  String author = "Amethystum";
    private static  String tablePre = "t_";
    private static  String primaryKeyType = "String";
    private static  String entityPackage = "com.amethystum.manage.modules.your.entity";
    private static  String daoPackage = "com.amethystum.manage.modules.your.dao";
    private static  String servicePackage = "com.amethystum.manage.modules.your.service";
    private static  String serviceImplPackage = "com.amethystum.manage.modules.your.serviceimpl";
    private static  String controllerPackage = "com.amethystum.manage.modules.your.controller";
    private static  String mapperXmlDir = "";
    
    private static String url="jdbc:mysql://localhost:3306/samp_db";
	private static String username="";
	private static String password="";
	private static String database="";
	private static String driver = "com.mysql.jdbc.Driver";
    
    static EntityOfEntity entity;
    static Properties type_mapping_properties=new Properties();
    static{
    	try {
			type_mapping_properties.load(MybatisXGenerator.class.getResourceAsStream( "type_mapping.properties"));
			System.out.println(new Gson().toJson(type_mapping_properties));
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    /**
     * 运行该主函数即可生成代码
     * @param args
     * @throws IOException
     */
    public static void main(String[] args) throws IOException {
    	className="Log";
    	className="KeystoneProject";
    	primaryKeyType="String";
    	tablePre="t_";
    	controllerPackage="com.amethystum.manage.modules.api.controller";
    	daoPackage="com.amethystum.manage.modules.api.dao.mapper";
    	entityPackage="com.amethystum.manage.modules.api.entity";
    	servicePackage="com.amethystum.manage.modules.api.service.mybatis";
    	serviceImplPackage="com.amethystum.manage.modules.api.serviceimpl.mybatis";
    	mapperXmlDir=System.getProperty("user.dir")+"/src/main/resources/mapper";
    	
    	database="ops-manage";
    	url="jdbc:mysql://localhost:3306/"+database;
    	username="root";
    	password="";
    	
        //模板路径
        String root = System.getProperty("user.dir")+"/src/main/java/com/amethystum/manage/generator/template/mybatis";
        FileResourceLoader resourceLoader = new FileResourceLoader(root,"utf-8");
        Configuration cfg = Configuration.defaultConfiguration();
        GroupTemplate gt = new GroupTemplate(resourceLoader, cfg);
        
        try {
			entity=initEntity();
			System.out.println(">>>javatypelist:"+entity.getJavaTypeList());
		} catch (SQLException e) {
			e.printStackTrace();
			return;
		}
        //生成代码
        generateCode(gt);

        //根据类名删除生成的代码
        //deleteCode(className);
    }

    /**
     * 生成代码
     * @param gt
     * @throws IOException
     */
    private static void generateCode(GroupTemplate gt) throws IOException{
    	Template entityTemplate = gt.getTemplate("entity.btl");
        Template daoTemplate = gt.getTemplate("dao.btl");
        Template serviceTemplate = gt.getTemplate("service.btl");
        Template serviceImplTemplate = gt.getTemplate("serviceImpl.btl");
        Template controllerTemplate = gt.getTemplate("controller.btl");
        Template mapperXmlTemplate = gt.getTemplate("mapper.btl");
        		
        //生成实体类代码
        String fileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(entityPackage) + "/" + className + ".java";
        //判断文件是否存在，文件存在需要输入yes continue
        File file=new File(fileUrl);
        if(file.exists()){
        	Scanner scanner = new Scanner(System.in);
        	String next = scanner.next();
        	if(!"yes".equals(next)){
        		System.out.println("文件已经存在，取消生成代码");
        		return;
        	}
        }
        genFileByTemplete(entityTemplate, entity, fileUrl);
//        genEntity(entityTemplate,entity);

        //生成dao代码
        fileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(daoPackage) + "/" +className + "Mapper.java";
        genFileByTemplete(daoTemplate, entity, fileUrl);

        //生成service代码
        fileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(servicePackage) + "/" + className + "Service.java";
        genFileByTemplete(serviceTemplate, entity, fileUrl);

        //生成serviceImpl代码
        String serviceImplFileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(serviceImplPackage) + "/" + className + "ServiceImpl.java";
        genFileByTemplete(serviceImplTemplate, entity, serviceImplFileUrl);

        //生成controller代码
        String controllerFileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(controllerPackage) + "/" + className + "Controller.java";
        genFileByTemplete(controllerTemplate, entity, controllerFileUrl);
        
        //生成mapper.xml代码
        String mapperXmlFileUrl = mapperXmlDir + "/" + className + "Mapper.xml";
        genFileByTemplete(mapperXmlTemplate, entity, mapperXmlFileUrl);
        
        log.info("生成代码成功！");
    }
    
    private static EntityOfEntity initEntity() throws SQLException {
    	EntityOfEntity entity=new EntityOfEntity();
        entity.setEntityPackage(entityPackage);
        entity.setDaoPackage(daoPackage);
        entity.setServicePackage(servicePackage);
        entity.setServiceImplPackage(serviceImplPackage);
        entity.setControllerPackage(controllerPackage);
        entity.setAuthor(author);
        entity.setClassName(className);
        entity.setTableName(tablePre+camel2Underline(className));
        entity.setClassNameLowerCase(first2LowerCase(className));
        entity.setDescription(description);
        entity.setPrimaryKeyType(primaryKeyType);
        System.out.println(">>>entity:"+new Gson().toJson(entity));
        DBUtil dbUtil = new DBUtil(url, username, password, database);
        List<Object[]> tableDesc = dbUtil.getTableDesc(entity.getTableName());
        initJavaTypeList(entity,tableDesc);
		return entity;
	}
    /**
     * 
     * 初始化对象属性列表
     * @param entity 
     * @param tableDesc name,type,length [ "id", "varchar", 32 ],
     */
	private static void initJavaTypeList(EntityOfEntity entity,
			List<Object[]> tableDesc) {
		StringBuilder bd=new StringBuilder();
		List<EntityAttribute> attrList=new ArrayList<EntityAttribute>();
		for(Object[] attrs:tableDesc){
			attrList.add(turnAttrs2Attr(attrs));
			bd.append(initJavaType(attrs));
		}
		entity.setJavaTypeList(bd.toString());
	}
	
	private static EntityAttribute turnAttrs2Attr(Object[] attrs) {
		EntityAttribute attr=new EntityAttribute();
		attr.setName(attrs[0]+"");
		
		return attr;
	}

	private static String initJavaType(Object[] attrs){
		StringBuilder bd=new StringBuilder();
		if("id".equals(attrs[0])){
			bd.append( "    @TableId\r\n");
		}
		bd.append( "    ").append("@ApiModelProperty(value = \"唯一标识\")").append( "\r\n");
		bd.append( "    private ").append(getJavaTypeBySQLType(attrs[1])).append( " "+underline2camel(attrs[0]+";")).append( "\r\n");
		bd.append( "\r\n");
		return bd.toString();
	}
	private static Object getJavaTypeBySQLType(Object sqlType){
		return type_mapping_properties.get((""+sqlType).toUpperCase());
	}
	private static void genFileByTemplete(Template template, EntityOfEntity entity,String fileUrl) throws IOException {
    	template.binding("entity",entity);
        String result = template.render();
        log.info(result);
        //创建文件
//        String daoFileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(daoPackage) + "/" +className + "Mapper.java";
        File daoFile = new File(fileUrl);
        File daoDir = daoFile.getParentFile();
        if (!daoDir.exists()) {
            daoDir.mkdirs();
        }
        daoFile.createNewFile();
        OutputStream out = new FileOutputStream(daoFile);
        template.renderTo(out);
	}

//	private static void genEntity(Template template, EntityOfEntity entity) throws IOException {
//    	template.binding("entity",entity);
//        String entityResult = template.render();
//        log.info(entityResult);
//        //创建文件
//        String entityFileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(entityPackage) + "/" + className + ".java";
//        File entityFile = new File(entityFileUrl);
//        File entityDir = entityFile.getParentFile();
//        if (!entityDir.exists()) {
//            entityDir.mkdirs();
//        }
//        if(!entityFile.exists()){
//            //实体类若存在则不重新生成
//            entityFile.createNewFile();
//            OutputStream out = new FileOutputStream(entityFile);
//            template.renderTo(out);
//        }
//	}

	/**
     * 删除指定类代码
     * @param className
     * @throws IOException
     */
    private static void deleteCode(String className) throws IOException{

        String entityFileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(entityPackage) + "/" +className+".java";
        File entityFile = new File(entityFileUrl);
        if(entityFile.exists()){
            entityFile.delete();
        }
        String daoFileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(daoPackage) + "/" +className+"Dao.java";
        File daoFile = new File(daoFileUrl);
        if(daoFile.exists()){
            daoFile.delete();
        }

        String serviceFileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(servicePackage) + "/" +className+"Service.java";
        File serviceFile = new File(serviceFileUrl);
        if(serviceFile.exists()){
            serviceFile.delete();
        }

        String serviceImplFileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(serviceImplPackage) + "/" +className+"ServiceImpl.java";
        File serviceImplFile = new File(serviceImplFileUrl);
        if(serviceImplFile.exists()){
            serviceImplFile.delete();
        }

        String controllerFileUrl = System.getProperty("user.dir")+"/src/main/java/"+ dotToLine(controllerPackage) + "/" +className+"Controller.java";
        File controllerFile = new File(controllerFileUrl);
        if(controllerFile.exists()){
            controllerFile.delete();
        }

        log.info("删除代码完毕！");
    }

    /**
     * 点转斜线
     * @param str
     * @return
     */
    public static String dotToLine(String str){
        return str.replace(".", "/");
    }

    /**
     * 驼峰法转下划线
     */
    public static String camel2Underline(String str) {
        if (StringUtils.isEmpty(str)) {
            return "";
        }
        if(str.length()==1){
            return str.toLowerCase();
        }
        StringBuffer sb = new StringBuffer();
        for(int i=1;i<str.length();i++){
            if(Character.isUpperCase(str.charAt(i))){
                sb.append("_"+Character.toLowerCase(str.charAt(i)));
            }else{
                sb.append(str.charAt(i));
            }
        }
        return (str.charAt(0)+sb.toString()).toLowerCase();
    }
    /**
     * 下划线转驼峰
     */
    public static String underline2camel(String str) {
    	if (StringUtils.isEmpty(str)) {
    		return "";
    	}
    	str=str.toLowerCase();
    	String[] split = str.split( "_");
    	StringBuilder bd=new StringBuilder();
    	for (int i = 0; i < split.length; i++) {
    		if(i==0){
    			bd.append(split[i]);
    		}else{
    			bd.append(firstChar2UpCase(split[i]));
    		}
    	}
    	return bd.toString();
    }
    public static String firstChar2UpCase(String str){
    	return (str.charAt(0)+"").toUpperCase()+str.substring(1);
    }
    /**
     * 首字母小写
     */
    public static String first2LowerCase(String str) {
        if (StringUtils.isEmpty(str)) {
            return "";
        }
        if(str.length()==1){
            return str.toLowerCase();
        }
        StringBuffer sb = new StringBuffer();
        sb.append(Character.toLowerCase(str.charAt(0)));
        sb.append(str.substring(1,str.length()));
        return sb.toString();
    }
}
