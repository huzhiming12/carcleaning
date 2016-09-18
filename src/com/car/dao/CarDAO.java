package com.car.dao;

import java.util.List;

import com.car.model.Car;

public interface CarDAO
{
	// 添加车辆信息
	public void addCar(Car car);

	// 获取用户车辆列表
	public List<Car> loadCarsByUserNo(String userNo);
	
	//更新车辆信息
	public void updateCarInfo(Car car);
	
	//获取车辆信息
	public Car loadCarById(int carId);
	

}
