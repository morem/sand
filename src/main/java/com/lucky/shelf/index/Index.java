package com.lucky.shelf.index;
import org.apache.log4j.*;

public class Index {
	static Logger logger = Logger.getLogger(Index.class.getName());
	public String execute () throws Exception
	{
		logger.debug("-debug---------------------------------------------");
		logger.info ("-info---------------------------------------------");
		logger.warn("-error---------------------------------------------");
		return "error";		
	}
}
