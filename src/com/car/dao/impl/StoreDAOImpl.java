package com.car.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.car.dao.StoreDAO;
import com.car.model.Pager;
import com.car.model.Store;
import com.car.model.StoreSer;
import com.car.util.Config;

@Component("storeDAO")
public class StoreDAOImpl implements StoreDAO
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

	// 添加店铺信息
	@Override
	public void addStore(Store store)
	{
		dataDAO.addItem(store);
	}

	// 添加店铺服务信息
	@Override
	public void addStoreSer(StoreSer storeSer)
	{
		dataDAO.addItem(storeSer);
	}

	// 加载店铺信息
	@Override
	public Map<String, Object> loadAllStores(Pager pager)
	{
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		String hql = " from Store where state=0";
		List<Store> stores = dataDAO.loadItems(hql, pager);
		hql = "select count(*)from Store where state=0";
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();

		Map<String, Object> res = new HashMap<>();
		res.put("stores", stores);
		res.put("pager", pager);
		return res;
	}

	//加载所有店铺列表
	@Override
	public List<Store> loadStores()
	{
		String hql = "from Store where state=0 order by company.id";
		return dataDAO.loadItems(hql);
	}

	// 店铺详情
	@Override
	public Store loadStoreById(int storeId)
	{
		String hql = "from Store where state=0 and id =" + storeId;
		List<Store> stores = dataDAO.loadItems(hql);
		if (stores != null && stores.size() > 0)
		{
			return stores.get(0);
		}
		return null;
	}

	// 店铺详情
	@Override
	public StoreSer loadStoreSerById(int storeSerId)
	{
		String hql = "from StoreSer where state=0 and id =" + storeSerId;
		List<StoreSer> storeSers = dataDAO.loadItems(hql);
		if (storeSers != null && storeSers.size() > 0)
		{
			return storeSers.get(0);
		}
		return null;
	}

	// 店铺服务列表
	@Override
	public List<StoreSer> loadStoreSers(int storeId)
	{
		String hql = " from StoreSer s where s.store.id=" + storeId + " and s.state=0";
		return dataDAO.loadItems(hql);
	}

	// 加载店铺服务
	@Override
	public Map<String, Object> loadStoreSers(int storeId, Pager pager)
	{
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		String hql = " from StoreSer s where s.state=0 and s.store.id=" + storeId + "order by s.createTime desc";
		List<Store> stores = dataDAO.loadItems(hql, pager);
		hql = "select count(*)from StoreSer s where s.state=0 and s.store.id=" + storeId;
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();
		Map<String, Object> res = new HashMap<>();
		res.put("storeSers", stores);
		res.put("pager", pager);
		return res;
	}

	// 更新店铺
	@Override
	public void updateStore(Store store)
	{
		dataDAO.updateItem(store);
	}

	// 删除店铺的所有服务
	@Override
	public void delStoreSer(int storeId)
	{
		String hql = " update StoreSer s set s.state=1 where s.store.id=" + storeId;
		dataDAO.updateData(hql);
	}

	@Override
	public void updateStoreSer(StoreSer storeSer)
	{
		dataDAO.updateItem(storeSer);
	}

	// 加载公司的所有店铺信息
	@Override
	public List<Store> loadCompanyStores(int companyId)
	{
		String hql = "from Store s where s.state=0 and s.company.id=" + companyId;
		return dataDAO.loadItems(hql);
	}

	// 加载公司的所有店铺信息
	@Override
	public Map<String, Object> loadCompanyStores(int companyId, Pager pager)
	{
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		String hql = " from Store s where s.state=0 and s.company.id= " + companyId;
		List<Store> stores = dataDAO.loadItems(hql, pager);
		hql = "select count(*)from Store s where state=0 and s.company.id=" + companyId;
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();

		Map<String, Object> res = new HashMap<>();
		res.put("stores", stores);
		res.put("pager", pager);
		return res;

	}

	@Override
	public Map<String, Object> loadCompanyStoreSers(int companyId, Pager pager)
	{
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		String hql = " from StoreSer s where s.state=0 and s.store.company.id= " + companyId;
		List<Store> stores = dataDAO.loadItems(hql, pager);
		hql = "select count(*)from StoreSer s where s.state=0 and s.store.company.id=" + companyId;
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();

		Map<String, Object> res = new HashMap<>();
		res.put("storeSers", stores);
		res.put("pager", pager);
		return res;
	}
	
	

}
