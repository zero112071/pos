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

@Repository
@Transactional
public class MenuDaoHibernate implements MenuDao {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public MenuBean insert(MenuBean bean) {
		if (bean != null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}

	@Override
	public MenuBean update(MenuBean bean) {
		if (bean != null) {
			MenuBean temp = this.getSession().get(MenuBean.class, bean.getCid());
			if (temp != null) {
				this.getSession().merge(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public boolean delete(Integer cid) {
		MenuBean temp = this.getSession().get(MenuBean.class, cid);
		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

	@Override
	public List<MenuBean> select() {
		return this.getSession().createQuery("from MenuBean", MenuBean.class).list();
	}

	@Override
	public MenuBean select(Integer cid) {
		return this.getSession().get(MenuBean.class, cid);
	}

	@Override
	public List<MenuBean> selectclass(String classes) {
		CriteriaBuilder builder = getSession().getCriteriaBuilder();
		CriteriaQuery<MenuBean> critera = builder.createQuery(MenuBean.class);
		Root<MenuBean> root = critera.from(MenuBean.class);
		critera.where(builder.equal(root.get("classes"), classes));
		return this.getSession().createQuery(critera).getResultList();
	}

}
