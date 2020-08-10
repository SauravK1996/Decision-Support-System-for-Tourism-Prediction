package tourism.com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pojo.User;
import tourism.com.dbConnection.DatabaseConnection;
import toursim.com.dao.LoginDao;

public class LoginDaoOracle implements LoginDao{

	public User validateUser(String loginId, String loginPassword) {
	
		User foundUser = null;
		
		Connection con = null;
		PreparedStatement  pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DatabaseConnection.getConnection();
			
			String sql = "select * from tourism_user where emailid = ? and password = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,loginId);
			pstmt.setString(2,loginPassword);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String fName = rs.getString("fname");
				String lName = rs.getString("lname");
				String emailid = rs.getString("emailid");
				long mobno  =rs.getLong("contact");
				String password = rs.getString("password");
				
				foundUser = new User();
				
				
				foundUser.setfName(fName);
				foundUser.setlName(lName);
				foundUser.setEmailid(emailid);
				foundUser.setMobno(mobno);
				foundUser.setPasword(password);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DatabaseConnection.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return foundUser;
		
		
	}

	
}
