package service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.EmployeeBean;
import model.dao.EmployeeDao;

@Service
@Transactional
public class EmployeeService {
	@Autowired
	private EmployeeDao employeeDao;

	public boolean changePassword(String eid, String oldPassword, String newPassword) {
		EmployeeBean bean = this.login(eid, oldPassword);
		if (bean != null) {
			EmployeeBean update = employeeDao.update(bean);
			if (update != null) {
				return true;
			}
		}
		return false;
	}

	public EmployeeBean login(String eid, String password) {
		EmployeeBean bean = employeeDao.select(eid);
		if (bean != null) {
			if (password != null && password.length() != 0) {
				byte[] temp = password.getBytes(); // 使用者輸入
				byte[] pass = bean.getPwd();       // 資料庫抓出
				if (Arrays.equals(temp, pass)) {
					return bean;
				}
			}
		}
		return null;
	}
	
	public EmployeeBean select(String eid) {
		EmployeeBean result = employeeDao.select(eid);
		return result;		
	}
	
	public List<EmployeeBean> select() {
		List<EmployeeBean> result = employeeDao.select();
		return result;		
	}

	public List<EmployeeBean> select(EmployeeBean bean) {
		List<EmployeeBean> result = null;
		if (bean != null && bean.getEid().length() != 0) {
			EmployeeBean temp = employeeDao.select(bean.getEid());
			if (temp != null) {
				result = new ArrayList<EmployeeBean>();
				result.add(temp);
			}
		} else {
			result = employeeDao.select();
		}
		return result;
	}

	public EmployeeBean insert(EmployeeBean bean) {
		EmployeeBean result = null;
		if (bean != null) {
			result = employeeDao.insert(bean);
		}
		return result;
	}

	public EmployeeBean update(EmployeeBean bean) {
		EmployeeBean result = null;
		if (employeeDao.select(bean.getEid()) != null) {
			result = employeeDao.update(bean);
		}
		return result;
	}

	public boolean delete(String eid) {
		boolean result = false;
		if (employeeDao.select(eid)!=null) {
			result = employeeDao.delete(eid);
		}
		return result;
	}
}
