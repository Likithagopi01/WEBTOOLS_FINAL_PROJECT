package com.zcars.app.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.zcars.app.model.Car;

import org.hibernate.query.Query;

@Repository
public class AdminDAOImpl {

	private EntityManager entityManager;

	@Autowired
	public AdminDAOImpl(EntityManager theEntityManager) {
		entityManager = theEntityManager;
	}

	public List<Car> listALLCars() throws Exception {
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			Query query = currentSession.createQuery("Select c from Car c where c.STATUS = 'PENDING'");
			List<Car> orgList = query.getResultList();
			return orgList;
		} catch (HibernateException e) {
			throw new Exception("Could not list the organizations", e);
		}
	}

	@SuppressWarnings("rawtypes")
	@Transactional
	public int approveCar(int carID) throws Exception {
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			Query query = currentSession
					.createQuery("UPDATE Car c SET c.STATUS = 'APPROVED' WHERE Car_ID = :carID");
			query.setParameter("carID", carID);
			int result = query.executeUpdate();
			return result;
		} catch (HibernateException e) {

			throw new Exception("Could not approve the organizations", e);
		}
	}

	@SuppressWarnings("rawtypes")
	@Transactional
	public int rejectCar(int carID) throws Exception {
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			Query query = currentSession
					.createQuery("UPDATE Car c SET c.STATUS = 'DENIED' WHERE Car_ID = :carID");
			query.setParameter("carID", carID);
			int result = query.executeUpdate();
			return result;
		} catch (Exception e) {
			throw new Exception("Could not approve the organizations", e);
		}
	}

}
