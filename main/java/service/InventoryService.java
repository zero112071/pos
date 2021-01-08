package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.InventoryBean;
import model.dao.InventoryDao;
import model.dao.InventoryDaoHibernate;
@Service
@Transactional
public class InventoryService {
	@Autowired
	private InventoryDao inventoryDao;
	
	public List<InventoryBean> select(InventoryBean bean) {
		List<InventoryBean> result = null;
		if(bean!=null && bean.getId()!=0) {
			InventoryBean temp = inventoryDao.select(bean.getIngredients());
			if(temp!=null) {
				result = new ArrayList<InventoryBean>();
				result.add(temp);
			}
		} else {
			result = inventoryDao.select(); 
		}
		return result;
	}
	public InventoryBean insert(InventoryBean bean) {
		InventoryBean result = null;
		if(bean!=null) {
			result = inventoryDao.insert(bean);
		}
		return result;
	}
	public InventoryBean update(InventoryBean bean) {
		InventoryBean result = null;
		if(bean!=null) {
			result = inventoryDao.update(bean);
		}
		return result;
	}
}
