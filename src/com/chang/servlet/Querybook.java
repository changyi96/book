package com.chang.servlet;

import com.chang.dao.BookDao;
import com.chang.entity.Book;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class Querybook extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String bno=req.getParameter("bno");
		String bname=req.getParameter("bname");

		BookDao bookDao = new BookDao();
		List<Book> lb = new ArrayList<Book>();
		lb= bookDao.queryBook(bno,bname);
		if(lb!=null){
			req.setAttribute("lb",lb);
			req.getRequestDispatcher("/pages/admin/showbook.jsp").forward(req,resp);
		}
		else{
			req.setAttribute("error", "查询出错");
			req.getRequestDispatcher("/pages/admin/book.jsp").forward(req, resp);
		}

	}
}
