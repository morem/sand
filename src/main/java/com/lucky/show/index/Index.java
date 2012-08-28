package com.lucky.show.index;

import java.io.*;
import java.util.*;

import com.lucky.Register;
import com.lucky.taobao.api.*;
import org.apache.log4j.*;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class Index implements Action{
	static Logger logger = Logger.getLogger(Index.class.getName());
	public int getShowcase_num()
	{
		return 30;
	}
	
	public String getTalk ()
	{
		return "我不知道你在说什么";
	}
	
	public String execute () throws Exception
	{
		logger.info("Now In the Show Index");
        try{
        	String visitor_id = (String)ActionContext.getContext().getSession().get("user");
        	logger.info("visitor id=" + visitor_id);
        	
        	
        	
        }catch (Exception e){
        	logger.error(e);
        }
		return SUCCESS;		
	}
}
