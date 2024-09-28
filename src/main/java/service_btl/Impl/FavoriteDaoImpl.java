package service_btl.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import service_btl.Dao.FavoriteDao;
import service_btl.entities.Favorite;
import service_btl.hibernate.util.HibernateUtil;

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

}
