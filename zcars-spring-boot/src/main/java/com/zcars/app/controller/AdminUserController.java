package com.zcars.app.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zcars.app.service.impl.AdminServiceImpl;


@Controller
public class AdminUserController {
	
	
	@Autowired
	private AdminServiceImpl adminServiceImpl;
	
	@GetMapping(value = "/zcars/admin-manage")
	protected ModelAndView listCars(HttpServletRequest request) throws Exception {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("cars", adminServiceImpl.listALLCars());
		return new ModelAndView("adminManageCars", modelMap);
	}

	@GetMapping(value = "/zcars/admin/{carID}/approveCar")
	protected ModelAndView approveCar(@PathVariable("carID") int cid, HttpServletRequest request) throws Exception {

		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("cars", adminServiceImpl.approveCar(cid));
		return new ModelAndView("carApproved", modelMap);
	}

	@GetMapping(value = "/zcars/admin/{carID}/rejectCar")
	protected ModelAndView rejectCar(@PathVariable("carID") int cid, HttpServletRequest request) throws Exception {

		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("cars", adminServiceImpl.rejectCar(cid));
		return new ModelAndView("carRejected", modelMap);
	}
}
