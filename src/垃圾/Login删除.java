//package 垃圾;
//
//import com.chang.dao.UserDao;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
////处理登录
//public class Login删除 extends HttpServlet {
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		//设置请求编码格式:
//		req.setCharacterEncoding("utf-8");
//		//设置响应编码格式
//		resp.setContentType("text/html;charset=utf-8");
//		//获取请求信息
//		String uname=req.getParameter("uname");
//		String pwd=req.getParameter("pwd");
//		System.out.println(uname+":"+pwd);
//		//处理请求信息
//		UserDao userDao = new UserDao();
//		boolean valid= userDao.isValid(uname,pwd);
//		//响应处理结果
//		if(valid){
////			req.getSession().setAttribute("user",uname);
//			//重定向
//			resp.sendRedirect("main.jsp");
//		}else{
//			//使用request对象实现不同Servlet的数据流转
//			//在jsp中使用request.getAttribute获取error值并输出
////			<% String error = (String)request.getAttribute("error");
////			if(error!=null && !"".equals(error)){
////            %>
////            <p style="color:red"><%=error%></p>
////            <%}%>
//			req.setAttribute("error", "用户名或密码错误");
//			//使用请求转发
//			req.getRequestDispatcher("main.jsp").forward(req, resp);
//			//return ;
//		}
//	}
//}
