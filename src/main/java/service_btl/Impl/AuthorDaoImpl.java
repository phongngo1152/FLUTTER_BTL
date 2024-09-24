package service_btl.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import service_btl.Dao.AuthorDao;
import service_btl.entities.Account;
import service_btl.entities.Author;
import service_btl.hibernate.util.HibernateUtil;

public class AuthorDaoImpl implements AuthorDao {

	@Override
	public List<Author> getAllAuthor() {
		 SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	        Session session = sessionFactory.openSession();
	        try {
	            session.beginTransaction();
	            List list = session.createQuery("from Author").list();
	            session.getTransaction().commit();
	            return list;
	        } catch (Exception e) {
	            // TODO: handle exception
	        	System.out.println("Loi bat dau tu day");
	            e.printStackTrace();
	            
	            session.getTransaction().rollback();
	        }finally {
	            session.close();
	        }
	        return null;
		
	}

	@Override
	public Author findByAuthorName(String authorname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertAuthor(Author author) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(author);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            // TODO: handle exception
        	System.out.println("Loi bat dau tu day");
            e.printStackTrace();
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return false;
	}

	@Override
	public boolean updateAuthor(Author author) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.update(author);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
        	System.out.println("Loi bat dau tu day");
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public Author findByAuthorId(Integer AuthorId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			Author author = session.get(Author.class, AuthorId);
			return author;
		} catch (Exception e) {
        	System.out.println("Loi bat dau tu day");
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean deleteAuthor(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
				session.beginTransaction();
				session.delete(findByAuthorId(id));
				session.getTransaction().commit();
				return true;
			
		} catch (Exception e) {
        	System.out.println("Loi bat dau tu day");

			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

}
