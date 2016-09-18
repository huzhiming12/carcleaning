package com.car.dao;

import java.util.List;
import java.util.Map;

import com.car.model.Pager;
import com.car.model.Store;
import com.car.model.StoreSer;

public interface StoreDAO
{
	// 添加店铺信息
	public void addStore(Store store);

	// 添加店铺服务信息
	public void addStoreSer(StoreSer storeSer);

	public Map<String, Object> loadAllStores(Pager pager);

	//加载所有店铺列表
	public List<Store> loadStores();

	// 加载店铺详情
	public Store loadStoreById(int storeId);

	// 更新信息
	public void updateStore(Store store);

	// 删除店铺服务
	public void delStoreSer(int storeId);

	// 更新店铺服务
	public void updateStoreSer(StoreSer storeSer);

	// 店铺服务详情
	public StoreSer loadStoreSerById(int storeSerId);

	// 加载店铺服务列表
	public List<StoreSer> loadStoreSers(int storeId);

	// 加载全部店铺服务
	public Map<String, Object> loadStoreSers(int storeId, Pager pager);

	// 加载公司的所有店铺信息
	public List<Store> loadCompanyStores(int companyId);

	// 加载公司的所有店铺服务列表
	public Map<String, Object> loadCompanyStores(int companyId, Pager pager);

	// 加载公司的所有店铺服务
	public Map<String, Object> loadCompanyStoreSers(int companyId, Pager pager);

}
