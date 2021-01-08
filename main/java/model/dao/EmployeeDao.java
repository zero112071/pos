package model.dao;

import java.util.List;

import model.EmployeeBean;

public interface EmployeeDao{
	EmployeeBean insert(EmployeeBean bean);
	EmployeeBean select(String eid);
	List<EmployeeBean> select();
	EmployeeBean update(EmployeeBean bean);
	boolean delete(String eid);
}
