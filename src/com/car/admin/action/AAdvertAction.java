package com.car.admin.action;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.admin.service.AAdvertService;
import com.car.model.Advert;
import com.car.model.Pager;
import com.car.util.PagerTool;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("aAdvertAction")
@Scope("protoType")
public class AAdvertAction extends ActionSupport
{
	private static final long serialVersionUID = 1L;

	// 上传文件集合
	private File file;
	// 上传文件名集合
	private String fileFileName;
	// 上传文件内容类型集合
	private String fileContentType;
	private File detail;
	// 上传文件名集合
	private String detailFileName;
	// 上传文件内容类型集合
	private String detailContentType;

	private Advert advert;
	private Map<String, Object> map = new HashMap<>();
	private Pager pager;
	private PagerTool pagerTool;
	private AAdvertService aAdvertService;

	public File getDetail()
	{
		return detail;
	}

	public void setDetail(File detail)
	{
		this.detail = detail;
	}

	public String getDetailFileName()
	{
		return detailFileName;
	}

	public void setDetailFileName(String detailFileName)
	{
		this.detailFileName = detailFileName;
	}

	public String getDetailContentType()
	{
		return detailContentType;
	}

	public void setDetailContentType(String detailContentType)
	{
		this.detailContentType = detailContentType;
	}

	public Pager getPager()
	{
		return pager;
	}

	public void setPager(Pager pager)
	{
		this.pager = pager;
	}

	public PagerTool getPagerTool()
	{
		return pagerTool;
	}

	public void setPagerTool(PagerTool pagerTool)
	{
		this.pagerTool = pagerTool;
	}

	public Map<String, Object> getMap()
	{
		return map;
	}

	public void setMap(Map<String, Object> map)
	{
		this.map = map;
	}

	public Advert getAdvert()
	{
		return advert;
	}

	public void setAdvert(Advert advert)
	{
		this.advert = advert;
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

	public AAdvertService getaAdvertService()
	{
		return aAdvertService;
	}

	@Resource(name = "aAdvertService")
	public void setaAdvertService(AAdvertService aAdvertService)
	{
		this.aAdvertService = aAdvertService;
	}

	// 添加广告
	public void addAdvert()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = aAdvertService.addAdvert(advert, file, fileFileName,detail,detailFileName);
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，请稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 下架广告
	public void putOffAdvert()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			aAdvertService.putOffAdvert(advert);
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，请稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 广告管理界面
	public String advertManager()
	{
		map.put("res", aAdvertService.loadAdverts(pager));
		pagerTool = new PagerTool(pager, "AAdvert_advertManager");
		return SUCCESS;
	}

}
