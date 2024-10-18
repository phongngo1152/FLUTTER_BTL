package service_btl.Impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import service_btl.Dao.FavoriteDao;
import service_btl.entities.Account;
import service_btl.entities.Favorite;
import service_btl.entities.FavoriteDTOInsertAPI;
import service_btl.entities.Story;
import service_btl.hibernate.util.HibernateUtil;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {

	@Override
	public List<Favorite> getFavourite() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Favorite").list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Loi o day");
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Favorite> getFavouritesbyUserId(Integer accId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Favorite where acId = :userId").setParameter("userId", accId).list();
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
	public boolean insertFavourites(Favorite favourite) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(favourite);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Loi o day");
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean updateFavourite(Favorite favourite) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteFavourite(Integer favouriteId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.delete(getFavouriteById(favouriteId));
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			System.out.println("Loi o day");

			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public Favorite getFavouriteById(Integer favouriteId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Favorite favourite = session.get(Favorite.class, favouriteId);
			return favourite;
		} catch (Exception e) {
			System.out.println("Loi o day");

			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	@Override
	public List<Favorite> getFavouriteStoryId(Integer storyId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Favorite where storyId = :storyId ORDER BY create_at DESC")
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
	public boolean insertFavouriteAPI(FavoriteDTOInsertAPI favoriteDTO) {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    Transaction transaction = null;

	    try {
	        transaction = session.beginTransaction();

	        // Kiểm tra xem bản ghi đã tồn tại chưa
	        if (isFavoriteExists(favoriteDTO.getAccountId(), favoriteDTO.getStoryId())) {
	            return false; // Nếu đã tồn tại, không thêm mới
	        }

	        Account account = new Account();
	        account.setAcId(favoriteDTO.getAccountId());

	        Story story = new Story();
	        story.setStoryId(favoriteDTO.getStoryId());

	        Favorite favorite = new Favorite();
	        favorite.setAccount(account);
	        favorite.setStory(story);
	        favorite.setCreateAt(new Date()); 
	        favorite.setStatus(1); // Mặc định status là 1 (có thể thay đổi nếu cần)

	        session.save(favorite);
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
	
	private boolean isFavoriteExists(int accountId, int storyId) {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    try {
	        String hql = "SELECT COUNT(f) FROM Favorite f WHERE f.account.acId = :accountId AND f.story.storyId = :storyId";
	        Query<Long> query = session.createQuery(hql, Long.class);
	        query.setParameter("accountId", accountId);
	        query.setParameter("storyId", storyId);
	        Long count = query.uniqueResult();
	        return count != null && count > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return false;
	}

}
