package services;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.IDao;
import entites.Photo;
import util.HibernateUtil;

public class PhotoService implements IDao<Photo> {
	@Override
	public boolean create(Photo o) {
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
	public boolean delete(Photo o) {
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
	public boolean update(Photo o) {
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
	public Photo findById(int id) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Photo photo = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			tx = session.beginTransaction();
			photo = (Photo) session.get(Photo.class, id);
			tx.commit();
			return photo;
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
	public List<Photo> findAll() {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		List<Photo> photos = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			tx = session.beginTransaction();
			photos = session.createQuery("from Photo").list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			if (session != null)
				session.close();
		}
		return photos;
	}
}
