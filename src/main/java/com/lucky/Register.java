package com.lucky;

import java.io.*;
import java.util.*;
import com.lucky.taobao.api.*;
import org.apache.log4j.*;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class Register implements Action  {
	static Logger logger = Logger.getLogger(Register.class.getName());
	public String execute () throws Exception
	{
		logger.info ("Register Enter");
		ActionContext ctx = ActionContext.getContext();
		
		try{
			MTop_Screct top = new MTop_Screct();
			Map<String, Object> map = ctx.getParameters();
			String top_appkey = ((String [])map.get("top_appkey"))[0];
			String top_parameters = ((String [])map.get("top_parameters"))[0];
			String top_session = ((String[])map.get("top_session"))[0];
			String top_sign = ((String[])map.get("top_sign"))[0];
			String app_secret = new MBaseInfo().appSecret();
			boolean ret = top.CheckTopSign (top_appkey, top_parameters, top_session, app_secret, top_sign);
			if (!ret){
				throw new java.io.InvalidObjectException("MTop_Screct().CheckTopSign return false");		
			}
			
			logger.info("Convert top paramters:" + top_parameters);
			Map<String, String> m = top.convertBase64StringtoMap(top_parameters, null);
	        
			Set set =m.entrySet();
	        Iterator it=set.iterator();
	        while(it.hasNext()){
	            Map.Entry<String, String>  entry= (Map.Entry<String, String>) it.next();
	            logger.info(entry.getKey()+":"+entry.getValue());
	            
	        }
	        
	        String visitor_id = (String)m.get("visitor_id");
	        String visitor_nick = (String)m.get("visitor_nick");
	        logger.info ("ID  :" + visitor_id);
	        logger.info ("Nick:" + visitor_nick);
	        
	        logger.info ("Put the User Name to Session");
			ActionContext.getContext().getSession().put("user", visitor_id);
			
	        String ts = m.get("ts");
	        Date date = new Date();
	        long offset = Long.valueOf(ts) - date.getTime();
	        logger.info("Get the Offset of system with top" + offset);
	        
	        MUserData userXMLData = new MUserData();
	        userXMLData.CreateUser(visitor_id, visitor_nick, top_session, m);
	        userXMLData.SetTimeOffset (visitor_id, offset);
	        logger.debug (map.toString());
		}catch(Exception e){
			logger.error(e);
			return ERROR;
		}
		return SUCCESS;		
	}
}