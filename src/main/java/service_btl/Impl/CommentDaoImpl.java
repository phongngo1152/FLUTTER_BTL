package service_btl.Impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import service_btl.Dao.CommentDao;
import service_btl.entities.Account;
import service_btl.entities.Chapter;
import service_btl.entities.Comment;
import service_btl.entities.CommentDTOInsertAPI;
import service_btl.entities.Story;
import service_btl.hibernate.util.HibernateUtil;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Override
	public List<Comment> getAllComment() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Comment").list();
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
	public Comment findByCommentName(String commentName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertComment(Comment comment) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(comment);
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
	public boolean updateComment(Comment comment) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.update(comment);
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
	public Comment findByCommentId(Integer commentId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			Comment comment = session.get(Comment.class, commentId);
			return comment;
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
	public boolean deleteComment(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(findByCommentId(id));
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
	public List<Comment> getCommentbyStoryId(Integer storyId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Comment where storyId = :storyId ORDER BY create_at DESC")
					.setParameter("storyId", storyId).list();
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
	public List<Comment> getCommentbyAccId(Integer acId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Comment where acId = :acId")
					.setParameter("acId", acId).list();
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
	public boolean insertCommentAPI(CommentDTOInsertAPI commentDTO) {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    Transaction transaction = null;

	    try {
	        transaction = session.beginTransaction();

	        Account account = new Account();
	        account.setAcId(commentDTO.getAccountId());

	        Story story = new Story();
	        story.setStoryId(commentDTO.getStoryId());

	        Chapter chapter = new Chapter();
	        chapter.setChapterId(commentDTO.getChapterId());

	        Comment comment = new Comment();
	        comment.setAccount(account);
	        comment.setStory(story);
	        comment.setChapter(chapter);
	        comment.setContent(commentDTO.getContent());
	        comment.setCreateAt(new Date()); 
	        comment.setStatus(1); 

	        session.save(comment);
	        transaction.commit();
	        return true;
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        System.out.println("Lỗi bắt đầu từ đây");
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return false;
	}
	
	@Override
	public List<Comment> getCommentsbyUserId(Integer accId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Comment where acId = :userId").setParameter("userId", accId).list();
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

}
