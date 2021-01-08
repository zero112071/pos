package service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.MenuBean;
import model.dao.MenuDao;

@Service
@Transactional
public class MenuService {
	@Autowired
	private MenuDao menuDao;

	public List<MenuBean> select(String classes) {
		List<MenuBean> result = null;
		if(classes!=null && classes.length()!=0) {
			result = menuDao.selectclass(classes);
		} else {
			result = menuDao.select(); 
		}
		return result;
	}

	public MenuBean insert(MenuBean bean) {
		MenuBean result = null;
		if (bean != null) {
			result = menuDao.insert(bean);
		}
		return result;
	}

	public MenuBean update(MenuBean bean) {
		MenuBean result = null;
		if (bean != null) {
			result = menuDao.update(bean);
		}
		return result;
	}

	public boolean delete(MenuBean bean) {
		boolean result = false;
		if (bean != null) {
			result = menuDao.delete(bean.getCid());
		}
		return result;
	}

}
