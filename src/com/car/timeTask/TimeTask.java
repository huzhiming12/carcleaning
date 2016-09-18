package com.car.timeTask;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.car.admin.service.AAppointmentService;
import com.car.admin.service.ACouponService;
import com.car.admin.service.AUserService;

/**
 * 
 * 定时任务
 *
 */
@Component("timeTask")
public class TimeTask
{
	private AAppointmentService appointmentService;
	private ACouponService aCouponService;
	private AUserService aUserService;

	public AUserService getaUserService()
	{
		return aUserService;
	}

	@Resource(name = "aUserService")
	public void setaUserService(AUserService aUserService)
	{
		this.aUserService = aUserService;
	}

	public ACouponService getaCouponService()
	{
		return aCouponService;
	}

	@Resource(name = "aCouponService")
	public void setaCouponService(ACouponService aCouponService)
	{
		this.aCouponService = aCouponService;
	}

	public AAppointmentService getAppointmentService()
	{
		return appointmentService;
	}

	@Resource(name = "aAppointmentService")
	public void setAppointmentService(AAppointmentService appointmentService)
	{
		this.appointmentService = appointmentService;
	}

	// 完成预约
	@Scheduled(cron = "0 0/20 * * * ?")
	public void finishAppointment()
	{
		appointmentService.finishAppointment();
		// System.out.println("ssss");
	}

	// 移除过期的优惠券
	@Scheduled(cron = "0 0/10 * * * ?")
	public void removeCoupons()
	{
		aCouponService.removeCoupons();
	}

	// 每天8点定时消息推送
	@Scheduled(cron = "0 0 8 * * ?")
	public void pushMsg()
	{
		//System.out.println("sdfsdf");
		aUserService.pushMsg();
	}

}
