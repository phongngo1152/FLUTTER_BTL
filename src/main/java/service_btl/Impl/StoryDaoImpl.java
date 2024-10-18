package service_btl.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import service_btl.Dao.StoryDao;
import service_btl.entities.Story;
import service_btl.hibernate.util.HibernateUtil;

@Repository
public class StoryDaoImpl implements StoryDao{

	@Override
	public List<Story> getAllStory() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Story").list();
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
	public List<Story> findByStoryName(String name) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    List<Story> stories = null; 
	    try {
	        session.beginTransaction();
	        stories = session.createQuery("from Story s where s.title like :name and s.status = 1", Story.class)
	                .setParameter("name", "%" + name + "%") 
	                .getResultList();
	        session.getTransaction().commit();
	    } catch (Exception e) {
	        System.out.println("Lỗi bắt đầu từ đây");
	        e.printStackTrace();
	        if (session.getTransaction() != null) {
	            session.getTransaction().rollback(); 
	        }
	    } finally {
	        session.close();
	    }
	    return stories; 
	}

	@Override
	public boolean insertStory(Story story) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(story);
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
	public boolean updateStory(Story story) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.update(story);
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
	public boolean updateStoryStatus(Integer storyId, Boolean newStatus) {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    
	    try {
	        // Tìm kiếm story theo ID
	        Story story = session.get(Story.class, storyId);
	        if (story == null) {
	            return false; // Nếu không tìm thấy story, trả về false
	        }
	        
	        // Cập nhật trạng thái
	        story.setStatus(newStatus);
	        
	        // Bắt đầu transaction và cập nhật
	        session.beginTransaction();
	        session.update(story);
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
	public Story findByStoryId(Integer storyId ) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			Story story = session.get(Story.class, storyId);
			return story;
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
	public boolean deleteStory(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(findByStoryId(id));
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
	public List<Story> getStorysbyCategoryId(Integer categoryId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Story where categoryId = :categoryId")
					.setParameter("categoryId", categoryId).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			System.out.println("Loi o day");
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}

		return null;
	}
	
	
	@Override
	public List<Story> getStorysbyAuthorId(Integer authorId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Story where authorId = :authorId and status = 1")
					.setParameter("authorId", authorId).list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			System.out.println("Loi o day");
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}

		return null;
	}
	
	@Override
	public Story findByStoryIdAPI(Integer storyId) {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    try {
	        session.beginTransaction();
	        Story story = session.createQuery("from Story s where s.storyId = :storyId and s.status = 1", Story.class)
	                .setParameter("storyId", storyId)
	                .uniqueResult();
	        session.getTransaction().commit();
	        return story;
	    } catch (Exception e) {
	        System.out.println("Lỗi bắt đầu từ đây");
	        e.printStackTrace();
	        session.getTransaction().rollback();
	    } finally {
	        session.close();
	    }
	    return null;
	}
	
	@Override
	public List<Story> getStoryAPI() {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    try {
	        session.beginTransaction();
	        List list = session.createQuery("from Story where status = 1").list();
	        session.getTransaction().commit();
	        return list;
	    } catch (Exception e) {
	        // TODO: handle exception
	        System.out.println("Lỗi bắt đầu từ đây");
	        e.printStackTrace();

	        session.getTransaction().rollback();
	    } finally {
	        session.close();
	    }
	    return null;
	}
	
	
	// giang
	@Override
	public List<Story> getTop5StoryNew() {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    try {
	        session.beginTransaction();
	        List<Story> list = session.createQuery("from Story where status = 1 order by id desc", Story.class)
	                                  .setMaxResults(5)
	                                  .list();
	        session.getTransaction().commit();
	        return list;
	    } catch (Exception e) {
	        e.printStackTrace();
	        session.getTransaction().rollback();
	    } finally {
	        session.close();
	    }
	    return null;
	}
	
	// giang
	@Override
	public List<Story> getTop5StoryFavorite() {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    
	    try {
	        session.beginTransaction();

	       
	        List<Story> list = session.createQuery(
	                "select s from Story s join Favorite f on s.storyId = f.story.storyId " +
            		"where s.status = 1 " +
	                "group by s.storyId, s.title, s.description, s.coverImage, s.createAt, s.updateAt, s.status, s.author, s.category " +
	                "order by count(f.favoriteId) desc", Story.class)
	                .setMaxResults(5)
	                .list();
	        
	        session.getTransaction().commit();
	        return list;
	    } catch (Exception e) {
	        e.printStackTrace();
	        session.getTransaction().rollback();
	    } finally {
	        session.close();
	    }
	    return null;
	}
	
}
