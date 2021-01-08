package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.InventoryBean;

@Repository
public class InventoryDaoHibernate implements InventoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public InventoryBean insert(InventoryBean bean) {
		if (bean != null) {
			InventoryBean temp = this.getSession().get(InventoryBean.class, bean.getId());
			if (temp != null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public InventoryBean select(String ingredients) {
		return this.getSession().get(InventoryBean.class, ingredients);
	}

	@Override
	public InventoryBean update(InventoryBean bean) {
		if (bean != null) {
			InventoryBean temp = this.getSession().get(InventoryBean.class, bean.getIngredients());
			if (temp != null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public List<InventoryBean> select() {
		return this.getSession().createQuery("from InventoryBean", InventoryBean.class).list();
	}

}
