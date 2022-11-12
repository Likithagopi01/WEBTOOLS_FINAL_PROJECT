package com.zcars.app.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.zcars.app.model.Booking;
import com.zcars.app.model.Car;
//import com.hometogo.exception.UserException;
import com.zcars.app.model.User;
import com.zcars.app.service.impl.BookingServiceImpl;
import com.zcars.app.service.impl.CarServiceImpl;
import com.zcars.app.service.impl.UserServiceImpl;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import java.io.UnsupportedEncodingException;

@Controller
public class UserFormController {

	@Autowired
	private UserServiceImpl userServiceImpl;

	@Autowired
	private CarServiceImpl carServiceImpl;

	@Autowired
	private BookingServiceImpl bookingServiceImpl;

	@RequestMapping(value = { "/zcars/home", "" })
	public String goToHomePage() {
		return "Home";
	}

	@GetMapping(value = { "/zcars/user/login" })
	public String gotTologin() {
		return "login-form";
	}

	@RequestMapping(value = { "/zcars/user/register" })
	public String goToUserRegistrationPage(ModelMap model, User user) {
		model.addAttribute("user", user);
		return "userRegistrationform";
	}

	@PostMapping(value = "/zcars/user/register")
	public ModelAndView showRegistrationSuccess(HttpServletRequest request, @ModelAttribute("user") User user,
			BindingResult result, SessionStatus status) throws Exception {
		try {
			User userReg = userServiceImpl.saveUser(user);
			if (userReg.getUsername() == null) {
				return new ModelAndView("userExists", "user", userReg);
			} else {
				return new ModelAndView("user-success", "user", userReg);
			}
		} catch (Exception e) {
			return new ModelAndView("error", "errorMessage", "An error occurred while Registering the User !");
		}
	}

	@PostMapping(value = { "/zcars/user/login" })
	protected ModelAndView userLogin(@RequestParam("username") String username,
			@RequestParam("password") String password, HttpServletRequest request) throws Exception {
		HttpSession session = (HttpSession) request.getSession();
		try {

			User user = userServiceImpl.getUserByUserName(username, password);
			if (user == null) {
				session.setAttribute("errorMessage", "Invalid username and password! Please try again!");
				return new ModelAndView("error");
			}
			session.setAttribute("user", user);
			boolean checkIfPasswordIsCorrect = userServiceImpl.checkPassword(user, password);
			if (!checkIfPasswordIsCorrect) {
				session.setAttribute("errorMessage", "Invalid username and password! Please try again!");
				return new ModelAndView("error");
			}
			// get the userrole and open the next jsp based on the the userrole;
			String userTitle = user.getUserRole().trim();

			if (userTitle.equals("admin")) {
				return new ModelAndView("adminLanding");
			} else if (userTitle.equals("carOwner")) {
				return new ModelAndView("carOwnerLanding");
			} else if (userTitle.equals("customer")) {

				return new ModelAndView("customerLanding");
			} else {
				return null;
			}
		} catch (Exception e) {
			session.setAttribute("errorMessage", "An error occurred while trying to log in");
			return new ModelAndView("error");
		}
	}

	@GetMapping(value = "/zcars/customerLanding")
	protected ModelAndView customerSearchCar(HttpServletRequest request) throws Exception {
		HttpSession session = (HttpSession) request.getSession();
		Map<String, Object> carmap = new LinkedHashMap<String, Object>();

		List<Car> carList = new ArrayList<>();

		carList = userServiceImpl.listModels();
		List<String> distModels = new ArrayList<>();
		if (carList.size() > 0) {
			String model = null;
			for (Car c : carList) {
				model = c.getCarModel();
				if (!distModels.contains(model)) {
					distModels.add(model);
				}
			}
		}
		carmap.put("cars", distModels);
		return new ModelAndView("customerCarSearch", carmap);
	}

	@GetMapping(value = "/signOut")
	protected String signOutOfApplication(HttpServletRequest request) throws Exception {
		HttpSession session = (HttpSession) request.getSession();
		session.invalidate();
		return "Home";
	}

	@PostMapping(value = "/zcars/user/search")
	protected ModelAndView searchCarResultsBasedOnSearchCritirea(HttpServletRequest request) throws Exception {

		String cityModel = request.getParameter("carModel");
		String carType = request.getParameter("carType");

		List<Car> listCar = new ArrayList<>();
		listCar = userServiceImpl.getCarForUser(cityModel, carType);
		Map<String, Object> carmap = new LinkedHashMap<String, Object>();
		carmap.put("cars", listCar);

		return new ModelAndView("userSearchResults", carmap);
	}

