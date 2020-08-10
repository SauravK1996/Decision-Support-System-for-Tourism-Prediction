package tourism.com.processor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.User;
import tourism.com.factory.DaoFactory;
import toursim.com.dao.LoginDao;

public class LoginProcessor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginId = request.getParameter("userid");
		String loginPassword = request.getParameter("pwd");
		
		System.out.println(loginId);
		System.out.println(loginPassword);
		
		LoginDao dao = DaoFactory.getLoginDao();
		User user = dao.validateUser(loginId, loginPassword);
		
		/*System.out.println(user.getEmailid());
		System.out.println(user.getPasword());*/
		
		if(loginId.equals("admin") && loginPassword.equals("password")){
			HttpSession session = request.getSession();
			session.setAttribute("admin",loginId);
			response.sendRedirect("admin.jsp");
		}else if(user!=null){
			HttpSession session = request.getSession();
			session.setAttribute("user",user);
			response.sendRedirect("index.jsp");
		}else{
			request.getSession().setAttribute("errmsg", "Invalid username or password");
			response.sendRedirect("login.jsp");
		}
	}
}
