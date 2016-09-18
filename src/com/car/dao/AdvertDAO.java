package com.car.dao;

import java.util.List;
import java.util.Map;

import com.car.model.Advert;
import com.car.model.Pager;

public interface AdvertDAO
{
	// 添加广告
	public void addAdvert(Advert advert);

	// 加载广告
	public Map<String, Object> loadAverts(Pager pager);

	// 更新
	public void updateAdvert(Advert advert);

	// 获取一条广告
	public Advert loadAdvertById(int adId);

	// 加载店铺广告 id:店铺或公司广告  type:0 店铺广告 1：公司广告
	public List<Advert> loadAdverts(int id,int type);

}
