package com.car.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.car.dao.CouponDAO;
import com.car.model.Coupon;
import com.car.model.Pager;
import com.car.util.Config;
import com.car.util.DateUtil;

@Component("couponDAO")
public class CouponDAOImpl implements CouponDAO
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

	// 添加优惠券
	@Override
	public void addCoupon(Coupon coupon)
	{
		dataDAO.addItem(coupon);
	}

	// 加载用户的优惠券
	@Override
	public Map<String, Object> loadStoreCoupon(int storeId, Pager pager)
	{
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		String str = "from Coupon c where c.store.id=" + storeId;
		/*
		 * if (type == 0) str += " and c.state=0"; else str += " and c.state!=0"
		 * ;
		 */
		String hql = str + " order by c.state, c.createTime desc";
		List<Coupon> coupons = dataDAO.loadItems(hql, pager);
		hql = "select count(*) " + str;
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();
		Map<String, Object> res = new HashMap<>();
		res.put("coupons", coupons);
		res.put("pager", pager);
		return res;
	}

	//移除过期的优惠券
	@Override
	public void removeCoupons()
	{
		String dateNow = DateUtil.DateToString(new Date());
		String hql = "update Coupon c set c.state=1 where c.state=0 and c.endDate<'" + dateNow + "'";
		dataDAO.updateData(hql);
	}

}
