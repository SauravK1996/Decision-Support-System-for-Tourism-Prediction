package tourism.com.processor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.User;
import tourism.com.dbConnection.DatabaseConnection;




public class UserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			HttpSession newusersession = request.getSession();
			User newUser = (User)newusersession.getAttribute("newUserArise");
		
			String fname = newUser.getfName();
			String lname = newUser.getlName();
			String email = newUser.getEmailid();
			long contactno = newUser.getMobno();
			String password = newUser.getCpasword();
		
			
						
			Connection con = null;
			PreparedStatement pstmt = null;
			
			int r=0;
			try{
				con = DatabaseConnection.getConnection();
				String sql = "insert into tourism_user values(tourid.nextval,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,fname);
				pstmt.setString(2,lname);
				pstmt.setString(3,email);
				pstmt.setLong(4,contactno);
				pstmt.setString(5,password);
				
				r = pstmt.executeUpdate();
				
			}catch(SQLException e){
				e.printStackTrace();
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				try{
					DatabaseConnection.closeConnection(con);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			if(r>0)
				response.sendRedirect("login.jsp");
			else
				System.out.println("New user not inserted...");
	}

}
