package contact;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import pojo.User;
import tourism.com.factory.DaoFactory;
import toursim.com.dao.UserDao;


public class UserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao dao = DaoFactory.getUserDao();
		List<User> userList = dao.getAll();
		
		request.setAttribute("userList", userList);
		
		request.getRequestDispatcher("userslist.jsp").forward(request, response);
		
		
	}


}
