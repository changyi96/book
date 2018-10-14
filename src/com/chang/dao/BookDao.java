package com.chang.dao;

import com.chang.entity.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
	//查询书籍
	public List<Book> queryBook(String bno, String bname){
		List<Book> lb = new ArrayList<Book>();

		DBConnection dbConnection = new DBConnection();
		Connection conn = dbConnection.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from book where bno=? and bname=?");
			stat.setString(1,bno);
			stat.setString(2,bname);
			ResultSet rs = stat.executeQuery();
			while(rs.next()){//如果rs有值的话
				Book book = new Book();
				book.setBno(rs.getString("bno"));
				book.setBname(rs.getString("bname"));
				book.setTname(rs.getString("tname"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getDouble("price"));
				book.setBrief(rs.getString("brief"));
				book.setTotal(rs.getInt("total"));
				book.setCdate(rs.getDate("cdate"));

				lb.add(book);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}finally {
			DBConnection.close(conn);
		}

		return lb;
	}
}
