package com.zcars.app.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Booking")
public class Booking {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
    @Column(name = "Booking_ID")
    private int bookingID;

    @Basic
    @Column(name = "Car_Booked")
    private String carBooked;

    @Basic
    @Column(name = "Booked_By_User")
    private String bookedByUser;

    @Basic
    @Column(name = "Car_Owner")
    private String carOwner;

    @Basic
    @Column(name = "Start_Date")
    private String startDate;

    @Basic
    @Column(name = "End_Date")
    private String endDate;

	public int getBookingID() {
		return bookingID;
	}

	public void setBookingID(int bookingID) {
		this.bookingID = bookingID;
	}

	public String getCarBooked() {
		return carBooked;
	}

	public void setCarBooked(String carBooked) {
		this.carBooked = carBooked;
	}

	public String getBookedByUser() {
		return bookedByUser;
	}

	public void setBookedByUser(String bookedByUser) {
		this.bookedByUser = bookedByUser;
	}

	public String getCarOwner() {
		return carOwner;
	}

	public void setCarOwner(String carOwner) {
		this.carOwner = carOwner;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

    

}
