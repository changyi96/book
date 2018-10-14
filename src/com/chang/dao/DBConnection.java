package com.chang.dao;

import java.sql.*;

public class DBConnection {
	public static final String DBDRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String DBURL = "jdbc:mysql://localhost:3306/book?useSSL=false&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	public static final String DBUSER = "root";
	public static final String DBPASSWORD = "admin";

	public DBConnection() {
		try {
			//1，加载数据库驱动
			Class.forName(DBDRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	//获取数据库连接
	public static Connection getConnection() {
		Connection conn = null;
		try {
			//2,创建数据库连接
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	//关闭数据库连接
	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}