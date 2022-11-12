package com.zcars.app.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zcars.app.DAO.CarDAOImpl;
import com.zcars.app.model.Car;
import com.zcars.app.service.CarService;

@Service
public class CarServiceImpl implements CarService {

	private CarDAOImpl carDAOImpl;

	public CarServiceImpl(CarDAOImpl carDAO) {
		super();
		this.carDAOImpl = carDAO;
	}

	public Car getCar(int carID) throws Exception {
		return carDAOImpl.getCar(carID);

	}

	
	public Car saveCar(Car car) {
		return carDAOImpl.saveCar(car);
	}

	
	public List<Car> getOwnerCarList(String username) throws Exception {
		return carDAOImpl.getOwnerCarList(username);

	}

	
	public Car deleteCar(Car car) {
		return carDAOImpl.deleteCar(car);

	}

	
	public int updateCarByOwner(int cid, String carAddress, String carType, String carCost) throws Exception {
		return carDAOImpl.updateCarByOwner(cid, carAddress, carType, carCost);
	}
}
