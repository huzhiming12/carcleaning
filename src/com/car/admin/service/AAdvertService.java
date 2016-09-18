package com.car.admin.service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.AdvertDAO;
import com.car.model.Advert;
import com.car.model.Pager;
import com.car.util.Config;
import com.car.util.FileUtils;

@Component("aAdvertService")
public class AAdvertService
{
	private AdvertDAO advertDAO;

	public AdvertDAO getAdvertDAO()
	{
		return advertDAO;
	}

	@Resource(name = "advertDAO")
	public void setAdvertDAO(AdvertDAO advertDAO)
	{
		this.advertDAO = advertDAO;
	}

	// 添加广告
	@Transactional
	public Map<String, Object> addAdvert(Advert advert, File file, String filename, File detail, String detailName)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		String path = Config.RES_PATH + Config.ADVERT_PIC;

		filename = System.currentTimeMillis() + "_" + new Random().nextInt(10000) + "."
				+ FileUtils.getExtensionName(filename);
		// 上传广告图片
		boolean uploadRes = FileUtils.uploadFile(file, path, filename);

		// 上传详情图片
		detailName = System.currentTimeMillis() + "_" + new Random().nextInt(10000) + "."
				+ FileUtils.getExtensionName(detailName);
		boolean uploadRes1 = FileUtils.uploadFile(detail, path, detailName);

		if (!uploadRes || !uploadRes1)
		{
			res.put("status", 400);
			res.put("error", "文件上传失败！");
		} else
		{
			advert.setCreateTime(new Date());
			advert.setAdPic(Config.ADVERT_PIC + filename);
			advert.setAdDetail(Config.ADVERT_PIC + detailName);
			advertDAO.addAdvert(advert);
		}
		return res;
	}

	// 加载广告列表
	@Transactional
	public Map<String, Object> loadAdverts(Pager pager)
	{
		return advertDAO.loadAverts(pager);
	}

	// 下架广告位
	@Transactional
	public void putOffAdvert(Advert advert)
	{
		advert = advertDAO.loadAdvertById(advert.getId());
		advert.setState(1);
		advertDAO.updateAdvert(advert);
	}

}
