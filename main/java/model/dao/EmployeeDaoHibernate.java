package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.EmployeeBean;

@Repository
public class EmployeeDaoHibernate implements EmployeeDao {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public EmployeeBean select(String eid) {
		return this.getSession().get(EmployeeBean.class, eid);
	}

	@Override
	public List<EmployeeBean> select() {
		return this.getSession().createQuery("from EmployeeBean", EmployeeBean.class).list();
	}

	@Override
	public EmployeeBean update(EmployeeBean bean) {
		EmployeeBean update = this.getSession().get(EmployeeBean.class, bean.getEid());
		if (update != null) {
			update.setName(bean.getName());
			update.setUid(bean.getUid());
			update.setPwd(bean.getPwd());
			update.setBankaccount(bean.getBankaccount());
			update.setPosition(bean.getPosition());
			return update;
		}
		return null;
	}

	@Override
	public EmployeeBean insert(EmployeeBean bean) {
		if (bean.getEid() != null || bean.getEid().length() != 0) {
			if (bean.getName() != null || bean.getName().length() != 0) {
				if (bean.getUid() != null || bean.getUid().length() != 0) {
					if (bean.getPwd() != null || bean.getPwd().length != 0) {
						this.getSession().save(bean);
						return bean;
					}

				}

			}

		}
		return null;
	}

	@Override
	public boolean delete(String eid) {
		EmployeeBean temp = this.getSession().get(EmployeeBean.class, eid);
		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

}
