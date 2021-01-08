package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.condition.ProducesRequestCondition;

import model.InventoryBean;
import service.InventoryService;

@Controller
@RequestMapping("/Login_v3/Inventory.controller")
public class InventoryController {
	@Autowired
	private InventoryService inventoryService;
	private InventoryBean bean;

	@PostMapping
	public String method(Model model, String Ingredients,String invaction) {
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (Ingredients != null && Ingredients.length()!=0) {
				
			}
			if (invaction != null && invaction.length() != 0) {
				if (invaction.equals("insert") || invaction.equals("select")) {
					if (bean == null || bean.getIngredients().length() == 0) {
						errors.put("ingredients", "is wrong");
					}
				}
			}
			if (errors != null && !errors.isEmpty()) {
				return "/Login_v3/Inventory.jsp";
			}
			if (invaction != null && invaction.equals("select")) {
				List<InventoryBean> result = inventoryService.select(bean);
				model.addAttribute("select", result);
				return "/Login_v3/Inventory.jsp";
			} else if (invaction != null && invaction.equals("insert")) {
				InventoryBean result = inventoryService.insert(bean);
				if (result == null) {
					errors.put("action", "is wrong");
				} else {
					model.addAttribute("insert", result);
				}
				return "/Login_v3/Inventory.jsp";
			} else {
				errors.put("action", "please choose");
				return "/Login_v3/Inventory.jsp";
			}
		}
	}
