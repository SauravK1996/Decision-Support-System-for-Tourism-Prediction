package tourism.com.processor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tourism.com.dbConnection.DatabaseConnection;

public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int usrid = Integer.parseInt(request.getParameter("id"));
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int r = 0;
		
		try{
			con = DatabaseConnection.getConnection();
			String sql = "delete from tourism_user where tourid = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, usrid);
			r = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				DatabaseConnection.closeConnection(con);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(r>0){
			request.getRequestDispatcher("userslist.jsp").forward(request, response);
		}
			
		
	}


}
