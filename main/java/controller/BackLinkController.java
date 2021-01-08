package controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.EmployeeBean;
import model.InventoryBean;
import model.SalesBean;
import service.EmployeeService;
import service.InventoryService;
import service.SalesService;

@Controller
public class BackLinkController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private InventoryService InventoryService;
	@Autowired
	private SalesService salesService;

	@RequestMapping(path = { "/Login_v3/BackLink.controller" })
	public String method(Model model, String linkaddress, HttpSession session) {
		

		if (linkaddress.equals("Employee")) {
			List<EmployeeBean> eresult = employeeService.select();
			session.setAttribute("eselect", eresult);
			return "redirect:/Login_v3/backstaff.jsp";
		} else if (linkaddress.equals("Inventory")) {
			List<InventoryBean> iresult = InventoryService.select(null);
			session.setAttribute("iselect", iresult);
			return "redirect:/Login_v3/backstock.jsp";
		} else if (linkaddress.equals("Sales")) {
			List<SalesBean> sresult = salesService.select();
			session.setAttribute("sselect", sresult);
			return "redirect:/Login_v3/backsales.jsp";
		} else if (linkaddress.equals("Report")) {
			return "redirect:/Login_v3/backreport.jsp";			
		}
		return "redirect:/Login_v3/backstaff.jsp";
	}

}
