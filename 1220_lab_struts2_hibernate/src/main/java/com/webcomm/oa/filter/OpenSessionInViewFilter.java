package com.webcomm.oa.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.webcomm.oa.util.HibernateUtil;

public class OpenSessionInViewFilter implements Filter {
	private SessionFactory factory = null;
	private Session session;

	public void destroy() {
		HibernateUtil.shutdown();
	}

	public void init(FilterConfig config) throws ServletException {
		factory = HibernateUtil.getSessionFactory();
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (((HttpServletRequest) request).getRequestURI().endsWith("action")) {
			Transaction tx = null;
			try {
				session = factory.getCurrentSession();
				tx = session.beginTransaction();
				chain.doFilter(request, response);
				tx.commit();
			} catch (Exception ex) {
				ex.printStackTrace();
				System.out.println(ex);
				if (tx != null && tx.isActive()) {
					tx.rollback();
				}
			} finally {
				tx = null;
			}
		} else {
			chain.doFilter(request, response);
		}
	}
}