package com.lucky.taobao.api;

import java.util.*;
import org.apache.log4j.Logger;

import com.lucky.Register;

public class MBaseInfo
{
	static Logger logger = Logger.getLogger(MBaseInfo.class.getName());
	
	Boolean sand = false;
    static String serverAddr = null;
    public String appKey(){
        if (sand == true)
            return "1021040246";
        return "21040246";
    }
    public String appSecret()
    {
        if (sand == true)
            return "sandboxbe27808c4e1d36262d1e46d94";
        return "dc32522be27808c4e1d36262d1e46d94";
    }
    public String url()
    {
        if (sand == true)
            return "http://gw.api.tbsandbox.com/router/rest";
        return "http://gw.api.taobao.com/router/rest";
    }
    public String dateBase()
    {
    	Properties p = System.getProperties();
    	String os = p.getProperty("os.name");
    	//logger.info ("OS:" + os);
    	if (os.contains("Window"))
    		return "C:/data/";
        return "/opt/data/";
    }
    public void setServerAddr(String str)
    {
        serverAddr = str;
    }
    public String getServerAddr()
    {
        return serverAddr;
    }
    
}
