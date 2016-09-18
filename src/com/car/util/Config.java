package com.car.util;

import com.car.util.FileUtils;

public final class Config
{
	// 资源文件路径
	public final static String RES_PATH = FileUtils.getRootPath() + "carcleaning_res/";

	// 用户头像路径
	public final static String USER_ICON = "user_icon/";

	// 店铺图片
	public final static String STORE_LOGO = "store_logo/";

	// 店铺服务图片
	public final static String STORE_SERVICE_ICON = "store_ser/";

	// 广告图片
	public final static String ADVERT_PIC = "advert_pic/";

	// 店铺每页显示条数
	public final static int STORE_PAGER_SIZE = 5;
	// 预约每页显示条数
	public final static int APPOINT_PAGER_SIZE = 5;

	// 后台每页显示条数
	public final static int ADMIN_PAGER_SIZE = 10;

	// 登录用户名密码保存时间
	public final static int REMEMBER_TIME = 7 * 24 * 60 * 60;

	// 极光推送信息
	public final static String JG_APPKEY = "d580e92a9e98eb31e86a5b54";
	public final static String JG_Master_Secret = "fd2c4cfb4851a20cc704d6a2";

}
