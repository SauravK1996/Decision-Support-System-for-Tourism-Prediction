package tourism.com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import pojo.DatabaseData;
import tourism.com.dbConnection.DatabaseConnection;
import toursim.com.dao.DatabaseDataDao;

public class DatabaseDataOracleDao implements DatabaseDataDao {

	public DatabaseData databaseData(String spot,String month,int perdayperpersonbudget) {
		DatabaseData databaseData = null;
		
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<String> list2 = new ArrayList<String>();
		Connection con = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		
		
		try{
			con = DatabaseConnection.getConnection();
			
			String sql = "select * from tourist_spot where spotname =? ";
			String sql1 = "select spotname from tourist_spot where month=?";
			String sql2 = "select spotname from tourist_spot where budget<=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt1 = con.prepareStatement(sql1);
			pstmt2 = con.prepareStatement(sql2);
						
			pstmt.setString(1, spot);
			pstmt1.setString(1, month);
			pstmt2.setInt(1, perdayperpersonbudget);
			
			rs = pstmt.executeQuery();
			rs1 = pstmt1.executeQuery();
			rs2 = pstmt2.executeQuery();
			
			databaseData = new DatabaseData();
			
			if(rs.next()){
				String spotname = rs.getString("spotname");
				String spotmonth = rs.getString("month");
				int budget = rs.getInt("budget");
								
				databaseData.setSpot(spotname);
				databaseData.setBudget(budget);
				databaseData.setMonth(spotmonth);
				
			}
			while(rs1.next()){
				String sname = rs1.getString("spotname");
				list.add(sname);
				
			}
			databaseData.setMonthlist(list);
			
			while(rs2.next()){
				String sname = rs2.getString("spotname");
				list2.add(sname);
				
			}
			databaseData.setBudgetlist(list2);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				DatabaseConnection.closeConnection(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return databaseData;
	}

}
