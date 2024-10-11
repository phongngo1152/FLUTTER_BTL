package service_btl.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import service_btl.Dao.AccountDao;
import service_btl.entities.Account;
import service_btl.hibernate.util.HibernateUtil;
import org.mindrot.jbcrypt.BCrypt;

@Repository
public class AccountDaoImpl implements AccountDao {

	@Override
	public List<Account> getAllUser() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			List list = session.createQuery("from Account").list();
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
	public Account findByUserName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertUser(Account account) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			String hashedPassword = BCrypt.hashpw(account.getPassword(), BCrypt.gensalt());
			account.setPassword(hashedPassword);

			session.save(account);
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
	public boolean updateser(Account account) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();

		try {
			session.beginTransaction();
			session.update(account);
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
	public Account findByUserId(Integer accountId) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			Account user = session.get(Account.class, accountId);
			return user;
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
	public boolean deleteUser(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(findByUserId(id));
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
	public List<Account> getUserByName(String accountname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account checklogin(String username, String password) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Account account = null; // Khởi tạo biến account
		try {
			session.beginTransaction();

			String hql = "FROM Account WHERE email = :email";
			account = (Account) session.createQuery(hql)
					.setParameter("email", username)
					.uniqueResult();
			session.getTransaction().commit();

			if (account != null) {
				if (BCrypt.checkpw(password, account.getPassword())) {
					System.out.println("Đăng nhập thành công: " + account.toString());
				} else {
					System.out.println("Mật khẩu không đúng");
					account = null;
				}
			} else {
				System.out.println("Không tìm thấy tài khoản với email: " + username);
			}
		} catch (Exception e) {
			System.out.println("Lỗi khi kiểm tra đăng nhập");
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return account;
	}

	@Override
	public List<Account> getAccbyrRole(Integer role) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			// Thực hiện truy vấn HQL, sử dụng tham số :role để tránh SQL Injection
	        List<Account> list = session.createQuery("from Account where role = :role", Account.class)
	                                    .setParameter("role", role)
	                                    .list();

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

}
