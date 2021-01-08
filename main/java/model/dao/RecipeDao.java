package model.dao;

import java.util.List;

import model.RecipeBean;

public interface RecipeDao{
	RecipeBean insert(RecipeBean bean);
	RecipeBean update(RecipeBean bean);
	boolean delete(Integer tid);
//	RecipeBean select(String detailnum);
	List<RecipeBean> select();
	List<RecipeBean> select(String detailnum);
}
