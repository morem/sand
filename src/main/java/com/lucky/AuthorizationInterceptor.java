package com.lucky;
import java.io.*;
import java.util.*;

import org.apache.log4j.*;
import java.util.Map;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.ActionContext;

public class AuthorizationInterceptor extends AbstractInterceptor {
    static Logger logger = Logger.getLogger(Register.class.getName());
    
    public String intercept(ActionInvocation invocation) throws Exception {
		logger.info("Now In the AuthorizationInterceptor");
		String visitor_id = (String) ActionContext.getContext().getSession()
				.get("user");
		logger.info("visitor_id=" + visitor_id);
		if (visitor_id == null){
		    ActionContext.getContext().getSession().put("user", "Guest");
		}   
    
        System.getProperties().put("proxySet","true");
        System.getProperties().put("proxyHost","172.21.80.247");
        System.getProperties().put("proxyPort","3128");
        return "success";
    }
}