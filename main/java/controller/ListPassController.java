package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.EmployeeBean;
import service.EmployeeService;

@Controller
public class ListPassController {
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = { "/Login_v3/Listpass.controller" })
	public @ResponseBody String method(Model model, @RequestBody String body, HttpSession session) {
		
		EmployeeBean result = employeeService.select(body);
		
		session.setAttribute("user", result);
		
		return "/Login_v3/backstaff.jsp";
	}
	
}
