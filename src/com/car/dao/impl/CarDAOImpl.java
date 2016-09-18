package com.car.dao.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.car.dao.CarDAO;
import com.car.model.Car;

@Component("carDAO")
public class CarDAOImpl implements CarDAO
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

	// 添加车辆信息
	@Override
	public void addCar(Car car)
	{
		car.setCreateTime(new Date());
		dataDAO.addItem(car);
	}

	// 获取用户的车辆列表
	@Override
	public List<Car> loadCarsByUserNo(String usesrNo)
	{
		String hql = "from Car c where c.state=0 and c.user.userNo='" + usesrNo + "' order by c.createTime";
		return dataDAO.loadItems(hql);
	}

	// 更新车辆信息
	@Override
	public void updateCarInfo(Car car)
	{
		dataDAO.updateItem(car);
	}

	// 获取车辆信息
	@Override
	public Car loadCarById(int carId)
	{
		String hql = "from Car where id=" + carId;
		List<Car> cars = dataDAO.loadItems(hql);
		if (cars != null && cars.size() > 0)
		{
			return cars.get(0);
		}
		return null;
	}


}
