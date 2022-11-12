package com.zcars.app.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zcars.app.model.Booking;


@Repository
public class BookingDAOImpl {

	private int bID = 1 ;
	private EntityManager entityManager;

	// set up constructor injection
	@Autowired
	public BookingDAOImpl(EntityManager theEntityManager) {
		entityManager = theEntityManager;
	}

	
    @SuppressWarnings("rawtypes")
	public List<Booking> getBookingsOfACar(String carOwner) throws Exception {
        try {
        	Session currentSession = entityManager.unwrap(Session.class);
        	Query query = currentSession.createQuery("SELECT b from Booking b where Car_Owner = :carOwner");
            query.setParameter("carOwner", carOwner);
            List<Booking> bookingList = query.getResultList();
            return bookingList;
        } catch (HibernateException e) {
            throw new Exception("Owner's Properties could not be retrieved" + carOwner, e);
        }
    }
    
	public Booking save(Booking booking) {
		Session currentSession = entityManager.unwrap(Session.class);
		booking.setBookingID(bID);
		currentSession.save(booking);
		bID++;
		return booking;

	}
	
    //To Fetch the Bookings of a particular Property Owner
    public List<Booking> getBookingsOfAPropertyOwner(String carOwner) throws  Exception {
        try {
        	Session currentSession = entityManager.unwrap(Session.class);
            Query query = currentSession.createQuery("SELECT b from Booking b where Car_Owner = :carOwner");
            query.setParameter("carOwner", carOwner);
            //Property propertyList = (Property) query.uniqueResult();
            List<Booking> bookingList = query.getResultList();
            return bookingList;
        } catch (HibernateException e) {
            throw new Exception("Owner's Properties could not be retrieved" + carOwner, e);
        }
    }


	public List<Booking> getBookingsOfACustomer(String bookedByUser) throws Exception {
		 try {
	        	Session currentSession = entityManager.unwrap(Session.class);
	        	Query query = currentSession.createQuery("SELECT b from Booking b where booked_by_user = :bookedByUser");
	            query.setParameter("bookedByUser", bookedByUser);
	            List<Booking> bookingList = query.getResultList();
	            return bookingList;
	        } catch (HibernateException e) {
	            throw new Exception("Owner's Properties could not be retrieved" + bookedByUser, e);
	        }
	}

}
