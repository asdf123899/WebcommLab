package com.webcomm.oa.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.webcomm.oa.util.HibernateUtil;

/**
 * The Class BaseDao.
 *
 * @param <T> the generic type
 */
public class BaseDao<T> {
	
	/**
	 * Gets the type parameter class.
	 *
	 * @return the type parameter class
	 */
	@SuppressWarnings("unchecked")
	public Class<T> getTypeParameterClass() {
		Type type = getClass().getGenericSuperclass();
		ParameterizedType paramType = (ParameterizedType) type;
		return (Class<T>) paramType.getActualTypeArguments()[0];
	}

	/**
	 * Query one.
	 *
	 * @param id the id
	 * @return the t
	 */
	public T queryOne(String id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		return session.load(getTypeParameterClass(), id);
	}

	/**
	 * Query all.
	 *
	 * @return the list
	 */
	public List<T> queryAll() {
		Class<T> claz = getTypeParameterClass();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<T> criteriaQuery = cb.createQuery(claz);
		Root<T> root = criteriaQuery.from(claz);
		criteriaQuery.select(root);
		Query<T> query = session.createQuery(criteriaQuery);
		List<T> list = query.getResultList();
		return list;
	}

	/**
	 * Save.
	 *
	 * @param obj the obj
	 */
	public void save(Object obj) {
		HibernateUtil.getSessionFactory().getCurrentSession().saveOrUpdate(obj);
	}

	/**
	 * Delete.
	 *
	 * @param id the id
	 */
	public void delete(String id) {
		HibernateUtil.getSessionFactory().getCurrentSession().delete(queryOne(id));
	}
}
