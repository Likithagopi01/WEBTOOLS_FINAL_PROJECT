package com.zcars.app.service;

import com.zcars.app.model.User;


public interface UserService {

	User saveUser(User user);

	User getUserByUserName(String username, String password);
	
}
