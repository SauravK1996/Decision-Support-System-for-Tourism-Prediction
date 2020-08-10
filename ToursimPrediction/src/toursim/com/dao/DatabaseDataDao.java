package toursim.com.dao;

import pojo.DatabaseData;

public interface DatabaseDataDao {
	DatabaseData databaseData(String spot,String month,int perdayperpersonbudget);
}
