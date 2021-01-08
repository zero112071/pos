package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.EmployeeBean;
import service.EmployeeService;

@Controller
public class BackstaffController {
	@Autowired
	private EmployeeService employeeService;

	@RequestMapping(path = { "/Login_v3/Backstaff.controller" })
	public String Method(Model model, String name, String eid, String uid, String pwd, String bankaccount,
			String position, String func) {

		System.out.println(pwd);
		
		EmployeeBean bean = new EmployeeBean();
		
		byte[] pwdch;
		pwdch = pwd.getBytes();
				
		Integer bach = Integer.parseInt(bankaccount);

		bean.setName(name);
		bean.setEid(eid);
		bean.setUid(uid);
		
		bean.setBankaccount(bach);
		bean.setPosition(position);
		

		if (func.equals("insert")) {
			bean.setPwd(pwdch);
			employeeService.insert(bean);
		} else if (func.equals("delete")) {
			employeeService.delete(eid);
		} else if (func.equals("update")) {
			bean.setPwd(employeeService.select(eid).getPwd());
			employeeService.update(bean);
		}

		return "/Login_v3/BackLink.controller?linkaddress=Employee";
	}

}
