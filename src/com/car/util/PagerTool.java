package com.car.util;

import java.util.Map;

import com.car.model.Pager;

public class PagerTool
{
	// 分页类
	private Pager pager;
	// 分页栏显示的条数
	private int pageBarSize = 7;
	// 显示的最小页码
	private int minPage;
	// 显示的最大页码
	private int maxPage;

	private String url;

	public PagerTool(Pager pager, String url)
	{
		this.pager = pager;
		this.url = url;
		int middle = pageBarSize / 2;
		if (pager.getPageNow() - middle > 0)
		{
			minPage = pager.getPageNow() - middle;
			if (pager.getPageNow() + middle < pager.getPageNum())
				maxPage = pager.getPageNow() + middle;
			else
			{
				maxPage = pager.getPageNum();
				if (pager.getPageNum() - pageBarSize > 0)
					minPage = pager.getPageNum() - pageBarSize + 1;
				else
					minPage = 1;
			}
		} else
		{
			minPage = 1;
			if (pager.getPageNum() > pageBarSize)
				maxPage = pageBarSize;
			else
				maxPage = pager.getPageNum();
		}
	}

	public String getPagerBar()
	{
		if (pager.getPageNum() <= 1)
			return "";
		String str = "";
		str = "";
		if (pager.getPageNow() > 1)
		{
			str += "<div class=\"prevPage\"><a href=\"" + url + "?pager.pageNow=";
			str += (pager.getPageNow() - 1) + getCondition() + "\">上一页</a></div>";
		} else
		{
			str += "<div class=\"prevPage\"><a>上一页</a></div>";
		}

		for (int i = minPage; i <= maxPage; i++)
		{
			if (pager.getPageNow() == i)
				str += "<div class=\"page-x dqy\">";
			else
				str += "<div class=\"page-x\">";
			str += "<a href=\"" + url + "?pager.pageNow=" + i + getCondition();
			str += "\">" + i + "</a></div>";
		}

		if (pager.getPageNow() < pager.getPageNum())
		{
			str += "<div class=\"nextPage\"><a href=\"" + url + "?pager.pageNow=";
			str += (pager.getPageNow() + 1) + getCondition() + "\">下一页</a></div>";
		} else
		{
			str += "<div class=\"nextPage\"><a>下一页</a></div>";
		}
		str += "<div class=\"pageAll\">共" + pager.getPageNum() + "页/" + pager.getTotalNum() + "条记录</div>";
		return str;
	}

	public void test()
	{
		String str = "";
		for (int i = minPage; i <= maxPage; i++)
		{
			if (pager.getPageNow() == i)
				str += "-" + i + "-";
			else
				str += i + " ";
		}
		System.out.println(str);
	}

	// 条件组装
	private String getCondition()
	{
		String str = "";
		for (Map.Entry<String, String> condition : pager.getCondition().entrySet())
		{
			str += "&pager.condition['" + condition.getKey() + "']=" + condition.getValue();
		}
		return str;
	}

	public static void main(String[] args)
	{
		Pager pager = new Pager();
		pager.setPageNow(1);
		pager.setTotalNum(3);
		pager.setPageSize(2);
		pager.caculatePageNum();
		PagerTool pagerTool = new PagerTool(pager, "/gwb/addUser");
		pagerTool.test();
	}

}
