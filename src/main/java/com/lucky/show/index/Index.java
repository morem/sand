package com.lucky.show.index;

import java.io.*;
import java.util.*;

import com.lucky.Register;
import com.lucky.taobao.api.*;

import org.apache.log4j.*;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.taobao.api.domain.*;

public class Index implements Action {
	private static Logger logger = Logger.getLogger(Index.class.getName());
	private static Map<String, String> showCaseNum = null;

	public int getShowcase_num() {
		return 30;
	}

	public String getRunStatus() {
		String visitor_id = (String) ActionContext.getContext().getSession()
				.get("user");
		if (true == new MUserData().GetShowCaseRunStatus(visitor_id))
			return "run";
		else
			return "stop";
	}

	public String getShowMode() {
		String visitor_id = (String) ActionContext.getContext().getSession()
				.get("user");
		String mode = new MUserData().GetShowCaseMode(visitor_id);
		return mode;
	}

	public String setShowMode(String mode) {
		String visitor_id = (String) ActionContext.getContext().getSession()
				.get("user");
		logger.info("user:" + visitor_id + "  mode:" + mode);
		if (mode != "all" && mode != "cats" && mode != "user") {
			logger.error("mode error");
		}
		new MUserData().SetShowCaseMode(visitor_id, mode);
		return getShowMode();
	}

	public String setToggleRunStatus(String status) {
		String visitor_id = (String) ActionContext.getContext().getSession()
				.get("user");
		MUserData t = new MUserData();
		t.SetShowCaseRunStatus(visitor_id, !t.GetShowCaseRunStatus(visitor_id));
		return getRunStatus();
	}

	public List<Map<String, String>> getAllItemsInShow() {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		logger.info("Enter");
		String visitor_id = (String) ActionContext.getContext().getSession()
				.get("user");
		ActionContext.getContext().getSession().put("keyword", "null");
		ActionContext.getContext().getSession().put("cats", "all");
		ActionContext.getContext().getSession().put("inshow", "true");
		ActionContext.getContext().getSession().put("sort", "ingore");
		ActionContext.getContext().getSession().put("page", "20");
		ActionContext.getContext().getSession().put("total_num", "0");

		List<MItem> item = new MTop_API().getItems(visitor_id, null, -1L, null,
				-1L, 1L, null, 20L);
		logger.info(item.toString());
		for (MItem m : item) {
			logger.info("url:" + m.pic_url);
			logger.info("title:" + m.title);
			Map<String, String> t = new HashMap<String, String>();
			t.put("pic_url", m.pic_url);
			t.put("num_iid", m.num_iid);
			t.put("title", m.title);
			t.put("hasShowcase", m.hasShowcase.toString());
			t.put("status", m.status.toString());
			list.add(t);
			ActionContext.getContext().getSession().put("total_num", m.total_num.toString());
		}
		return list;
	}
	

	public String showcaseInit() {
		logger.info("Enter");
		String visitor_id = (String) ActionContext.getContext().getSession()
				.get("user");
		logger.info("visitor_id=" + visitor_id);
		try {
			MUser usr = new MTop_API().getUserShowNum(visitor_id);
			showCaseNum = new HashMap<String, String>();
			showCaseNum.put("showCaseNum", Long.toString(usr.showCaseNum));
			showCaseNum.put("showCaseUsed", Long.toString(usr.showCaseUsed));
			showCaseNum.put("showCaseRemained",
					Long.toString(usr.showCaseRemained));
		} catch (Exception e) {
			showCaseNum = new HashMap<String, String>();
			showCaseNum.put("showCaseNum", Long.toString(0L));
			showCaseNum.put("showCaseUsed", Long.toString(0L));
			showCaseNum.put("showCaseRemained", Long.toString(0L));
		}
		return SUCCESS;
	}

	public Map<String, String> getShowcase() {
		if (showCaseNum == null)
			showcaseInit();
		logger.info("Enter");
		logger.info(showCaseNum.toString());
		return showCaseNum;
	}

	public List getCats() {
		List list = new ArrayList();
		String visitor_id = (String) ActionContext.getContext().getSession()
							.get("user");
		logger.info("Get Cats");
		if (visitor_id.equals("Guest"))
			return list;
		List<SellerCat> sellerCats = new MTop_API().GetTheUserCats(visitor_id);
		if (sellerCats == null) {
			logger.error("Get the error Catas:" + visitor_id);
			return list;
		}

		for (Object obj : sellerCats) {
			SellerCat sellerCat;
			sellerCat = (SellerCat) obj;
			Map map = new HashMap();
			map.put("cid", sellerCat.getCid().toString());
			map.put("name", sellerCat.getName());
			map.put("parent_cid", sellerCat.getParentCid().toString());
			if (0 == sellerCat.getParentCid())
			{
				List l = new ArrayList();
				map.put("sons", l);
				list.add (map);
			}
			logger.info("cid" + sellerCat.getCid().toString());
			logger.info("name" + sellerCat.getName());
			logger.info("pcid:" + sellerCat.getParentCid());
		}
		
		for (Object obj : sellerCats){
			SellerCat sellerCat;
			sellerCat = (SellerCat) obj;
			Map map = new HashMap();
			map.put("cid", sellerCat.getCid().toString());
			map.put("name", sellerCat.getName());
			map.put("parent_cid", sellerCat.getParentCid().toString());
			if (0 != sellerCat.getParentCid())
			{
				for (Object m : list){
					Map<String, String> t = (Map<String, String>)m;
					if (map.get("cid") == t.get("cid"))
					{
						List l = (List)map.get("cid");
						l.add(map);
					}
				}
			}			
		}
		
		return list;
	}

	public String execute() throws Exception {
		logger.info("Now In the Show Index execute");
		String visitor_id = (String) ActionContext.getContext().getSession()
				.get("user");
		logger.info("visitor_id=" + visitor_id);		 
		return SUCCESS;
	}
}
