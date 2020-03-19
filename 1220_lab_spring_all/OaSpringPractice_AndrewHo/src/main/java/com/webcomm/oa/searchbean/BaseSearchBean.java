package com.webcomm.oa.searchbean;

import java.lang.reflect.Field;

import org.springframework.data.jpa.domain.Specification;

public abstract class BaseSearchBean<E> {
	private Integer page = 0;
	private Integer size = 5;
	private String sort = "";
	
	public abstract Specification<E> getBaseSpecification();
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
}
