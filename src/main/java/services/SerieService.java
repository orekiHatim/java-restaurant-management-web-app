package services;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.IDao;
import entites.Serie;
import util.HibernateUtil;

public class SerieService implements IDao<Serie> {

	@Override
	public boolean create(Serie o) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			tx = session.beginTransaction();
			session.save(o);
			tx.commit();
			return true;
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			if (session != null)
				session.close();
		}
		return false;
	}

	@Override
	public boolean delete(Serie o) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			tx = session.beginTransaction();
			session.delete(o);
			tx.commit();
			return true;
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			if (session != null)
				session.close();
		}
		return false;
	}

	@Override
	public boolean update(Serie o) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			tx = session.beginTransaction();
			session.update(o);
			tx.commit();
			return true;
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			if (session != null)
				session.close();
		}
		return false;
	}

	@Override
	public Serie findById(int id) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Serie serie = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			tx = session.beginTransaction();
			serie = (Serie) session.get(Serie.class, id);
			tx.commit();
			return serie;
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			if (session != null)
				session.close();
		}
		return null;
	}

	@Override
	public List<Serie> findAll() {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		List<Serie> series = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			tx = session.beginTransaction();
			series = session.createQuery("from Serie").list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			if (session != null)
				session.close();
		}
		return series;
	}

}
