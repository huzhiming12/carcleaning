package com.car.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.car.dao.ParkingLotDAO;
import com.car.model.ParkingLot;

@Component("parkingLotDAO")
public class ParkingLotDAOImpl implements ParkingLotDAO
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

	// 添加洗车位信息
	@Override
	public void addParkingLot(ParkingLot lot)
	{
		dataDAO.addItem(lot);
	}

	// 加载店铺的洗车位
	@Override
	public List<ParkingLot> loadStoreParkingLots(int storeId)
	{
		String hql = " from ParkingLot p where p.store.id=" + storeId;
		return dataDAO.loadItems(hql);
	}

	@Override
	public ParkingLot loadParkingLotById(int id)
	{
		String hql = "from ParkingLot p where p.id="+id;
		List<ParkingLot>lots = dataDAO.loadItems(hql);
		if (lots!=null && lots.size()>0)
		{
			return lots.get(0);
		}
		return null;
	}

	@Override
	public void updateParkingLot(ParkingLot lot)
	{
		dataDAO.updateItem(lot);
	}

}
