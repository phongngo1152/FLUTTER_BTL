package service_btl.Impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import service_btl.Dao.AccountDao;
import service_btl.entities.Account;
import service_btl.entities.LoginDTOAPIFlutter;
import service_btl.entities.RegisterDTOAPIFlutter;
import service_btl.hibernate.util.HibernateUtil;


@Repository
public class AccountDaoImpl implements AccountDao {
	
	public void saveAdminAccount(Account account) {
		System.out.println("Saving account: " + account.getUserName());
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(account);
            session.getTransaction().commit();
            System.out.println("Account saved successfully!");
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

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
		 BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		try {
			session.beginTransaction();
			 String hashedPassword = passwordEncoder.encode(account.getPassword());
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
	    Account account = null; 
	    
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    
	    try {
	        session.beginTransaction();

	        String hql = "FROM Account WHERE email = :email";
	        account = (Account) session.createQuery(hql)
	                .setParameter("email", username)
	                .uniqueResult();
	        session.getTransaction().commit();


	        if (account != null) {
	            if (passwordEncoder.matches(password, account.getPassword())) {
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
	
	@Override
	public boolean registerFlutter(RegisterDTOAPIFlutter registerDTO) {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    Transaction transaction = null;
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    try {
	        transaction = session.beginTransaction();

	        String hashedPassword = passwordEncoder.encode(registerDTO.getPassword());
	        registerDTO.setPassword(hashedPassword);
	        
	        Account account = new Account();
	        account.setUserName(registerDTO.getUserName());
	        account.setEmail(registerDTO.getEmail());
	        account.setPassword(hashedPassword);  
	        account.setRole(2);
	        account.setCreateAt(new Date());
	        account.setStatus(1);

	        session.save(account);
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
	
	
	
	public Account loginAPIFlutter(LoginDTOAPIFlutter loginDTO) {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    Transaction transaction = null;
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	    try {
	        transaction = session.beginTransaction(); 

	        Query<Account> query = session.createQuery("FROM Account WHERE userName = :username AND role = 2 AND status = 1", Account.class);
	        query.setParameter("username", loginDTO.getUserName());
	        
	        Account user = query.uniqueResult();
	        
	        if (user != null && passwordEncoder.matches(loginDTO.getPassword(), user.getPassword())) {
	            transaction.commit();  
	            return user; 
	        }

	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        System.out.println("Lỗi bắt đầu từ đây");
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return null;
	}
	
	
	
	public boolean checkByUserName(String username) {
		System.out.println("Checking if user exists: " + username);
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    try {
	        Query<Account> query = session.createQuery("FROM Account WHERE userName = :username", Account.class);
	        query.setParameter("username", username);
	        Account user = query.uniqueResult();
	        return user != null;
	    } catch (Exception e) {
	        System.out.println("Lỗi bắt đầu từ đây");
	        e.printStackTrace();
	        session.getTransaction().rollback();
	    } finally {
	        session.close();
	    }
	    return false;
	}

	public boolean checkByUserEmail(String email) {
	    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	    Session session = sessionFactory.openSession();
	    try {
	        Query<Account> query = session.createQuery("FROM Account WHERE email = :email", Account.class);
	        query.setParameter("email", email);
	        Account user = query.uniqueResult();
	        return user != null;
	    } catch (Exception e) {
	        System.out.println("Lỗi bắt đầu từ đây");
	        e.printStackTrace();
	        session.getTransaction().rollback();
	    } finally {
	        session.close();
	    }
	    return false;
	}

}
