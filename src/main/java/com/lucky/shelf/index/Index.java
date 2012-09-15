package com.lucky.shelf.index;
import org.apache.log4j.*;

import com.opensymphony.xwork2.Action;

public class Index  implements Action {
	static Logger logger = Logger.getLogger(Index.class.getName());
	public String execute () throws Exception
	{
		return SUCCESS;		
	}
}
