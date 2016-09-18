package com.car.admin.service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.AdminDAO;
import com.car.dao.ParkingLotDAO;
import com.car.dao.StoreDAO;
import com.car.model.Pager;
import com.car.model.ParkingLot;
import com.car.model.Store;
import com.car.model.StoreSer;
import com.car.util.Config;
import com.car.util.FileUtils;

@Component("aStoreService")
public class AStoreService
{
	private StoreDAO storeDAO;
	private ParkingLotDAO parkingLotDAO;
	private AdminDAO adminDAO;

	public AdminDAO getAdminDAO()
	{
		return adminDAO;
	}

	@Resource(name = "adminDAO")
	public void setAdminDAO(AdminDAO adminDAO)
	{
		this.adminDAO = adminDAO;
	}

	public ParkingLotDAO getParkingLotDAO()
	{
		return parkingLotDAO;
	}

	@Resource(name = "parkingLotDAO")
	public void setParkingLotDAO(ParkingLotDAO parkingLotDAO)
	{
		this.parkingLotDAO = parkingLotDAO;
	}

	public StoreDAO getStoreDAO()
	{
		return storeDAO;
	}

	@Resource(name = "storeDAO")
	public void setStoreDAO(StoreDAO storeDAO)
	{
		this.storeDAO = storeDAO;
	}

	// 添加店铺信息
	@Transactional
	public Map<String, Object> addStore(Store store, File file, String filename)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		String path = Config.RES_PATH + Config.STORE_LOGO;
		filename = System.currentTimeMillis() + "_" + new Random().nextInt(10000) + "."
				+ FileUtils.getExtensionName(filename);
		// 上传文件
		boolean uploadRes = FileUtils.uploadFile(file, path, filename);
		if (!uploadRes)
		{
			res.put("status", 400);
			res.put("error", "文件上传失败！");
		} else
		{
			// 添加店铺信息
			store.setLogo(Config.STORE_LOGO + filename);
			store.setCreateTime(new Date());
			storeDAO.addStore(store);
			// 添加洗车位信息
			for (int i = 1; i <= 6; i++)
			{
				ParkingLot lot = new ParkingLot();
				if (i > 4)
					lot.setType(1);
				lot.setParkNo(i);
				lot.setStore(store);
				parkingLotDAO.addParkingLot(lot);
			}
		}
		return res;
	}

	// 添加店铺服务信息
	@Transactional
	public Map<String, Object> addStoreSer(StoreSer storeSer, File file, String filename)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		List<StoreSer> sers = storeDAO.loadStoreSers(storeSer.getStore().getId());
		if (sers!=null && sers.size()>=10)
		{
			res.put("status", 400);
			res.put("error", "店铺服务数量已达上限10，请删除后再添加!");
			return res;
		}
		String path = Config.RES_PATH + Config.STORE_SERVICE_ICON;
		filename = System.currentTimeMillis() + "_" + new Random().nextInt(10000) + "."
				+ FileUtils.getExtensionName(filename);
		// 上传文件
		boolean uploadRes = FileUtils.uploadFile(file, path, filename);
		if (!uploadRes)
		{
			res.put("status", 400);
			res.put("error", "文件上传失败！");
		} else
		{
			storeSer.setIcon(Config.STORE_SERVICE_ICON + filename);
			storeSer.setCreateTime(new Date());
			storeDAO.addStoreSer(storeSer);
		}
		return res;
	}
	//加载所有店铺列表
	@Transactional
	public List<Store>loadStores()
	{
		return storeDAO.loadStores();
	}

	// 分页加载店铺
	@Transactional
	public Map<String, Object> loadStores(Pager pager)
	{
		return storeDAO.loadAllStores(pager);
	}

	// 加载公司所有店铺
	@Transactional
	public List<Store> loadCompanyStores(int companyId)
	{
		return storeDAO.loadCompanyStores(companyId);
	}

	// 加载公司所有店铺
	@Transactional
	public Map<String, Object> loadCompanyStores(int companyId, Pager pager)
	{
		return storeDAO.loadCompanyStores(companyId, pager);
	}

	// 加载店铺服务
	@Transactional
	public Map<String, Object> loadStoreSers(int storeId, Pager pager)
	{
		return storeDAO.loadStoreSers(storeId, pager);
	}
	
	//加载公司店铺服务列表
	@Transactional
	public Map<String, Object>loadCompanyStoreSer(int companyId,Pager pager)
	{
		return storeDAO.loadCompanyStoreSers(companyId, pager);
	}
	
	// 加载店铺车位
	@Transactional
	public List<ParkingLot> loadStoreParkingLot(int storeId)
	{
		List<ParkingLot> lots = parkingLotDAO.loadStoreParkingLots(storeId);
		return lots;
	}

	// 锁定（解锁）店铺
	@Transactional
	public Map<String, Object> lockParkingLot(int parkingLotId, int flag)
	{
		ParkingLot lot = parkingLotDAO.loadParkingLotById(parkingLotId);
		lot.setState(flag);
		parkingLotDAO.updateParkingLot(lot);
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		return res;
	}

	@Transactional
	public void delStore(Store store)
	{
		store = storeDAO.loadStoreById(store.getId());
		store.setState(1);
		// 更新店铺
		storeDAO.updateStore(store);
		// 删除店铺服务
		storeDAO.delStoreSer(store.getId());
		// 删除店铺管理员
		adminDAO.delStoreAdmin(store.getId());
	}

	@Transactional
	public void delStoreSer(StoreSer storeSer)
	{
		storeSer = storeDAO.loadStoreSerById(storeSer.getId());
		storeSer.setState(1);
		storeDAO.updateStoreSer(storeSer);
	}

}
