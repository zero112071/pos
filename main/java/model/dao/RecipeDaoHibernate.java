package model.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.MenuBean;
import model.RecipeBean;

@Repository
@Transactional
public class RecipeDaoHibernate implements RecipeDao {
	@Autowired
	private SessionFactory sessionFactory;
//	public RecipeDaoHibernate(SessionFactory sessionFactory) {
//		super();
//		this.sessionFactory = sessionFactory;
//	}
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public RecipeBean insert(RecipeBean bean) {
		if(bean!=null) {
			this.getSession().save(bean);
			return bean;
			}
		return null;
	}

//	@Override
//	public RecipeBean select(String detailnum) {
//		
//		return this.getSession().get(RecipeBean.class, detailnum);
//	}

	@Override
	public RecipeBean update(RecipeBean bean) {
		if(bean!=null) {
			RecipeBean temp = this.getSession().get(RecipeBean.class, bean.getTid());
		
		if(temp!=null) {
			this.getSession().merge(bean);
			return bean;
			}
		}
		return null;
	}

	@Override
	public boolean delete(Integer tid) {
		RecipeBean temp = this.getSession().get(RecipeBean.class,tid);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}
	@Override
	public List<RecipeBean> select(String detailnum) {
		CriteriaBuilder builder=getSession().getCriteriaBuilder();
		CriteriaQuery<RecipeBean> critera =builder.createQuery(RecipeBean.class);
		Root<RecipeBean> root =critera.from(RecipeBean.class);
		critera.where(builder.equal(root.get("detailnum"),detailnum));
		return this.getSession().createQuery(critera).getResultList();
	}
	@Override
	public List<RecipeBean> select() {
		return this.getSession().createQuery("from RecipeBean", RecipeBean.class).list();
	}
	
}
