package services;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.IDao;
import entites.Admin;
import util.HibernateUtil;

public class AdminService implements IDao<Admin> {
	@Override
	public boolean create(Admin o) {
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
	public boolean delete(Admin o) {
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
	public boolean update(Admin o) {
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
	public Admin findById(int id) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Admin admin = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			tx = session.beginTransaction();
			admin = (Admin) session.get(Admin.class, id);
			tx.commit();
			return admin;
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
	public List<Admin> findAll() {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		List<Admin> admins = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			tx = session.beginTransaction();
			admins = session.createQuery("from Admin").list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			if (session != null)
				session.close();
		}
		return admins;
	}
}
