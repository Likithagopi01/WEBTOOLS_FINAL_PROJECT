package com.zcars.app.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.zcars.app.model.Car;

@Repository
public class CarDAOImpl {

	private int cid = 1;
	private EntityManager entityManager;

	// set up constructor injection
	@Autowired
	public CarDAOImpl(EntityManager theEntityManager) {
		entityManager = theEntityManager;
	}

	@SuppressWarnings("rawtypes")
	public Car getCar(int carID) throws Exception {
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			Query query = currentSession.createQuery("SELECT c from Car c where Car_ID = :carID", Car.class);
			query.setParameter("carID", carID);
			Car car = (Car) query.uniqueResult();
			return car;
		} catch (Exception e) {
			throw new Exception("Owner's Car could not be retrieved", e);
		}
	}

	public Car saveCar(Car car) {
		Session currentSession = entityManager.unwrap(Session.class);
		car.setCarID(cid);
		car.setSTATUS("PENDING");
		currentSession.save(car);
		cid++;
		return car;
	}

	@Transactional
	public Car deleteCar(Car car) {
		Session currentSession = entityManager.unwrap(Session.class);
		currentSession.remove(car);
		return car;
	}

	// To Fetch the Properties owned by a particular Owner inside Manage Properties
	public List<Car> getOwnerCarList(String username) throws Exception, Exception {
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			Query<Car> query = currentSession.createQuery("SELECT c from Car c where owner = :username", Car.class);
			query.setParameter("username", username);
			List<Car> carList = query.getResultList();
			return carList;
		} catch (HibernateException e) {
			throw new Exception("Owner's Properties could not be retrieved" + username, e);
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public int updateCarByOwner(int carID, String model, String type, String cost) throws Exception {
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			Query<Car> query = currentSession.createQuery(
					"UPDATE Car c SET c.carModel = :model, c.carType = :carType, c.carCost =:carCost  WHERE Car_ID = :carID");
			query.setParameter("carID", carID);
			query.setParameter("model", model);
			query.setParameter("carType", type);
			query.setParameter("carCost", cost);
			int result = query.executeUpdate();

			return result;
		} catch (HibernateException e) {
			throw new Exception("Could not update the organizations", e);
		}
	}
}
