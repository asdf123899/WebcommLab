package com.webcomm.oa.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;

import com.webcomm.oa.repository.BaseRepository;

public abstract class BaseService<E> {
	
	@SuppressWarnings("unchecked")
	public List<E> listAll() {
		return getRepository().findAll();
	}
	
	@SuppressWarnings("unchecked")
	public Page<E> page(Specification<E> spec, Pageable pageable) {
		return getRepository().findAll(spec, pageable);
	}
	
	@SuppressWarnings("unchecked")
	public List<E> listAll(Specification<E> spec, String orderBy) {
		return getRepository().findAll(spec, Sort.by(orderBy));
	}
	
	@SuppressWarnings("unchecked")
	public void save(E obj) {
		getRepository().save(obj);
	}
	
	@SuppressWarnings("unchecked")
	public E get(String id) {
		return (E) getRepository().getOne(id);
	}
	
	@SuppressWarnings("unchecked")
	public void delete(List<String> ids) {
		ids.stream().forEach(id-> getRepository().deleteById(id));
	}
	
	@SuppressWarnings("unchecked")
	public void delete(String id) {
		getRepository().deleteById(id);
	}
	
	@SuppressWarnings("rawtypes")
	public abstract BaseRepository getRepository();
}
