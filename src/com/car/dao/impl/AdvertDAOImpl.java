package com.car.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.car.dao.AdvertDAO;
import com.car.model.Advert;
import com.car.model.Pager;
import com.car.util.Config;
import com.car.util.DateUtil;

@Component("advertDAO")
public class AdvertDAOImpl implements AdvertDAO
{
	private DataDAO dataDAO;

	public DataDAO getDataDAO()
	{
		return dataDAO;
	}

	@Resource(name = "dataDAO")
	public void setDataDAO(DataDAO dataDAO)
	{
		this.dataDAO = dataDAO;
	}

	// 添加广告
	@Override
	public void addAdvert(Advert advert)
	{
		dataDAO.addItem(advert);
	}

	@Override
	public void updateAdvert(Advert advert)
	{
		dataDAO.updateItem(advert);
	}

	@Override
	public Advert loadAdvertById(int adId)
	{
		String hql = " from Advert a where a.id=" + adId;
		List<Advert> adverts = dataDAO.loadItems(hql);
		if (adverts != null && adverts.size() > 0)
		{
			return adverts.get(0);
		}
		return null;
	}

	// 加载广告
	@Override
	public Map<String, Object> loadAverts(Pager pager)
	{
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		String hql = "from Advert a order by a.state,a.createTime desc";
		List<Advert> adverts = dataDAO.loadItems(hql, pager);
		hql = "select count(*) from Advert a ";
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();
		Map<String, Object> res = new HashMap<>();
		res.put("pager", pager);
		res.put("adverts", adverts);
		return res;
	}

	// 用户加载广告
	@Override
	public List<Advert> loadAdverts(int id, int type)
	{
		String now = DateUtil.DateToString(new Date(), "yyyy-MM-dd");
		String str = "from Advert a where a.state=0 and a.showTime<='" + now + "' ";
		if (type == 0)
			str += " and a.store.id=" + id;
		else
			str += " and a.company.id=" + id;
		String hql = str + " order by a.createTime desc";
		List<Advert> adverts = dataDAO.loadItems(hql);
		return adverts;
	}

}
