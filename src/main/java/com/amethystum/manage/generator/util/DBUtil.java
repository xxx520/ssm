package com.amethystum.manage.generator.util;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.mysql.jdbc.Connection;

/**
 * 
 * @author Administrator
 *
 */
public class DBUtil {
	private String url="jdbc:mysql://localhost:3306/samp_db";
	private String username="";
	private String password="";
	private String database="";
	private String driver = "com.mysql.jdbc.Driver";
	
	public DBUtil(String url,String username,String password,String database){
		this.url=url;
		this.username=username;
		this.password=password;
		this.database=database;
	}
	public void init(){
		
	}
	private Connection getConn() {
	    Connection conn = null;
	    try {
	        Class.forName(driver); //classLoader,加载对应驱动
	        conn = (Connection) DriverManager.getConnection(url, username, password);
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return conn;
	}
	
	/**
	 * 获取table description
	 * @param tableName
	 * @return
	 * @throws SQLException
	 */
	public List<Object[]> getTableDesc(String tableName) throws SQLException {  
        List<Object[]> list = new ArrayList<Object[]>();  
        Connection conn = this.getConn();  
        String sql = "select column_name as 'name',data_type as 'type',ifnull(character_maximum_length,0) as 'lenth',ifnull(COLUMN_COMMENT,'') as 'comment' from information_schema.columns where"
        		+ " TABLE_SCHEMA = '"+this.database+"'and table_name = ?";  
        PreparedStatement ps = conn.prepareStatement(sql);  
        ps.setString(1, tableName);  
        ResultSet rs = ps.executeQuery(); 
        boolean isEmpty=true;
        while (rs.next()) {  
        	isEmpty=false;
        	Object[] info = new Object[4];
        	info[0]=rs.getString(1);
        	info[1]=rs.getString(2);
        	info[2]=rs.getObject(3);
        	info[3]=rs.getObject(4);
            list.add(info);  
        }
        if(isEmpty){
        	System.out.println("找不到属性值！！");
        }
        System.out.println(">>>jdbctypelist:"+new Gson().toJson(list));
        return list;  
    }  
	
	public static void main(String[] args) {
		String url="jdbc:mysql://localhost:3306/ops-manage";
		String username="root";
		String password="";
		DBUtil util=new DBUtil(url, username, password,"ops-manage");
		try {
			System.out.println(new Gson().toJson(util.getTableDesc( "t_user")));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
