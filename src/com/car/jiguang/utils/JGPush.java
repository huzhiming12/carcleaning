package com.car.jiguang.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.car.util.Config;

import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.Notification;

public class JGPush
{
	protected static final Logger LOG = LoggerFactory.getLogger(JGPush.class);

	@SuppressWarnings("deprecation")
	public static void JGPushMsg(String username,String msg)
	{
		JPushClient jpushClient = new JPushClient(Config.JG_Master_Secret, Config.JG_APPKEY, 3);

		// For push, all you need do is to build PushPayload object.
		PushPayload payload = buildPushObject_all_alias_alert(username,msg);

		try
		{
			PushResult result = jpushClient.sendPush(payload);
			LOG.info("Got result - " + result);

		} catch (APIConnectionException e)
		{
			// Connection error, should retry later
			LOG.error("Connection error, should retry later", e);

		} catch (APIRequestException e)
		{
			// Should review the error, and fix the request
			LOG.error("Should review the error, and fix the request", e);
			LOG.info("HTTP Status: " + e.getStatus());
			LOG.info("Error Code: " + e.getErrorCode());
			LOG.info("Error Message: " + e.getErrorMessage());
		}
	}

	public static PushPayload buildPushObject_all_alias_alert(String username,String msg)
	{
		return PushPayload.newBuilder().setPlatform(Platform.all()).setAudience(Audience.alias(username))
				.setNotification(Notification.alert(msg)).build();
	}

	public static void main(String[] args)
	{
		JGPushMsg("666666", "测试");
	}
}
