package model.dao;

import java.util.Date;
import java.util.List;

import model.SalesBean;

public interface SalesDao {
	SalesBean insert(SalesBean bean);
	SalesBean update(SalesBean bean );
	List<SalesBean> select(Date date1,Date date2);
	List<SalesBean> select();
}
