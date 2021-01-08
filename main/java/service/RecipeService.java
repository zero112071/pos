package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.RecipeBean;
import model.dao.RecipeDao;

@Service
@Transactional
public class RecipeService {
	@Autowired
	private RecipeDao recipeDao;

	public RecipeBean insert(RecipeBean bean){
		RecipeBean result = null;
		if(bean!=null) {
			result = recipeDao.insert(bean);
		}
		return result;
	}
	public RecipeBean update(RecipeBean bean) {
		RecipeBean result = null;
		if (bean != null) {
			result = recipeDao.update(bean);
		}
		return result;
	}

	public boolean delete(RecipeBean bean) {
		boolean result = false;
		if (bean != null) {
			result = recipeDao.delete(bean.getTid());
		}
		return result;
	}

	public List<RecipeBean> select(String detailnum) {
		if (detailnum != null && detailnum.length()!=0) {
			List<RecipeBean> result = recipeDao.select(detailnum);
			if (result != null) {
				return result;
			}
			return null;
		}
		return null;
	}
	
	public List<RecipeBean> select() {
		List<RecipeBean> result = recipeDao.select();
		return result;
	}
}
