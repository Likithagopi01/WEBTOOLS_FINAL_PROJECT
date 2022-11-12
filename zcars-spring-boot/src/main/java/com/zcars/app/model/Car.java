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
@Table(name="Car")
public class Car {
    
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
    @Column(name="Car_ID")
    private int carID;
    
    @Basic
    @Column(name="Car_Model")
    private String carModel;
    
    @Basic
    @Column(name="Car_Year")
    private String carYear;
    
	@Basic
    @Column(name="Car_Seats")
    private String carSeats;
    
    @Basic
    @Column(name="Car_Type")
    private String carType;
    
    @Basic
    @Column(name="Car_Cost")
    private String carCost;
    
    @Basic
    @Column(name="Owner")
    private String carOwner;
    
    @Basic
    @Column(name="STATUS")
    private String STATUS;

	public int getCarID() {
		return carID;
	}

	public void setCarID(int carID) {
		this.carID = carID;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public String getCarYear() {
		return carYear;
	}

	public void setCarYear(String carYear) {
		this.carYear = carYear;
	}

	public String getCarSeats() {
		return carSeats;
	}

	public void setCarSeats(String carSeats) {
		this.carSeats = carSeats;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getCarCost() {
		return carCost;
	}

	public void setCarCost(String carCost) {
		this.carCost = carCost;
	}

	public String getCarOwner() {
		return carOwner;
	}

	public void setCarOwner(String carOwner) {
		this.carOwner = carOwner;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}



    
}
