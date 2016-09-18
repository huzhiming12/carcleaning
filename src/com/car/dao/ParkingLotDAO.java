package com.car.dao;

import java.util.List;

import com.car.model.ParkingLot;

public interface ParkingLotDAO
{
	// 添加洗车位
	public void addParkingLot(ParkingLot lot);

	// 加载店铺的洗车位
	public List<ParkingLot> loadStoreParkingLots(int storeId);
	
	public ParkingLot loadParkingLotById(int id);
	
	public void updateParkingLot(ParkingLot lot);
}
