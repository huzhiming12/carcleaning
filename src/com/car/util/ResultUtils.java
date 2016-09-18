package com.car.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ResultUtils
{

	public static void toJson(HttpServletResponse response, Object data)
	{
		//Gson gson = new Gson();
		GsonBuilder b = new GsonBuilder();
		b.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		Gson gson = b.create();
		
		String result = gson.toJson(data);


		response.setContentType("text/json; charset=utf-8");
		response.setHeader("Cache-Control", "no-cache"); // 取消浏览器缓存
		PrintWriter out;
		try
		{
			out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();

		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	public static void print(HttpServletResponse response, Object data)
	{
		response.setContentType("text/plain; charset=utf-8");
		response.setHeader("Cache-Control", "no-cache"); // 取消浏览器缓存
		PrintWriter out;
		try
		{
			out = response.getWriter();
			out.print(data.toString());
			out.flush();
			out.close();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}
}