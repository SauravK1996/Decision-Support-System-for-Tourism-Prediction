package tourism.com.factory;

import tourism.com.impl.DatabaseDataOracleDao;
import tourism.com.impl.LoginDaoOracle;
import tourism.com.impl.UserDaoImplOracle;
import toursim.com.dao.DatabaseDataDao;
import toursim.com.dao.LoginDao;
import toursim.com.dao.UserDao;

public class DaoFactory {
	
	public static LoginDao loginDao;
	
	public static LoginDao getLoginDao(){
		if(loginDao == null){
			loginDao = new LoginDaoOracle();
		}
		return loginDao;
	}
	
	public static DatabaseDataDao databaseDataDao;
	public static DatabaseDataDao getDatabaseData(){
		if(databaseDataDao == null){
			databaseDataDao = new DatabaseDataOracleDao();
		}
		return databaseDataDao;
	}
	
	public static UserDao userDao;

	public static UserDao getUserDao(){
		if(userDao == null){
			return new UserDaoImplOracle();
		}
		
		return userDao;
	}
}
