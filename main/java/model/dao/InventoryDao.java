package model.dao;

import java.util.List;



import model.InventoryBean;

public interface InventoryDao {
	InventoryBean insert(InventoryBean bean);
	InventoryBean select(String ingredients);
	InventoryBean update(InventoryBean bean);
	List<InventoryBean> select();
}
