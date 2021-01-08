package model.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Order;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.EmployeeBean;
import model.MenuBean;
import model.RecipeBean;
import model.SalesBean;

@Repository
@Transactional
public class SalesDaoHibernate implements SalesDao {
	@Autowired
	private SessionFactory sessionFactory;

	// public SalesDaoHibernate(SessionFactory sessionFactory) {
//		super();
//		this.sessionFactory = sessionFactory;
//	}
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public SalesBean insert(SalesBean bean) {
		if (bean != null) {
				this.getSession().save(bean);
				return bean;
			}
		return bean;
	}

	@Override
	public SalesBean update(SalesBean bean) {
		if (bean != null) {
			SalesBean temp = this.getSession().get(SalesBean.class, bean.getSid());

			if (temp != null) {
				this.getSession().merge(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public List<SalesBean> select(Date date1,Date date2) {
		if (date1==date2) {
			CriteriaBuilder builder = getSession().getCriteriaBuilder();
			CriteriaQuery<SalesBean> criteria = builder.createQuery(SalesBean.class);
			Root<SalesBean> root = criteria.from(SalesBean.class);
			criteria.select(root);
			criteria.where(builder.equal(root.get("date"),date1));
			TypedQuery<SalesBean> query = getSession().createQuery(criteria);
			return query.getResultList();
		}else { 
			CriteriaBuilder builder = getSession().getCriteriaBuilder();
			CriteriaQuery<SalesBean> criteria = builder.createQuery(SalesBean.class);
			Root<SalesBean> root = criteria.from(SalesBean.class);
			criteria.select(root);
			criteria.where(builder.between(root.get("date"),date1,date2));
			TypedQuery<SalesBean> query = getSession().createQuery(criteria);
			return query.getResultList();
//			List<SalesBean> select = 
			
//			return this.getSession().createQuery("from SalesBean order", SalesBean.class).list();
		}
		
		
	}

	@Override
	public List<SalesBean> select() {
		return this.getSession().createQuery("from SalesBean", SalesBean.class).list();
//		return this.getSession().createQuery("from EmployeeBean", EmployeeBean.class).list();
	}

}
