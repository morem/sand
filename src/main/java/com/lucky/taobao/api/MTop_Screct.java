package com.lucky.taobao.api;

import java.io.*;
import java.net.URLDecoder;
import java.util.*;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.StringUtils;
import org.apache.commons.codec.digest.DigestUtils;
import com.taobao.api.*;
import org.apache.log4j.*;

public class MTop_Screct{
    
    static Logger logger = Logger.getLogger(MTop_Screct.class.getName());
	  /**
	 * 把经过BASE64编码的字符串转换为Map对象
	 *
	 * @param str callback url上top_parameters的值
	 * @param encode callback url上encode的值，如果不存在此参数请传null
	 * @return
	 */
	public Map<String, String> convertBase64StringtoMap(String top_parameters, String encode) 
	{
		URLDecoder urlDecoder = new URLDecoder();
	    if (top_parameters == null)
	        return null;
        if (encode == null)
        	encode = "GBK";
        
        String keyvalues = null;
        try {
        	keyvalues = new String(Base64.decodeBase64(urlDecoder.decode(top_parameters, "utf-8").getBytes(encode)), encode);
        } catch (UnsupportedEncodingException e) {
        	e.printStackTrace();
        }
        String[] keyvalueArray = keyvalues.split("\\&");
        Map<String, String> map = new HashMap<String, String>();
        for (String keyvalue : keyvalueArray) {
                 String[] s = keyvalue.split("\\=");
                 if (s == null || s.length != 2)
                          return null;
                 map.put(s[0], s[1]);
        }
        return map;
	}    

	public boolean CheckTopSign( String top_appkey, 
		                         String top_parameters,
		                         String top_session,
		                         String app_secret,
		                         String top_sign)
	{
	    DigestUtils md = new DigestUtils();
	    logger.info("top_appkey:"+ top_appkey);
	    logger.info("top_parameters:"+ top_parameters);
	    logger.info("top_session:"+ top_session);
	    logger.info("app_secret:"+ app_secret);
	    logger.info("top_sign:"+ top_sign);
	    
		byte[] digest = md.md5(top_appkey+top_parameters+top_session+app_secret);
		Base64  base64 = new Base64();
		String result = base64.encodeBase64String(digest);
		
		if (result.equals(top_sign))
		{
			return true;
		}
        return false;
	}	
}