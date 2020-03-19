package com.webcomm.oa.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BaseRepository<E, V> extends JpaRepository<E, V> {
	Page<E> findAll(Specification<E> spec, Pageable pageable);
	List<E> findAll(Specification<E> spec, Sort sort);
	
}
