package model.dao;

import java.util.List;

import model.MenuBean;

public interface MenuDao {
	MenuBean insert(MenuBean bean); 
	MenuBean update(MenuBean bean);  //picture 用url
	boolean delete(Integer cid);
	MenuBean select (Integer cid);
	List<MenuBean> select();
	List<MenuBean> selectclass(String classes);
}
