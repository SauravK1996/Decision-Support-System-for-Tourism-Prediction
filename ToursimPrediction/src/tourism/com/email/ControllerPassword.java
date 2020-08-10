package tourism.com.email;



import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.User;
import tourism.com.dbConnection.DatabaseConnection;




public class ControllerPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession emailrecover = request.getSession();
		String userEmail = (String)emailrecover.getAttribute("emailrecover");
		
		System.out.println("userEmail "+userEmail);
		
		HttpSession newpwd = request.getSession();
		User userPwd = (User)newpwd.getAttribute("newpwd");
		String password = userPwd.getCpasword();
		
		System.out.println("new password "+password);
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int result=0;
		try{
			con = DatabaseConnection.getConnection();
			String sql2 = "update tourism_user set password = ? where emailid = ?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, password);
			pstmt.setString(2, userEmail);
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				DatabaseConnection.closeConnection(con);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(result == 1){
			request.getSession().setAttribute("msg", "Your password has been successfully changed. Please login again.");
			response.sendRedirect("login.jsp");
			
		}else{
			System.out.println("Result not updated");
		}
		
	}
    	
}
