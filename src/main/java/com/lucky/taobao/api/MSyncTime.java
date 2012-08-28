package com.lucky.taobao.api;

import java.util.*;
import java.io.*;
import java.lang.*;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.apache.log4j.*;
import com.taobao.api.request.*;
import com.taobao.api.response.*;
import com.taobao.api.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class MSyncTime  extends HttpServlet implements Runnable {
    static Date updateTime = null;
    static long offset = 0;
    static Logger logger = Logger.getLogger(MSyncTime.class.getName());
    static Thread t = null;

    public long getOffset ()
    {
        return offset;
    }
    
    public void UpdateTime()
    {
        if (t != null)return;
        if (updateTime == null)
        {
            logger.info ("force update time for first time");
            //t = new Thread (this, MProcessEvent.class.getName());
            //t.start ();
        }
        else{
            Date date = new Date ();
            //if (date.getDate() == updateTime.getDate())return;
            logger.info ("Update time when the day change");
            //t = new Thread (this, MProcessEvent.class.getName());
            //t.start ();
        }

    }

    public void run ()
    {
        Date date = new MTop_API().getTaobaoTime();
        if (date == null) {
            t = null;
            logger.error ("Get The Taobao Time Error");
            return;
        }
        else
        {
            Date datePc = new Date ();
            offset = date.getTime () - datePc.getTime ();
            logger.info ("Get the Taobao Time:" + date.getTime ());
            logger.info ("Get the System Time:" + datePc.getTime ());
            logger.info ("Two Time Offset:" + Long.toString(offset));
            updateTime = date;
        }
        t = null ;
        return;
    }

}

