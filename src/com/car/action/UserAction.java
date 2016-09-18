package com.car.action;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.model.Car;
import com.car.model.User;
import com.car.service.UserService;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("userAction")
@Scope("protoType")
public class UserAction extends ActionSupport
{
	private static final long serialVersionUID = 4925011665121779454L;

	// 上传文件集合
	private File file;
	// 上传文件名集合
	private String fileFileName;
	// 上传文件内容类型集合
	private String fileContentType;

	private String oldPwd;
	private User user;
	private Car car;
	private UserService userService;
	private String dateString;

	public String getDateString()
	{
		return dateString;
	}

	public void setDateString(String dateString)
	{
		this.dateString = dateString;
	}

	public File getFile()
	{
		return file;
	}

	public void setFile(File file)
	{
		this.file = file;
	}

	public String getFileFileName()
	{
		return fileFileName;
	}

	public void setFileFileName(String fileFileName)
	{
		this.fileFileName = fileFileName;
	}

	public String getFileContentType()
	{
		return fileContentType;
	}

	public void setFileContentType(String fileContentType)
	{
		this.fileContentType = fileContentType;
	}

	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	public Car getCar()
	{
		return car;
	}

	public void setCar(Car car)
	{
		this.car = car;
	}

	public String getOldPwd()
	{
		return oldPwd;
	}

	public void setOldPwd(String oldPwd)
	{
		this.oldPwd = oldPwd;
	}

	public UserService getUserService()
	{
		return userService;
	}

	@Resource(name = "userService")
	public void setUserService(UserService userService)
	{
		this.userService = userService;
	}

	/*
	 * // 检测会员卡号的状态 public void checkUserNo() { Map<String, Object> result = new
	 * HashMap<>(); try { result = userService.checkUserNo(user.getUserNo()); }
	 * catch (NullPointerException e) { result.put("status", 400);
	 * result.put("error", "参数错误"); e.printStackTrace(); } catch
	 * (RuntimeException e) { result.put("status", 400); result.put("error",
	 * "操作失败，稍后重试"); e.printStackTrace(); }
	 * ResultUtils.toJson(ServletActionContext.getResponse(), result); }
	 */

	// 用户注册
	public void userRegister()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.userRegister(user);
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 用户登录
	public void userLogin()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.userLogin(user);
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 用户信息
	public void userInfo()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.userInfo(user.getUserNo());
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);

	}

	// 文件上传
	public void uploadFile()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.uploadFile(file, fileFileName);
		} catch (Exception e)
		{
			result.put("status", 400);
			result.put("error", "文件上传失败，请检查文件");
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 更新用户头像
	public void changeIcon()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.changeIcon(user.getUserNo(), user.getIcon());
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 更新用户名
	public void changeUsername()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.changeUsername(user.getUserNo(), user.getUsername());
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 更新用户真实姓名
	public void changeName()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.changeName(user.getUserNo(), user.getName());
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 更新手机号
	public void changeMobilePhone()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.changeMobilePhone(user.getUserNo(), user.getMobilePhone());
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 更新密码
	public void changePassword()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.changePassword(user.getUserNo(), user.getPassword(), oldPwd);
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 更新检车时间
	public void changeCheckCarDate()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.changeCheckCarDate(user.getUserNo(), dateString);
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 更新检车时间
	public void changeReviewDate()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.changeReviewDate(user.getUserNo(), dateString);
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 找回密码
	public void findPassword()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = userService.findPassword(user.getUserNo(), user.getPassword());
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

}
