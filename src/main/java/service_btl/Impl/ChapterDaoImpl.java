package service_btl.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import service_btl.Dao.ChapterDao;
import service_btl.entities.Author;
import service_btl.entities.Chapter;
import service_btl.hibernate.util.HibernateUtil;

public class ChapterDaoImpl implements ChapterDao{

	@Override
	public List<Chapter> getAllChapter() {
		 SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	        Session session = sessionFactory.openSession();
	        try {
	            session.beginTransaction();
	            List list = session.createQuery("from Chapter").list();
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
	public Chapter findByChapterName(String chapterName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertChapter(Chapter chapter) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(chapter);
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
	public boolean updateChapter(Chapter chapter) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.update(chapter);
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
	public Chapter findByChapterId(Integer ChapterId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			Chapter chapter = session.get(Chapter.class, ChapterId);
			return chapter;
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
	public boolean deleteChapter(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
				session.beginTransaction();
				session.delete(findByChapterId(id));
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
	public List<Chapter> getChaptersbyStoryId(Integer storyId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
    try {
        session.beginTransaction();
		List list = session.createQuery("from Chapter where storyId = :storyId ORDER BY chapterNumber ASC")
				.setParameter("storyId", storyId).list();
				session.getTransaction().commit();
		return list;
	} catch (Exception e) {
    	System.out.println("Loi o day");
		e.printStackTrace();
		session.getTransaction().rollback();
	}finally {
		session.close();
	}

	return null;
	}

}
