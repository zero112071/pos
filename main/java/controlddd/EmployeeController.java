package controlddd;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.EmployeeBean;
import model.MenuBean;
import service.EmployeeService;
import service.MenuService;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private MessageSource messageSource;

	@RequestMapping(path = { "/Login_v3/Employee.controller" })
	public String Method(String eid, String pwd, String fn, Model model, HttpSession session, Locale locale) {
		System.out.println("eid=" + eid);
		System.out.println("pwd=" + pwd);
		System.out.println("fn=" + fn);
		Map<String, String> errorMsgs = new HashMap<>();
		model.addAttribute("errors", errorMsgs);

		if (eid == null || eid.length() == 0) {
			errorMsgs.put("xxx1", messageSource.getMessage("login.username.required", null, locale));
		}
		if (pwd == null || pwd.length() == 0) {
			errorMsgs.put("xxx2", messageSource.getMessage("login.password.required", null, locale));
		}
		if (fn == null || fn.length() == 0) {
			errorMsgs.put("xxx3", messageSource.getMessage("login.fnuction.required", null, locale));
		}
		
		if (fn.equals("order")) {
			List<MenuBean> result = menuService.select("");
			session.setAttribute("select", result);
			return "redirect:/Login_v3/AllOrder.jsp";
		}
		if (fn.equals("login")) {
			return "redirect:/Login_v3/Login.jsp";
		}
		if (errorMsgs != null && !errorMsgs.isEmpty()) {
			return "/Login_v3/Login.jsp";
		}

		// 呼叫MODEL
		EmployeeBean bean = employeeService.login(eid, pwd);

		// 根據MODEL執行結果呼叫VIEW

		if (bean == null) {
			errorMsgs.put("xxx2", "Login failed, please try again.");
			return "/Login_v3/Login.jsp";
		} else {
			session.setAttribute("user", bean);
			List<MenuBean> result = menuService.select("");
			session.setAttribute("select", result);
			return "redirect:/Login_v3/backstaff.jsp";
		}
	}
}