	@GetMapping(value = "/zcars/user/{carID}/booking")
	protected ModelAndView showCarBookingInfo(@PathVariable("carID") int cid, HttpServletRequest request,
			Booking booking) throws Exception {

		List<String> dateListForSelection = new ArrayList<>();
		Map<String, Object> carmap = new LinkedHashMap<String, Object>();
//		dateListForSelection = dateGeneratorForCombo();
		carmap.put("car", carServiceImpl.getCar(cid));

//		List<Booking> bookListForCar = new ArrayList<>();
//		bookListForCar = bookingServiceImpl.getBookingsOfACar(carServiceImpl.getCar(cid).getCarModel());
//		if (bookListForCar.size() > 0) {
//			booking = bookListForCar.get(bookListForCar.size() - 1);
//			String removeStartDate = null, removeEndDate = null;
//			int indexStartDate, indexEndDate;
//			for (Booking item : bookListForCar) {
//				removeStartDate = item.getStartDate();
//				removeEndDate = item.getEndDate();
//
//				indexStartDate = dateListForSelection.indexOf(removeStartDate);
//				indexEndDate = dateListForSelection.indexOf(removeEndDate);
//				int j = indexStartDate;
//				for (int i = indexStartDate; i <= indexEndDate; i++) {
//					dateListForSelection.remove(j);
//				}
//			}
//		}

//		carmap.put("populatedDates", dateListForSelection);
		return new ModelAndView("carBookingPage", carmap);
	}

	@PostMapping(value = "/zcars/user/{carID}/booking")
	protected ModelAndView bookingCarSuccess(@PathVariable("carID") int cid, @PathVariable("userName") String userName,
			HttpServletRequest request, Booking booking, Car car) throws Exception {

		Map<String, Object> carmap = new LinkedHashMap<String, Object>();

		String startingDate = request.getParameter("startDate");
		String endingDate = request.getParameter("endDate");

		car = carServiceImpl.getCar(cid);

		booking.setCarBooked(car.getCarModel());
		booking.setCarOwner(car.getCarOwner());
		booking.setStartDate(startingDate);
		booking.setEndDate(endingDate);
		booking.setBookedByUser(userName);

		bookingServiceImpl.saveItem(booking);
		return new ModelAndView("bookingSuccessful", carmap);
	}

	@GetMapping(value = "/zcars/{userName}/view-bookings")
	protected ModelAndView showBookings(HttpServletRequest request) throws Exception {
		HttpSession session = (HttpSession) request.getSession();
		User user = (User) session.getAttribute("user");
		String bookedByUser = user.getUsername();
//        System.out.println("The Name of the Car Owner is: " + carOwner);
		List<Booking> bookList_Rent_Owner = new ArrayList<>();
		bookList_Rent_Owner = bookingServiceImpl.getBookingsOfACustomer(bookedByUser);

		Map<String, Object> carmap = new LinkedHashMap<String, Object>();
		carmap.put("confirmedBookings", bookList_Rent_Owner);
		carmap.put("ownerName", bookedByUser);
		return new ModelAndView("viewBookings", carmap);
	}

	@PostMapping(value = "/zcars/user/{carID}/{userName}/bookingSuccess")
	protected ModelAndView afterBookingCarSuccess(@PathVariable("carID") int cid,
			@PathVariable("userName") String userName, HttpServletRequest request, Booking booking, Car car)
			throws Exception {

		Map<String, Object> carmap = new LinkedHashMap<String, Object>();

		String startingDate = request.getParameter("startDate");
		String endingDate = request.getParameter("endDate");

		car = carServiceImpl.getCar(cid);

		booking.setCarBooked(car.getCarModel());
		booking.setCarOwner(car.getCarOwner());
		booking.setStartDate(startingDate);
		booking.setEndDate(endingDate);
		booking.setBookedByUser(userName);
		bookingServiceImpl.setCurrentBooking(booking);
		bookingServiceImpl.saveItem(booking);
		return new ModelAndView("bookingSuccessful", carmap);
	}

	@PostMapping(value = "/zcars/user/{userName}/emailConfirmation")
	protected ModelAndView sendEmailConfirmation(HttpServletRequest request, @PathVariable("userName") String userName) throws Exception {
		try {
			Booking booking = bookingServiceImpl.getCurrentBooking();
			String senderEmailId = request.getParameter("senderEmailId");
			sendEmail(senderEmailId, booking);
			return new ModelAndView("bookingSignOut");
		} catch (Exception e) {
			return new ModelAndView("login-form");
		}
	}

	public void sendEmail(String senderEmailId, Booking booking) {

		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("likithagopi0728@gmail.com");
		mailSender.setPassword("Liki@123");

		Properties javaMailProperties = new Properties();
		javaMailProperties.put("mail.smtp.starttls.enable", "true");
		javaMailProperties.put("mail.smtp.auth", "true");
		javaMailProperties.put("mail.transport.protocol", "smtp");
		javaMailProperties.put("mail.debug", "true");

		mailSender.setJavaMailProperties(javaMailProperties);
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		try {

			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);

			mimeMessageHelper.setSubject("Booking Confirmation for Zcars");
			mimeMessageHelper.setFrom(new InternetAddress("likithagopi0728@gmail.com"));
			mimeMessageHelper.setTo(senderEmailId);
			mimeMessageHelper.setText("Booking for  " + booking.getCarBooked() + "  is confirmed from " + booking.getStartDate() + " to " + booking.getEndDate());
			mailSender.send(mimeMessageHelper.getMimeMessage());

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
