package com.zcars.app.DAO;

import com.zcars.app.model.Car;
import com.zcars.app.model.User;

import java.util.List;

import java.util.Arrays;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl {

	private long id = 1;
	private EntityManager entityManager;

	// set up constructor injection
	@Autowired
	public UserDAOImpl(EntityManager theEntityManager) {
		entityManager = theEntityManager;
	}

	public User findById(long userId) {
		Session currentSession = entityManager.unwrap(Session.class);
		User user = currentSession.get(User.class, userId);
		return user;
	}

	@SuppressWarnings("rawtypes")
	public User getUserByUserName(String username) {
		Session currentSession = entityManager.unwrap(Session.class);
		Query query = currentSession.createQuery("SELECT u from User u WHERE u.username = :username", User.class);
		query.setParameter("username", username);
		User user = (User) query.getSingleResult();
		return user;
	}

	public User save(User user) throws Exception {
		Session currentSession = entityManager.unwrap(Session.class);
		Long count = (Long) entityManager.createQuery("select count(id) from User").getSingleResult();
		if (count > 0) {
			User existingUser = getUser(user.getUsername());
			if (existingUser.getUsername() == null) {
				user.setId(id);
				id++;
				currentSession.save(user);
				return user;
			} else {
				return new User();
			}
		} else {
			user.setId(id);
			id++;
			currentSession.save(user);
			return user;
		}
	}

	private User getUser(String username) throws Exception {
		try {
			User user = getUserByUserName(username);
			return user;
		} catch (Exception e) {
			return new User();
		}

	}

	public List<Car> listModels() {
		Session currentSession = entityManager.unwrap(Session.class);
		@SuppressWarnings("unchecked")
		Query query = currentSession.createQuery("SELECT c from Car c where STATUS = 'APPROVED'");
		List modelList = (List) query.getResultList();
		return modelList;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Car> getCarForUser(String cityModel, String carType) throws Exception {
		List<Car> resultList;
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			Query query = currentSession
					.createQuery("SELECT c from Car c where Car_Type = :carType AND Car_Model = :cityModel", Car.class);
			query.setParameter("carType", carType);
			query.setParameter("cityModel", cityModel);
			resultList = (List<Car>) query.getResultList();

		} catch (Exception e) {
			throw new Exception("Could not get the value", e);
		}
		return resultList;
	}

}
