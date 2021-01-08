package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import model.SalesBean;
import service.SalesService;

@Controller
@RequestMapping(path = { "/Login_v3/Sales.controller" })
public class SalesController {
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		dataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	@Autowired
	private SalesService salesService;

	@GetMapping
	public String method(Model model, Date date1, Date date2, SalesBean bean, BindingResult bindingResult,
			String salesaction) {
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		System.out.println(date1);
		System.out.println(date2);
		System.out.println(salesaction);
		if (bindingResult != null && bindingResult.hasFieldErrors()) {
			if (bindingResult.hasFieldErrors("date")) {
				errors.put("date", "date must be an Date(bean)");
			}
			if (bindingResult.hasFieldErrors("food")) {
				errors.put("food", "food must be an String(bean)");
			}
			if (bindingResult.hasFieldErrors("sale")) {
				errors.put("sale", "sale must be an Integer(bean)");
			}
			if (bindingResult.hasFieldErrors("sum")) {
				errors.put("sum", "sum must be an Integer(bean)");
			}
		}
		System.out.println(bindingResult);
		if (errors != null && !errors.isEmpty()) {
			return "/Login_v3/sales.jsp";
		}
		if (salesaction != null) {
			if (salesaction.equals("select") || salesaction.equals("insert") || salesaction.equals("update")
					|| salesaction.equals("selectdate")) {
				errors.put("date", "please choose a date");
			}
		}
//		if (errors != null && !errors.isEmpty()) {
//			System.out.println(errors);
//			return "/Login_v3/Sales.jsp";
//		}
		System.out.println("1111111");
		System.out.println(salesaction);
		if (salesaction != null && salesaction.equals("select")) {
			List<SalesBean> result = salesService.select();
			System.out.println("2222");
			System.out.println(result);
			model.addAttribute("select", result);
			return "/Login_v3/backsales.jsp";
		} else if (salesaction != null && salesaction.equals("selectdate")) {
			List<SalesBean> result = salesService.select(date1, date2);
			if (result == null) {
				errors.put("action", "sales insert wrong");
			} else {
				model.addAttribute("selectdate", result);
			}
			return "/Login_v3/backsales.jsp";
		} else if (salesaction != null && salesaction.equals("insert")) {
			SalesBean result = salesService.insert(bean);
			if (result == null) {
				errors.put("action", "sales insert wrong");
			} else {
				model.addAttribute("insert", result);
			}
			return "redirect:/Login_v3/Sales.controller?empaction=select";
		} else if (salesaction != null && salesaction.equals("update")) {
			SalesBean result = salesService.update(bean);
			if (result == null) {
				errors.put("action", "sales update fail");
			} else {
				model.addAttribute("update", result);
			}
			return "redirect:/Login_v3/Sales.controller?empaction=select";
		} else {
			errors.put("action", "fail to use");
			return "/Login_v3/backsales.jsp";
		}
	}

}
