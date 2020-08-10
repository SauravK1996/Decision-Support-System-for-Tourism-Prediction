package toursim.com.dao;

import pojo.User;


public interface LoginDao {
	User validateUser(String loginId, String loginPassword);
	
}
