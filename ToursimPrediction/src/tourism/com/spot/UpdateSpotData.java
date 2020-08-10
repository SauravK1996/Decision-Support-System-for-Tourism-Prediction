package tourism.com.spot;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tourism.com.dbConnection.DatabaseConnection;

public class UpdateSpotData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String spotname  = request.getParameter("spot");
		String month = request.getParameter("month");
		int budget = Integer.parseInt(request.getParameter("budget"));
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int r = 0;
		
		try{
			
			con = DatabaseConnection.getConnection();
			String sql = "update tourist_spot set budget = ?, month = ? where spotname = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,budget);
			pstmt.setString(2,month);
			pstmt.setString(3,spotname);
			r = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				DatabaseConnection.closeConnection(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(r>0){
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
	}

}
