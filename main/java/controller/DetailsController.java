package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class DetailsController {
	

	@RequestMapping(path = {"/Login_v3/Details.controller"})
	public String method(Model model , HttpSession session) {
		
		session.removeAttribute("order");
		
		return "redirect:/Login_v3/AllOrder.jsp";
	}
	
}
