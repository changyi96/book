package com.chang.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//定义UserDao类是用来访问数据库
public class UserDao {
	//验证用户名
	public boolean isValid(String uname,String pwd){
		boolean valid = false;

		DBConnection dbConnection = new DBConnection();
		Connection conn = dbConnection.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from admin where aname=? and password=?");
			stat.setString(1,uname);
			stat.setString(2,pwd);
			ResultSet rs = stat.executeQuery();
			if(rs.next()){//如果rs有值的话
				valid = true;
			}
		}catch (SQLException e){
			e.printStackTrace();
		}finally {
			DBConnection.close(conn);
		}

		return valid;
	}
}
