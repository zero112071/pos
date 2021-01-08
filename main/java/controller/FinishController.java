package controller;


import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.RecipeBean;

@Controller
public class FinishController {
	@RequestMapping(value = { "/Login_v3/Finish.controller" })
	public @ResponseBody String method(Model model, @RequestBody String body, HttpSession session) {
//接收資料	
		List<RecipeBean> result = null;
		result = new ArrayList<RecipeBean>();
		
		Timestamp time = new Timestamp(System.currentTimeMillis()); 
		String detailnum = "";
		SimpleDateFormat sy = new SimpleDateFormat("yyyy");
		SimpleDateFormat sm = new SimpleDateFormat("MM");
		SimpleDateFormat sd = new SimpleDateFormat("dd");
		String syear = sy.format(time);
		String smon = sm.format(time);
		String sday = sd.format(time);
		detailnum = syear + smon + sday;
		
		JSONArray order = new JSONArray(body);
		for (int i = 0; i < order.length(); i++) {
			JSONObject obj = order.getJSONObject(i);
			RecipeBean bean = new RecipeBean();
			bean.setDetailnum(detailnum);
			bean.setPicture(obj.getString("picture"));
			bean.setFood(obj.getString("food")); 
			bean.setPrice(obj.getInt("price"));
			bean.setNum(obj.getInt("num"));
			bean.setTotal(obj.getInt("total"));
			bean.setTime(time);
			result.add(bean);
		}
		
		session.setAttribute("order", result);
		
//根據Model執行結果導向View
		
		String data = new JSONObject().put("url","/pos/Login_v3/Finish.jsp").toString();
		return data;
	}
}
