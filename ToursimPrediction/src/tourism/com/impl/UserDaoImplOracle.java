package tourism.com.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pojo.User;
import tourism.com.dbConnection.DatabaseConnection;
import toursim.com.dao.UserDao;

public class UserDaoImplOracle implements UserDao{

	public List<User> getAll() {
		List<User> userList = new ArrayList<User>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			con = DatabaseConnection.getConnection();
			String sql = "select * from tourism_user";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				String fname = rs.getString("fname");
				String lname = rs.getString("lname");
				long mobno = rs.getLong("contact");
				String emailid = rs.getString("emailid");
				int usrid = rs.getInt("tourid");
							
				User user = new User();
				user.setfName(fname);
				user.setlName(lname);
				user.setEmailid(emailid);
				user.setMobno(mobno);
				user.setUsrid(usrid);	
				
				userList.add(user);
								
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				DatabaseConnection.closeConnection(con);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		System.out.println("userList = "+userList);
		return userList;
	}
}
