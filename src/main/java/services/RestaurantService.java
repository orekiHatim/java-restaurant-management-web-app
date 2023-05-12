/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.IDao;
import entites.Restaurant;
import util.HibernateUtil;

public class RestaurantService implements IDao<Restaurant> {

	@Override
	public boolean create(Restaurant o) {
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
	public boolean delete(Restaurant o) {
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
	public boolean update(Restaurant o) {
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
	public Restaurant findById(int id) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Restaurant restaurant = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			tx = session.beginTransaction();
			restaurant = (Restaurant) session.get(Restaurant.class, id);
			tx.commit();
			return restaurant;
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
	public List<Restaurant> findAll() {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		List<Restaurant> restaurants = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			tx = session.beginTransaction();
			restaurants = session.createQuery("from Restaurant").list();
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			if (session != null)
				session.close();
		}
		return restaurants;
	}

}
