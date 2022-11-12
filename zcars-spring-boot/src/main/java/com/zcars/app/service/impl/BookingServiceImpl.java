package com.zcars.app.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zcars.app.DAO.BookingDAOImpl;
import com.zcars.app.model.Booking;

@Service
public class BookingServiceImpl {

	private BookingDAOImpl bookingDAOImpl;

	private Booking currentBooking;
	
	public BookingServiceImpl(BookingDAOImpl bookingDAO) {
		super();
		this.bookingDAOImpl = bookingDAO;
	}

	public List<Booking> getBookingsOfACar(String carAddress) throws Exception {
		return bookingDAOImpl.getBookingsOfACar(carAddress);
	}

	public Booking saveItem(Booking booking) {
		return bookingDAOImpl.save(booking);

	}

	public List<Booking> getBookingsOfACarOwner(String ownerName) throws Exception {
		return bookingDAOImpl.getBookingsOfACar(ownerName);
	}

	public List<Booking> getBookingsOfACustomer(String bookedByUser) throws Exception {
		return bookingDAOImpl.getBookingsOfACustomer(bookedByUser);
	}

	public void setCurrentBooking(Booking booking) {
		this.currentBooking = booking;
	}

	public Booking getCurrentBooking() {
		return this.currentBooking;
	}

}
