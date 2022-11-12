package com.zcars.app.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.zcars.app.model.Booking;
import com.zcars.app.model.Car;
import com.zcars.app.model.User;
import com.zcars.app.service.impl.BookingServiceImpl;
import com.zcars.app.service.impl.CarServiceImpl;

@Controller
public class CarOwnerUserController {
		
		@Autowired
		private CarServiceImpl carServiceImpl;

		
		@Autowired
		private BookingServiceImpl bookingServiceImpl;

		
	    @GetMapping(value = "/zcars/car")
	    protected ModelAndView showAddCarForm(HttpServletRequest request, Car car) {
	        HttpSession session = (HttpSession) request.getSession();
	        User name = (User) session.getAttribute("user");
	        String carOwner = name.getUsername();
	        session.setAttribute("OwnerName", carOwner);
	        return new ModelAndView("addCar", "car", carOwner);
	    }

	    @PostMapping(value = "/zcars/car")
	    protected ModelAndView showCarAddedSuccess(HttpServletRequest request, Car car, User user, BindingResult result, SessionStatus status) {
	        HttpSession session = (HttpSession) request.getSession();
	        car.setCarModel(request.getParameter("carModel"));
	        car.setCarYear(request.getParameter("carYear"));
	        car.setCarSeats(request.getParameter("carSeats"));
	        car.setCarType(request.getParameter("carType"));
	        car.setCarCost(request.getParameter("carCost"));
	        String carOwner = (String) session.getAttribute("OwnerName");
	        car.setCarOwner(carOwner);
	        System.out.println("Car Rental Cost is:" + car.getCarCost());
	        
	        try {
	            Car carReg = carServiceImpl.saveCar(car);
	            status.setComplete();
	            return new ModelAndView("carRegistered", "car", carReg);
	        } catch (Exception e) {
	            return new ModelAndView("error", "errorMessage", "An error occurred while adding a new car");
	        }
	    }

	    @GetMapping(value = "/zcars/manage-car")
	    protected ModelAndView showManageProperty(HttpServletRequest request) throws Exception {
	        HttpSession session = (HttpSession) request.getSession();
	        User user = (User) session.getAttribute("user");
	        String carOwner = user.getUsername();
	        System.out.println("The Name of the Owner is: " + carOwner);
	        Map<String, Object> modelMap = new LinkedHashMap<String, Object>();
	        modelMap.put("cars", carServiceImpl.getOwnerCarList(carOwner));
	        modelMap.put("ownerName", carOwner);
	        return new ModelAndView("manageCar", modelMap);
	    }
	    
	    @GetMapping(value = "/zcars/view-bookings")
	    protected ModelAndView showBookings(HttpServletRequest request) throws Exception {
	        HttpSession session = (HttpSession) request.getSession();
	        User user = (User) session.getAttribute("user");
	        String carOwner = user.getUsername();
//	        System.out.println("The Name of the Car Owner is: " + carOwner);
	        List<Booking> bookList_Rent_Owner = new ArrayList<>();
	        bookList_Rent_Owner = bookingServiceImpl.getBookingsOfACarOwner(carOwner);
	 
	        Map<String, Object> modelMap = new LinkedHashMap<String, Object>();
	        modelMap.put("confirmedBookings", bookList_Rent_Owner);
	        modelMap.put("ownerName", carOwner);
	        return new ModelAndView("viewBookings", modelMap);
	    }
	    

	    @GetMapping(value = "/zcars/carowner/{carID}/delete")
	    protected ModelAndView deleteProperty(@PathVariable("carID") int cid, HttpServletRequest request) throws Exception {

	        Map<String, Object> modelMap = new LinkedHashMap<String, Object>();

	        modelMap.put("deletedCar", carServiceImpl.getCar(cid).getCarModel());
	        carServiceImpl.deleteCar(carServiceImpl.getCar(cid));
	        return new ModelAndView("ownerDeletedCar", modelMap);
	    }

	    @GetMapping(value = "/zcars/carowner/{carID}/update")
	    protected ModelAndView updateProperty(@PathVariable("carID") int cid, HttpServletRequest request) throws Exception {

	        Map<String, Object> map = new LinkedHashMap<String, Object>();

	        map.put("car", carServiceImpl.getCar(cid));
	        map.put("cid", cid);
	        return new ModelAndView("ownerUpdateCar", map);
	    }


