package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.EmployeeBean;
import model.RecipeBean;
import model.SalesBean;
import model.dao.SalesDao;

@Service
@Transactional
public class SalesService {
	@Autowired
	private SalesDao salesDao;
	public List<SalesBean> select(SalesBean bean) {
		if (bean != null) {
			List<SalesBean> result = salesDao.select();
			return result;
		}
		return null;

	}

	public List<SalesBean> select(Date date1, Date date2) {
		if (date1 != null && date2 != null) {
			List<SalesBean> result = salesDao.select(date1, date2);
			return result;
		}
		return null;

	}

	public SalesBean insert(SalesBean bean) {
		SalesBean result = null;
		if (bean != null) {
			result = salesDao.insert(bean);
		}
		return result;
	}

	public SalesBean update(SalesBean bean) {
		SalesBean result = null;
		if (bean != null) {
			result = salesDao.update(bean);
		}
		return result;
	}

	public List<SalesBean> select() {
		List<SalesBean> result = salesDao.select();
		return result;
	}

}
