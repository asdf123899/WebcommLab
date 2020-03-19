package com.webcomm.oa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.SortDefault;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webcomm.oa.searchbean.BaseSearchBean;
import com.webcomm.oa.service.BaseService;

public abstract class BaseController<E,B> {
	
	@SuppressWarnings("rawtypes")
	public abstract BaseSearchBean getSearchBeanInstance();
	
	public abstract E getTargetObjInstance();
	
	public abstract BaseService<E> getService();
	
	protected String getSearchBeanName() {
		return getControllerName() + "SearchBean";
	}
	
	protected String getControllerName() {
		Pattern p = Pattern.compile("/(.*)?(/.*)?");
		Matcher matcher = p.matcher(getControllerRoot());
		if (matcher.find()) {
			return matcher.group(1);
		}
		return null;
	}
	
	protected String getControllerRoot() {
		return this.getClass().getAnnotation(RequestMapping.class).value()[0];
	}
	
	
	protected String formatPage(String page) {
		return getControllerRoot() + StringUtils.capitalize(page);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@RequestMapping(value = {"/{page}"}) 
    public String getPage(@PathVariable("page") String page, @RequestParam(value="key", required = false) String key, HttpSession session, Model model) {
		String searchBeanName = getSearchBeanName();
		if ("index".equals(page)) {
			model.addAttribute("currentPage", getControllerRoot() + formatPage("search"));
			if (session.getAttribute(searchBeanName) == null) {
				session.setAttribute(searchBeanName, getSearchBeanInstance());
			}
			model.addAttribute("searchBean", session.getAttribute(searchBeanName));
			model.addAttribute("resultPage", new PageImpl(new ArrayList<>()));
		} else if ("create".equals(page)) {
			model.addAttribute("targetObj", getTargetObjInstance());
		} else if ("update".equals(page)) {
			model.addAttribute("targetObj", getService().get(key));
		}
		return getControllerRoot() + formatPage(page); 
    }
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/doSearch")
	public String doSearch(@ModelAttribute("searchBean") B searchBean, Pageable pageable, HttpSession session, Model model) {
		Page<?> page = getService().page(((BaseSearchBean)searchBean).getBaseSpecification(), pageable);
		model.addAttribute("resultPage", page);
		session.setAttribute(getSearchBeanName(), searchBean);
		return getControllerRoot() + "/caseReqSearchResult";
	}
	
	@RequestMapping(value = {"/doCreate", "/doUpdate"})
	@ResponseBody
	public String doCreateAndUpdate(@ModelAttribute("targetObj") E caseReq) {
		String msg = "";
		try {
			getService().save(caseReq);
		} catch (Exception e) {
			msg = "error: " + e.getMessage(); 
		}
		return msg;
	}
	
	@RequestMapping(value = {"/doDelete"})
	@ResponseBody
	public String doDelete(@RequestParam(value="keys") List<String> keys) {
		String msg = "";
		try {
			getService().delete(keys);
		} catch (Exception e) {
			msg = "error: " + e.getMessage(); 
		}
		return msg;
	}
	
}
