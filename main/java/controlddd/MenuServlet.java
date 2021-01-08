package controlddd;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MenuBean;
import service.MenuService;

//@WebServlet(
//		urlPatterns={"/Login_v3/Menu.controller"}		
//)
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MenuService menuService;
	
	@Override
	public void init() throws ServletException {
		menuService = new MenuService();
	}
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
//接收資料
		String temp1 = request.getParameter("cid");
		String temp2 = request.getParameter("price");
		String classes = request.getParameter("classes");
		String food = request.getParameter("food");
		String picture = request.getParameter("picture");
		String menuaction = request.getParameter("menuaction");
		
//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errors", errors);
		
		if(menuaction!=null) {
			if(menuaction.equals("Insert") || menuaction.equals("Update") || menuaction.equals("Delete")) {
				if(temp1==null || temp1.length()==0) {
					errors.put("id", "Please enter Id for "+menuaction);
				}
			}
		}
		
//轉換資料
		int cid = 0;
		if(temp1!=null && temp1.length()!=0) {
			try {
				cid = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("cid", "cid must be an integer");
			}
		}
		
		Integer price = 0;
		if(temp2!=null && temp2.length()!=0) {
			try {
				price = Integer.parseInt(temp2);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("price", "Price must be a number");
			}
		}
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/Login_v3/AllOrder.jsp").forward(request, response);
			return;
		}

//呼叫Model
		MenuBean bean = new MenuBean();
		bean.setCid(cid);
		bean.setClasses(classes);
		bean.setFood(food);
		bean.setPrice(price);
		bean.setPricture(picture);
		System.out.println("bean");
		
//根據Model執行結果導向View
		if(menuaction!=null && menuaction.equals("Select")) {
			List<MenuBean> result = menuService.select(classes);
			request.setAttribute("select", result);
			request.getRequestDispatcher(
					"display.jsp").forward(request, response);
		} else if(menuaction!=null && menuaction.equals("Insert")) {
			MenuBean result = menuService.insert(bean);
			if(result==null) {
				errors.put("action", "Insert fail");
			} else {
				request.setAttribute("insert", result);
			}
			request.getRequestDispatcher(
					"/Login_v3/Food.jsp").forward(request, response);
		} else if(menuaction!=null && menuaction.equals("Update")) {
			MenuBean result = menuService.update(bean);
			if(result==null) {
				errors.put("action", "Update fail");
			} else {
				request.setAttribute("update", result);
			}
			request.getRequestDispatcher(
					"/Login_v3/Food.jsp").forward(request, response);
		} else if(menuaction!=null && menuaction.equals("Delete")) {
			boolean result = menuService.delete(bean);
			if(!result) {
				request.setAttribute("delete", 0);
			} else {
				request.setAttribute("delete", 1);
			}
			request.getRequestDispatcher(
					"/Login_v3/Food.jsp").forward(request, response);
		} else  {
			errors.put("action", "Unknown Action:"+menuaction);
			request.getRequestDispatcher(
					"/Login_v3/Food.jsp").forward(request, response);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
