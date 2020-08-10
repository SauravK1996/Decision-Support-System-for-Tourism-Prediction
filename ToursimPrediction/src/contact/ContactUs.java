package contact;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Contact;
import tourism.com.dbConnection.DatabaseConnection;

public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = "";
		String email = "";
		String message = "";
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("contactus");
		
		Contact contactus =(Contact)obj;
		
		name = contactus.getName();
		email = contactus.getEmail();
		message = contactus.getMessage();
		
		System.out.println(name+" "+email+" "+message);
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int r = 0;
		
		try{
			con = DatabaseConnection.getConnection();
			String sql = "insert into contactustourism values(contactid.nextval,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			pstmt.setString(3,message);
			r  = pstmt.executeUpdate();
			System.out.println("record in contact us table updated = "+r);
			
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
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
