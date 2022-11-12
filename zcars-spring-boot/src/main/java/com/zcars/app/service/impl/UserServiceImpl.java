package com.zcars.app.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zcars.app.DAO.UserDAOImpl;
import com.zcars.app.model.Car;
import com.zcars.app.model.User;
import com.zcars.app.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private UserDAOImpl userDAOImpl;

	public UserServiceImpl(UserDAOImpl userDAO) {
		super();
		this.userDAOImpl = userDAO;
	}

	@Override
	public User getUserByUserName(String username, String password) {
		if (username.equals("admin") && password.equals("admin") ){
			User user = new User();
			user.setUsername("admin");
			user.setPassword("admin");
			user.setUserRole("admin");
			return user;
		} else {
			return userDAOImpl.getUserByUserName(username);
		}
	}

	@Override
	public User saveUser(User user) {
		try {
			return userDAOImpl.save(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return new User();
		}
	}

	public List listModels() throws Exception {
		return (List) userDAOImpl.listModels();
	}

	public List<Car> getCarForUser(String cityName, String carType) throws Exception {
		return userDAOImpl.getCarForUser(cityName, carType);
	}

	public boolean checkPassword(User user, String password) {
		if(user.getPassword().equals(password)) {
			return true;
		} else {
			return false;
		}
	}

}
