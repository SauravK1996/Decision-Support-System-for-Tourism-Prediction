package tourism.com.spot;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.NewPlace;
import tourism.com.dbConnection.DatabaseConnection;

public class AddNewPlace extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("newplace");
		
		NewPlace newPlace =(NewPlace)obj;
		
		String spotname = newPlace.getSpotname();
		String month = newPlace.getMonth();
		int budget = newPlace.getBudget();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int r = 0;
		
		try{
			con = DatabaseConnection.getConnection();
			String sql = "insert into tourist_spot values(spotid.nextval,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,spotname);
			pstmt.setString(2,month);
			pstmt.setInt(3,budget);
			r  = pstmt.executeUpdate();
			System.out.println("record in tourist_spot table updated = "+r);
			
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
