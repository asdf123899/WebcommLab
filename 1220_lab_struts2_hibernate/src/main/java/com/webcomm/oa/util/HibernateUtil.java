package com.webcomm.oa.util;


import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * The Class HibernateUtil.
 */
public class HibernateUtil {

	/** The Constant sessionFactory. */
	private static final SessionFactory sessionFactory = buildSessionFactory();

	/**
	 * Builds the session factory.
	 *
	 * @return the session factory
	 */
	private static SessionFactory buildSessionFactory() {
		try {
			return new Configuration().configure().buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	/**
	 * Gets the session factory.
	 *
	 * @return the session factory
	 */
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * Shutdown.
	 */
	public static void shutdown() {
		getSessionFactory().close();
	}

}