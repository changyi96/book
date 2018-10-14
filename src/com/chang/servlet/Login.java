package com.chang.servlet;

import com.chang.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//处理登录
public class Login extends HttpServlet {
	public Login() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String uname = req.getParameter("uname");
		String pwd = req.getParameter("pwd");

		UserDao userDao = new UserDao();
		boolean valid = userDao.isValid(uname, pwd);
		//响应处理结果
		if (valid) {
			resp.sendRedirect("/pages/admin/index.jsp");
		} else {
			req.setAttribute("error", "你的用户名或密码写错了");
			req.getRequestDispatcher("/pageslogin.jsp").forward(req, resp);
		}

	}
}
