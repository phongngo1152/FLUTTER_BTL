package service_btl.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import service_btl.Dao.CategoryDAO;
import service_btl.entities.Category;
import service_btl.entities.Chapter;
import service_btl.hibernate.util.HibernateUtil;

public class CategoryDaoImpl implements CategoryDAO{

	@Override
	public List<Category> getListCategory() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Category").list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Loi bat dau tu day");
			e.printStackTrace();

			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertCates(Category cate) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(cate);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Loi bat dau tu day");
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean updateCate(Category category) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.update(category);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			System.out.println("Loi bat dau tu day");
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}
	
	@Override
	public Category findByCateId(Integer categoryId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			Category cate = session.get(Category.class, categoryId);
			return cate;
		} catch (Exception e) {
			System.out.println("Loi bat dau tu day");
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return null;
	}
	
	@Override
	public boolean deleteCate(Integer categoryId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(findByCateId(categoryId));
			session.getTransaction().commit();
			return true;

		} catch (Exception e) {
			System.out.println("Loi bat dau tu day");

			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}
	
}
