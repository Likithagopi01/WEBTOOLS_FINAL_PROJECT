package com.zcars.app.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zcars.app.DAO.AdminDAOImpl;
import com.zcars.app.model.Car;

@Service
public class AdminServiceImpl {

	private AdminDAOImpl adminDAOImpl;
	
	public AdminServiceImpl(AdminDAOImpl adminDAO) {
		super();
		this.adminDAOImpl = adminDAO;
	}

	public List<Car> listALLCars() throws Exception {
		return adminDAOImpl.listALLCars();
	}

	public int approveCar(int cid) throws Exception {
		return adminDAOImpl.approveCar(cid);
	}

	public int rejectCar(int cid) throws Exception {
		return adminDAOImpl.rejectCar(cid);
	}

}
