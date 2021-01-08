package controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import model.MenuBean;
import model.RecipeBean;
import service.RecipeService;

@Controller
public class RecipeController {
	@Autowired
	private RecipeService recipceService;
	
	@RequestMapping(path = {"/Login_v3/Recipe.controller"})
	public String method(Model model ,String detailnum,String reaction,RecipeBean bean, HttpSession session) {
		
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		
		if(errors!=null && !errors.isEmpty()) {
			return "/Login_v3/Recipe.jsp";
		}
		// 呼叫MODEL
		
		Timestamp time = new Timestamp(System.currentTimeMillis()); 
		String dnum = "";
		String renum = Integer.toString((recipceService.select().size())+1);
		
		ArrayList<RecipeBean> result = (ArrayList<RecipeBean>) session.getAttribute("order");
		if (reaction != null && reaction.equals("送出訂單")) {
			for (RecipeBean temp : result) {
				temp.setTime(time);
				temp.setDetailnum(temp.getDetailnum()+renum);
				recipceService.insert(temp);
			}
		}	
		
		String dn = result.get(0).getDetailnum();
		
		String tsStr = "";  
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
		tsStr = sdf.format(time);  
		
		System.out.println(time);
		
		session.setAttribute("detailnum", dn);
		session.setAttribute("time", tsStr);
		session.setAttribute("order", result);
		
		return "redirect:/Login_v3/Finishdetails.jsp";
		
//		if (reaction != null && reaction.equals("select")) {
//			List<RecipeBean> result = recipceService.select(detailnum);
//			model.addAttribute("select", result);
//			return "/Login_v3/Finish.jsp";
//		} else if (reaction != null && reaction.equals("Insert")) {
//			RecipeBean result = recipceService.insert(bean);
//			if (result == null) {
//				errors.put("action", "Insert fail");
//			} else {
//				model.addAttribute("insert", result);
//			}
//			return "/Login_v3/Finish.jsp";
//		} else if (reaction != null && reaction.equals("Update")) {
//			RecipeBean result = recipceService.update(bean);
//			if (result == null) {
//				errors.put("action", "Update fail");
//			} else {
//				model.addAttribute("update", result);
//			}
//			return "/Login_v3/Finish.jsp";
//		} else if (reaction != null && reaction.equals("Delete")) {
//			boolean result = recipceService.delete(bean);
//			if (!result) {
//				model.addAttribute("delete", 0);
//			} else {
//				model.addAttribute("delete", 1);
//			}
//			return "/Login_v3/Finish.jsp";
//		} else {
//			errors.put("action", "Unknown Action");
//			return "/Login_v3/Finish.jsp";
//		}

	}

}
