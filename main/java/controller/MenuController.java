package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.MenuBean;
import service.MenuService;

@Controller
public class MenuController {
	@Autowired
	private MenuService menuService;

	@RequestMapping(value = { "/Login_v3/Menu.controller" })
	public String method(Model model, String classes, HttpSession session) {
//接收資料
		
		System.out.println(classes);

//根據Model執行結果導向View
		List<MenuBean> result;
		if (classes.equals("全部")) {
			result= menuService.select("");
			session.setAttribute("select", result);
			return "redirect:/Login_v3/AllOrder.jsp";
		} else if(classes.equals("主餐")) {
			result= menuService.select(classes);
			session.setAttribute("select", result);
			return "redirect:/Login_v3/FristOrder.jsp";
		} else if(classes.equals("副餐")) {
			result= menuService.select(classes);
			session.setAttribute("select", result);
			return "redirect:/Login_v3/SideOrder.jsp";
		} else if(classes.equals("炸物")) {
			result= menuService.select(classes);
			session.setAttribute("select", result);
			return "redirect:/Login_v3/FriedOrder.jsp";
		} else {
			result= menuService.select(classes);
			session.setAttribute("select", result);
			return "redirect:/Login_v3/DrinkOrder.jsp";
		}
		
	}
}
